## task 1
## read data from training files
subjectTrain_dat <- read.table("./train/subject_train.txt")
xTrain_dat <- read.table("./train/X_train.txt")
yTrain_dat <- read.table("./train/y_train.txt")
training_dat <- cbind(subjectTrain_dat,yTrain_dat,xTrain_dat)

## read data from testing files
subjectTest_dat <- read.table("./test/subject_test.txt")
xTest_dat <- read.table("./test/X_test.txt")
yTest_dat <- read.table("./test/y_test.txt")
testing_dat <- cbind(subjectTest_dat,yTest_dat,xTest_dat)

## merging training data and testing data
all_data <- rbind(training_dat,testing_dat)


## task 2
features <- read.table("features.txt")
featureNames_vector <- as.vector(features$V2)
featureNames_vector <- c("SubjectID", "Activity", featureNames_vector)
## assign column names for all_data set
colnames(all_data) <- featureNames_vector
##extract mean and std
subset_featureNames <- grep("mean\\(\\)|std\\(\\)",names(all_data), value = TRUE)
Subset_featureNames <- c("SubjectID", "Activity", subset_featureNames)
subset_data_meanstd <- all_data[,Subset_featureNames]

## task 3
activity_labels <- read.table("activity_labels.txt")
subset_data_meanstd$Activity <- activity_labels[subset_data_meanstd[,2],2]


## task 4
good_colNames <- gsub("\\(|\\)", "",names(subset_data_meanstd))
colnames(subset_data_meanstd) <- good_colNames

## task 5
melted_data <- melt(subset_data_meanstd, id=c("SubjectID","Activity"))
average_data <- dcast(melted_data, SubjectID + Activity ~ variable, mean)
write.table(average_data, file = "TidyDataSet.txt", row.names = FALSE)
