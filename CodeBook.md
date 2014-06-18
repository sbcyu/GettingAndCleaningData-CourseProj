## Data
* features.txt - names of the measures being measured
* activity\_labels.txt - holds key value pairs whereby the key is an integer        and the value associated with the key is the activity description
* X\_train.txt & X\_test.txt - the actual recorded data
* y\_train.txt & y\_test.txt - holds the records which indicate what activity has been performed 
* subject\_train.txt & subject\_test.txt - holds the recorded subject who performed the activity

##Transformations
* Load the text files into R
* Assign the labels to identify the measurements
* Extract the measurements on the mean and standard deviation for each measurement, using *grep* function, for both the Testing and Training data-set
* Merge, for both the testing and training data, via column bind the loaded datasets from these files:
	* X_
	* y_
	* subject_ 
* Merge the Test and Training data via row bind to make one unified dataset
* Created a new column, named activityName in the unified dataset and populate it with a descriptive acitivty name
* Melt the unified dataset
* Compute the average/mean for each variable in the melted dataset and transform it into a long format dataset.
* Write tidy data-set into a text file 

## Result
* Final output file is named *tidy\_dataset.txt* 
* The merged dataset where the *tidy\_dataset.txt* was computed from is named *merged\_dataset.txt*  

### Column Names of the tidy data-set output

* subject
* activity
* activityName
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()

### Explanation of Column Names
The resulted output has 2(composite) primary keys

* subject - the primary key which identifies a unique person who performed an activity
* activity - the primary key which identifies what particular activity the subject performed
* activityName - a description of the activity performed
	- WALKING
	- WALKING\_UPSTAIRS
	- WALKING\_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING