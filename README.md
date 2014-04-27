# Getting and Cleaning Data_Project

1. Source of data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The source data had been downloaded to the working directory.

2. Set the working directory to "D:/2014_Coursera/Getting and Cleaning Data/Week 3/Project/UCI HAR Dataset"

3. In Rstudio, run "run_analysis.R". The scripts preform the following steps to clean up the the original data from the project, and create a new tidy data that give the average of each variable for each activity and each subject
- Merges the training and the test sets to create data sets for X, y and Subject
- Extracts only the measurements on the mean and standard deviation for each measurement
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data sets with descriptive activity names
- Creates the final tidy data with the average values by activity and subject 

4. Note: Use data <- read.table("final_tidy_data_avg.txt") to read the data frame. The dimention of the final data is 180X50