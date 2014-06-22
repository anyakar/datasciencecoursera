## Coursera: Getting and Cleaning Data
## Class project R script

# Checking whether the dataset is present in the working directory
if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("UCI HAR Dataset.zip")) {
    stop("Can't find 'UCI HAR Dataset' folder or zip file. Please download the dataset to your working directory and re-run this script.")
  } else {
    unzip("UCI HAR Dataset.zip")
  }
}
# Prepare necessary data objects
data <- data.frame()
tempData <- list()
sets = c("train", "test")
colname = c("subject","activityid","activitylabel")

# Read in activity labels and clean up data -- lower case for the labels and remove underscores
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = colname[2:3])
activityLabels$activitylabel <- tolower(levels(activityLabels$activitylabel))
activityLabels$activitylabel <- gsub("_", "", activityLabels$activitylabel)
activityLabels$activitylabel <- as.factor(activityLabels$activitylabel)

# For each of the two sets of data, test and train, create a list of data frames: 
#(1) ID variables: subject ID, activity ID, activity label and a factor variable, describing whether this observation belonged to a training (train) or test set. 
#(2) Measured variables: mean and standard deviation for each of the nine captured variables (18 total).
for (j in 1:2){ 
  subjectJ <- read.table(paste(c("./", "UCI HAR Dataset/", sets[j],"/subject_", sets[j], ".txt"), collapse = ""), col.names = colname[1]) #produces a vector
  activityJ <- read.table(paste(c("./", "UCI HAR Dataset/", sets[j],"/y_", sets[j], ".txt"), collapse = ""), col.names = colname[2]) #produces a vector
  
  tempData[j] = list(data.frame(subject=subjectJ, activityid=activityJ, set=c(sets[j])))
  
  # For each of the observations for a given variable, find mean and standard deviation and add them to the tidy dataset, first for training set (train) and then for test set (test).
  temp <- data.frame()
  temp2 <- data.frame()
  #tempData <- data.frame()
  tempnames <- c()
  for (i in 1:9) {
    files = c("body_acc_x_", "body_acc_y_", "body_acc_z_", "body_gyro_x_", "body_gyro_y_", "body_gyro_z_", "total_acc_x_", "total_acc_y_", "total_acc_z_")
    temp <- read.table(paste(c("./", "UCI HAR Dataset/", sets[j], "/Inertial Signals/", files[i], sets[j], ".txt"), collapse = ""))
    temp$Mean <- rowMeans(temp)
    temp$Sd <- apply(temp, 1, sd, na.rm = TRUE) #1 is for rows
    # remove all columns except for mean and sd 
    temp <- temp[,129:130]
    # rename columns
    tempcolnameMean = gsub("_", "", paste(c(files[i], "mean"), collapse = ""))
    colnames(temp)[sum(1)] <- tempcolnameMean 
    tempcolnameSd = gsub("_", "", paste(c(files[i], "sd"), collapse = ""))
    colnames(temp)[sum(2)] <- tempcolnameSd
    tempnames <- c(tempnames, tempcolnameMean, tempcolnameSd)
    if (i==1) {temp2 <- temp} else {temp2 <- cbind(temp2, temp)}
  }
  tempData[j+2] <- list(temp2)
}

# Convert the resulting list of 4 data frames to a tidy data frame 
data <- cbind(rbind(data.frame(tempData[1]), data.frame(tempData[2])), rbind(data.frame(tempData[3]), data.frame(tempData[4])))
data = merge(activityLabels, data, by.x="activityid", by.y="activityid")
data$subject <- as.factor(data$subject)
data$activityid <- as.factor(data$activityid)

# Resulting "data" data frame holds 10299 observations of 22 variables -  4 id variables + 18 measured variables.

# Melting the dataset into a tall and skiny dataset with subject and activity label as ID variables and mean and SD of 9 as measure variables. The resulting dataset holds 185382 observations of 4 variables. 
library(reshape2)
dataMelt <- melt(data, id=c("subject","activitylabel"),  measure.vars=names(data[5:22]))

# Summary - casting by subject, activity label - mean of each variable
tidydata <- dcast(dataMelt, subject + activitylabel ~ variable, mean)

# Write tidy data set to a file
write.table(tidydata, file = "tidydata.txt",row.names=FALSE)

