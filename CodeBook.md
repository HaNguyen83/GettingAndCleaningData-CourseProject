---
title: "CodeBook"
author: "Ha Nguyen"
date: "July 26, 2015"
output: word_document
---
# DESCRIPTION OF THE ORIGINAL DATA:

The dataset is collected from the experiments which have been carried out with a group of 30 volunteers within the age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Number of instances/objects: 10299
Number of attributes/varibles: 561


##VARIABLES:

  Subject:
	  SubjectID
		    1..30 .Unique identifier assigned to each subject who carried out the experiment.

  Activity:
	    Acivity lables:
		      1 WALKING.
	      	2 WALKING_UPSTAIRS.
	      	3 WALKING_DOWNSTAIRS.
	       	4 SITTING.
      		5 STANDING.
      		6 LAYING.

  Features: 
	  There are 561 features in total.


#TRANSFORMATION

From the raw data sets described above, I performed a number of steps in order to clean and create a tidy data set. These steps to 
clean data and the structure (i.e. variables) of the tidy data set are described below:


###Step 1:
	Since the obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data, I firstly merges the training and the test sets to create one data set.
###Step 2:
	I extract only the measurements on the mean and standard deviation for each measurement. 	 
###Step 3:
	I replace the activity codes by descriptive activity names in the data set.
###Step 4:
	I appropriately label the data set with descriptive variable names.
###Step 5: 
	I create an independent tidy data set with the average of each variable for each activity and each subject


#DISCRIPTION OF THE CLEANED-TIDY DATA SET

Since there are 30 subjects carried out the experiment and each of them performs 6 activities, the tidy data set contain  180 rows (i.e. objects) and 68 variables (only the measurement on mean and standard deviation are selected).

  Subject:
	    SubjectID
		    1..30 .Unique identifier assigned to each subject who carried out the experiment.

  Activity:
	    Acivity lable
	      	1 WALKING
		      2 WALKING_UPSTAIRS
		      3 WALKING_DOWNSTAIRS
		      4 SITTING
		      5 STANDING
		      6 LAYING


  Features: 
	    * tBodyAcc-mean-X          
 	    * tBodyAcc-mean-Y
      * tBodyAcc-mean-Z
      * tBodyAcc-std-X           
 	    * tBodyAcc-std-Y
      * tBodyAcc-std-Z
      * tGravityAcc-mean-X       
	    * tGravityAcc-mean-Y        
	    * tGravityAcc-mean-Z        
	    * tGravityAcc-std-X        
	    * tGravityAcc-std-Y
      * tGravityAcc-std-Z
      * tBodyAccJerk-mean-X      
	    * tBodyAccJerk-mean-Y
      * tBodyAccJerk-mean-Z
      * tBodyAccJerk-std-X       
	    * tBodyAccJerk-std-Y
      * tBodyAccJerk-std-Z
      * tBodyGyro-mean-X         
	    * tBodyGyro-mean-Y 
      * tBodyGyro-mean-Z
      * tBodyGyro-std-X          
	    * tBodyGyro-std-Y
      * tBodyGyro-std-Z
      * tBodyGyroJerk-mean-X     
	    * BodyGyroJerk-mean-Y
	    * tBodyGyroJerk-mean-Z
	    * tBodyGyroJerk-std-X
	    *	tBodyGyroJerk-std-Y
	    * tBodyGyroJerk-std-Z
	    * tBodyAccMag-mean
	    * tBodyAccMag-std
	    * tGravityAccMag-mean
	    * tGravityAccMag-std       
	    * tBodyAccJerkMag-mean
	    * tBodyAccJerkMag-std
	    * tBodyGyroMag-mean
	    * tBodyGyroMag-std
	    * tBodyGyroJerkMag-mean
	    * tBodyGyroJerkMag-std
	    * fBodyAcc-mean-X
	    * fBodyAcc-mean-Y
	    * fBodyAcc-mean-Z
	    * fBodyAcc-std-X
	    * fBodyAcc-std-Y
	    * fBodyAcc-std-Z           
	    * fBodyAccJerk-mean-X
	    * fBodyAccJerk-mean-Y
	    * fBodyAccJerk-mean-Z      
	    * fBodyAccJerk-std-X
	    * fBodyAccJerk-std-Y
	    * fBodyAccJerk-std-Z       
	    * fBodyGyro-mean-X
	    * fBodyGyro-mean-Y
	    * fBodyGyro-mean-Z         
      * fBodyGyro-std-X
      * fBodyGyro-std-Y
      * fBodyGyro-std-Z          
      * fBodyAccMag-mean
      * fBodyAccMag-std
      * fBodyBodyAccJerkMag-mean
      
