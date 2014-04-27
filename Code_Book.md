# Code Book for final_tidy_data_avg

## about the source data
data for the project from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## data variables
From the raw dataset, only the measurements on the mean and standard deviation for each measurement selected.In the cleaned dataset, there are 50 variables in total, which includs:

Categorical/level features: column 1 and column 50 
- column 1: "subject": the person id recruited for the experiment 30 levels (1-30) 
- column 50: "activity": "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"

Numerical features: coulmn 2- column 49
- measurement feature similar to: tbodyacc-mean()-x, tbodyacc-mean()-y, tbodyacc-mean()-z, tbodyacc-std()-x, tbodyacc-std()-y, tbodyacc-std()-z

## data tranformation and cleaning 
The attached run_analysis.R performs the following steps to clean up the data from the project.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
- "features.txt": This file lists all the 10299 obs. and 561 features, but selected only those "-mean()" or "-std()" features
- "X_train.txt": 7352 obs. of 561 features (only the 48 selcted features from "features.txt")
- "X_test.txt" : 2947 obs. of 561 features (only the 48 selcted features from "features.txt")
- "y_train.txt" and "y_test.txt": 6 training activity labels. 
- "subject.test.txt" and "subject_train.test": people performed the experiments (1-30)
- "activity_labels.txt": activity number (1-6) represented "walking","walkingupstairs","walkingdownstairs","sitting","standing","laying" in the data
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.

## create a tidy data
5. Finally, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


  