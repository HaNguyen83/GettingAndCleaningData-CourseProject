---
title: "ReadMe"
author: "Ha Nguyen"
date: "July 26, 2015"
output: word_document
---
```{r eval = FALSE}
## TASK 1: merging train data and test data sets into one data set 
## read data from train sets
subjectTrain_dat <- read.table("./train/subject_train.txt")
xTrain_dat <- read.table("./train/X_train.txt")
yTrain_dat <- read.table("./train/y_train.txt")
training_dat <- cbind(subjectTrain_dat,yTrain_dat,xTrain_dat)
## read data from test sets
subjectTest_dat <- read.table("./test/subject_test.txt")
xTest_dat <- read.table("./test/X_test.txt")
yTest_dat <- read.table("./test/y_test.txt")
testing_dat <- cbind(subjectTest_dat,yTest_dat,xTest_dat)
## merging
all_data <- rbind(training_dat,testing_dat)

## TASK 2: Extracts only the measurements on the mean and standard deviation for each measurement. In order to complete this task, the first step is to assign the column names (feature names) to all columns in the all_data set (achieved from Task 1). There are 563 comlums in total (561 features + Subject + Activity). Then, only columns of the the measurements on the mean and standard deviation are extracted. 
## read all feature names
features <- read.table("features.txt")
featureNames_vector <- as.vector(features$V2)
featureNames_vector <- c("SubjectID", "Activity", featureNames_vector)
## assign column names for all_data set
colnames(all_data) <- featureNames_vector
## extract only columns of the the measurements on the mean and standard deviation are extracted into the variable called subset_data_meanstd
subset_featureNames <- grep("mean\\(\\)|std\\(\\)",names(all_data), value = TRUE)
Subset_featureNames <- c("SubjectID", "Activity", subset_featureNames)
subset_data_meanstd <- all_data[,Subset_featureNames]

## TASK 3 : Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
subset_data_meanstd$Activity <- activity_labels[subset_data_meanstd[,2],2]

## TASK 4: Appropriately labels the data set with descriptive variable names
## The goal is to remove the () bracket
good_colNames <- gsub("\\(|\\)", "",names(subset_data_meanstd))
colnames(subset_data_meanstd) <- good_colNames

# TASK 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. In order to complete this task, the package called "Reshape2" should be installed and invoke (to use melt and dcast functions)

install.packages("reshape2")
library(reshape2)
melted_data <- melt(subset_data_meanstd, id=c("SubjectID","Activity"))
average_data <- dcast(melted_data, SubjectID + Activity ~ variable, mean)
write.table(average_data, file = "TidyDataSet.txt", row.names = FALSE)
```

