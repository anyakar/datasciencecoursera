Code book 
========================================================

This code book describes the variables, the data, and transformations performed to clean up the data.

The "tidydata" dataset includes the following variables:

subject - identifies the subject who performed the activity, ranges from 1 to 30 
activitylabel - labels activities that were performed 
bodyacc[axis][summary statistic] - statistics for triaxial body acceleration measurements 
bodygyro[axis][summary statistic] - statistics for triaxial angular velocity from the gyroscope totalacc
[axis][summary statistic] - statistics for triaxial total boy acceleration 

where
[axis] - x, y or z axis, denoted by "x", "y", "z" in the name of variable 
[summary statistic] - mean or standard deviation, denoted by "mean" or "sd" in the name of variable

###Data dictionary

######subject
  ID of the subject who performed the activity in the study, ranges from 1 to 30
    1 .. 30 .subject ID
    
######activitylabel
  acitivity performed, factor variable   
```
    laying            .laying
    sitting           .sitting
    standing          .standing
    walking           .walking
    walkingdownstairs .walking downstairs
    walkingustairs    .walking upstairs
```
######bodyaccxmean
  mean statistic for the body acceleration measured on the x axis during the activity
  computed 
    numeric
    -0.0115359 .. 0.0049223

######bodyaccxsd
  standard deviation statistic for the body acceleration measured on the x axis during the activity
    numeric
    0.002685 .. 0.527934

######bodyaccymean
  mean statistic for the body acceleration measured on the y axis during the activity
    numeric
    -0.01226 .. 0.008303

######bodyaccysd
  standard deviation statistic for the body acceleration measured on the y axis during the activity
    numeric
    0.003387 .. 0.276867

######bodyacczmean
  mean statistic for the body acceleration measured on the y axis during the activity
    numeric
    -0.01460 .. 0.01088

######bodyacczsd
  standard deviation statistic for the body acceleration measured on the z axis during the activity
    numeric
    0.005225 .. 0.291242
  
######bodygyroxmean
  mean statistic for angular velocity from the gyroscope measured on the x axis during the activity
    numeric
    -0.183684 .. 0.227288
    
######bodygyroxsd
  standard deviation statistic for angular velocity from the gyroscope measured on the x axis during the activity
    numeric
    0.006657 .. 1.101257

######bodygyroymean
  mean statistic for angular velocity from the gyroscope measured on the y axis during the activity
    numeric
    -0.05863 .. 0.04597

######bodygyroysd
  standard deviation statistic for angular velocity from the gyroscope measured on the y axis during the activity
    numeric
    0.006418 .. 1.127879

######bodygyrozmean
  mean statistic for angular velocity from the gyroscope measured on the z axis during the activity
    numeric
    -0.0702777 .. 0.0410588 

######bodygyrozsd
  standard deviation statistic for angular velocity from the gyroscope measured on the z axis during the activity
    numeric
    0.009159 .. 0.756929

######totalaccxmean
  mean statistic for the total body acceleration measured on the x axis during the activity
    numeric
    -0.1462 .. 1.0250

######totalaccxsd
  standard deviation statistic for the total body acceleration measured on the x axis during the activity
    numeric
    0.002398 .. 0.527467

######totalaccymean
  mean statistic for the total body acceleration measured on the y axis during the activity
    numeric
    -0.467050 .. 0.977055

######totalaccysd
  standard deviation statistic for the total body acceleration measured on the y axis during the activity
    numeric
    0.002864 .. 0.275566

######totalacczmean
  mean statistic for the total body acceleration measured on the z axis during the activity
    numeric
    -0.49337 .. 0.93605

######totalacczsd
  standard deviation statistic for the total body acceleration measured on the z axis during the activity
    numeric
    0.004009 .. 0.285557
