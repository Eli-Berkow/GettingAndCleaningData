##This file contains information about the tidy data set.

(See ReadMe.md for an explanation of run_analysis.R)

###The creation of the tidy data set

* The data for the project was loaded and then merged to create one data set
* All columns were given their correct titles and activities were given more descriptive names
* Only the mean and standard deviation data were retained
* A tidy data set was created containing a summary of the averages of each variable for each activity and each subject

###The following columns/variables remain in the tidy data set:

* Subject
* Activity
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Note: Wherever a variable above contains the suffix "-XYZ" that variable has been split into three (for X, Y and Z respectively).
