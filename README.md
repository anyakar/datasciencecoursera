Coursera, Getting and Cleaning Data: 
Class project

## READ ME


This script assumes the data is either in a zip file "UCI HAR Dataset.zip" or in a folder called "UCI HAR Dataset" in the current working directory.

run_analysis.R script:

1. Merges the training and the test sets to create one data set.
The script recurses through both "train" and "set" directories, reads the data and stores in a large list (tempData) of 4 data frames, separated by set and type of variable. Two of these data frames include ID variables - subject ID, activity ID and set (train, test) and two include measured variables - data for each of 9 inertial signals that were measured in the study for each of the 2 sets: triaxial (x, y, z) body acceleration, triaxial angular velocity from the gyroscope and triaxial total body acceleration. There are total of 7352 observations for the train set and 2947 observations for the test set.
The summary variables are computed (see #2 below) and the raw data measurements are dropped.
The data frames are then binded into one dataset ("data") of 10299 observations for 22 variables -  4 id variables + 18 measured variables (see #4 below).

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Standard deviation and mean variables are computed for each of the 3 triaxial measurements (9 total). Only these variables are inlcuded in the resulting dataset ("data"). These are dentoted with "sd" and "mean" in the name of the variable.

3. Uses descriptive activity names to name the activities in the data set
Activity labels are added using merge based on the activity IDs after the data file is constructed.

4. Appropriately labels the data set with descriptive variable names. 
Variable names for measured variable are constructed on original data file names and underscores ("_") are removed. For new summary variables, "mean" and "sd" are appended respectively. Descriptive names for ID variables are also added.

The dataset includes the following variables:

activityid - ID of the activity performed, ranges 1 to 6.
activitylabel - labels activities that were performed (walking, walking upstairs, walking downstairs, sitting, standing, laying)
subject - identifies the subject who performed the activity, ranges from 1 to 30.
set - identifies what which set of measurements the observations belongs to - test or train
bodyacc[axis][summary statistic] - statistics for triaxial body acceleration measurements
bodygyro[axis][summary statistic] - statistics for triaxial angular velocity from the gyroscope
totalacc[axis][summary statistic] - statistics for triaxial total boy acceleration
  [axis] - x, y or z axis, denoted by "x", "y", "z" in the name of variable
  [summary statistic] - mean or standard deviation, denoted by "mean" or "sd" in the name of variable


5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
The second dataset ("tidydata") is created using melting and casting functions from the reshape2 R package. 
First, the dataset is melted into a tall and skiny dataset with subject and activity label as ID variables and mean and SD of 9 as measure variables. The resulting dataset holds 185382 observations of 4 variables. 
Then, the summary of each variable is computed for each activity and each subject. 

The second tidy dataset is written into a text file ("tidydata.txt") using. To read, please use "read.table".

