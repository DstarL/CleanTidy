#File name: run_analysis.R
#Author: David Lyons
#Description: Week4 - Getting and Cleaning Data
#Date created: 2021-04-18
#Date last modified: 2021-04-19

# Libraries to include
library(dplyr)
library(stringr)
library(tidyr)
library(lubridate)
library(data.table)
library(readr)

# Dataset Download and read files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip("./data/Dataset.zip")

# Read data common to test or train
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "")

# Read Test data
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", sep = "")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")

# x_test column names
colnames(x_test) <- features$V2
colnames(s_test) <- "subjectNumber"
colnames(y_test) <- "activity"

# Select only mean and standard deviation columns
x_test <- select(x_test, contains("std") | contains("mean"))

# Add columns and create column for test or train
traintest <- vector(mode = "character", length = nrow(x_test))
traintest[1:length(traintest)] <- "Test"
DTtest <- cbind(y_test, x_test)
DTtest <- cbind(traintest, DTtest)
DTtest <- cbind(s_test, DTtest)

# Read Train data
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", sep = "")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")

# x_train column names
colnames(x_train) <- features$V2
colnames(s_train) <- "subjectNumber"
colnames(y_train) <- "activity"

# Select only mean and standard deviation columns
x_train <- select(x_train, contains("std") | contains("mean"))

# Add columns and create column for test or train
traintest <- vector(mode = "character", length = nrow(x_train))
traintest[1:length(traintest)] <- "Train"
DTtrain <- cbind(y_train, x_train)
DTtrain <- cbind(traintest, DTtrain)
DTtrain <- cbind(s_train, DTtrain)

# Merge Test and Train data
DT <- rbind(DTtest, DTtrain)

# Remove double brackets from column names
names(DT) <- sub("\\()", "", names(DT))

# Use descriptive activity names
DT[1:nrow(DT),3] <- activity_label[DT[1:nrow(DT),3],2]

# Second table with average values for activity and subject
DT2_act <- aggregate(DT[,4:89], by = list(DT$activity), FUN = mean)
DT2_sub <- aggregate(DT[,4:89], by = list(DT$subjectNumber), FUN = mean)
DT2 <- rbind(DT2_act, DT2_sub)
names(DT2)[names(DT2) == "Group.1"] <- "SubjectActivity"
colnames(DT2) <- paste("Avrg", colnames(DT2), sep = "_")

# Output data tables
write.csv(DT, "samsung_data.csv")
write.csv(DT2, "samsung_data_average.csv")

