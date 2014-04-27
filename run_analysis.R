# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The source data had been downloaded to the working directory 

# Set the working directory
setwd("D:/2014_Coursera/Getting and Cleaning Data/Week 3/Project/UCI HAR Dataset")

# Merges the training and the test sets to create data sets for X, y and Subject
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
X <- rbind(X_train,X_test)

y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")
y <- rbind(y_train,y_test)

sub_train <- read.table("./train/subject_train.txt")
sub_test <- read.table("./test/subject_test.txt")
sub <- rbind(sub_train,sub_test)

# From features.txt, we know that some of the variables in the data are means and standard deviations of each measurement.
# Extracts only the measurements on the mean and standard deviation for each measurement
f <- read.table("./features.txt")
f_i <- grep("-mean\\(\\)|-std\\(\\)",f$V2)
f_extract <- f[f_i,]
X <- X[, f_i]

# Uses descriptive activity names to name the activities in the data set
act <- read.table("./activity_labels.txt")
y$V1 <- factor(y$V1,levels=act$V1,labels=act$V2) # assign y values with activities

# Appropriately labels the data sets with descriptive activity names
names(X) <- f_extract$V2   # assign names to X variables
colnames(sub) <- "Subject"
colnames(y) <- "Activity"

# Combine to create the first tidy dataset
dataset <- cbind(sub, X, y)
dataset <- na.omit(dataset)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
full_names <- names(dataset)
varnames <- full_names[2:49]
DFMelt <- melt(dataset, id=c("Activity","Subject"), measure.vars=varnames)
tidy_data_by_grps <- dcast(DFMelt, Subject + Activity ~ variable, mean)
write.table(tidy_data_by_grps, file="final_tidy_data_avg.txt")
