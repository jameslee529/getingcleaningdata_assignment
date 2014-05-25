CodeBook.md
========================================================
## Original Data
* [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* [Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## The steps of getting and cleaning data
The run_analysis.R performs the following to collect and clean up the data:  

1. Merges the training and test sets to create one data set
  * train/X_train.txt with test/X_test.txt -- observation: 10299 & variable: 561  
  * train/subject_train.txt with test/subject_test.txt -- the result is a 10299 x 1 data frame with subject IDs  
  * train/y_train.txt with test/y_test.txt -- the result is also a 10299 x 1 data frame with activity IDs.

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement. So the result is a 10299 x 66 data frame.

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set.

4. The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to underscores and brackets () are removed. Then it merges the S(subject id), Y(activity name) and X(measurement) data frame. The result is s a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements.  

5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidyData.txt, a 180x68 data frame
  * The 1st column contains subject IDs. (30 subjects, integer, 1..30)
  * The 2nd column contains activity names. (6 activities, character/factor)
  * The 3rd ~ 68th cloumn contains the averages for each of the 66 attributes (real number)

## The variable description
1. Activity Name
  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING
2. Subject ID
3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStdX
7. tBodyAccStdY
8. tBodyAccStdZ
9. tGravityAccMeanX  
10.tGravityAccMeanY  
11.tGravityAccMeanZ  
12.tGravityAccStdX  
13.tGravityAccStdY  
14.tGravityAccStdZ  
15.tBodyAccJerkMeanX  
16.tBodyAccJerkMeanY  
17.tBodyAccJerkMeanZ  
18.tBodyAccJerkStdX  
19.tBodyAccJerkStdY  
20.tBodyAccJerkStdZ  
21.tBodyGyroMeanX  
22.bodyGyroMeanY  
23.bodyGyroMeanZ  
24.tBodyGyroStdX  
25.tBodyGyroStdY  
26.tBodyGyroStdZ  
27.tBodyGyroJerkMeanX  
28.tBodyGyroJerkMeanY  
29.tBodyGyroJerkMeanZ  
30.tBodyGyroJerkStdX  
31.tBodyGyroJerkStdY  
32.tBodyGyroJerkStdZ  
33.tBodyAccMagMean  
34.tBodyAccMagStd  
35.tGravityAccMagMean  
36.tGravityAccMagStd  
37.tBodyAccJerkMagMean  
38.tBodyAccJerkMagStd  
39.tBodyGyroMagMean  
40.tBodyGyroMagStd  
41.tBodyGyroJerkMagMean  
42.tBodyGyroJerkMagStd  
43.fBodyAccMeanX  
44.fBodyAccMeanY  
45.fBodyAccMeanZ  
46.fBodyAccStdX  
47.fBodyAccStdY  
48.fBodyAccStdZ  
49.fBodyAccJerkMeanX  
50.fBodyAccJerkMeanY  
51.fBodyAccJerkMeanZ  
52.fBodyAccJerkStdX  
53.fBodyAccJerkStdY  
54.fBodyAccJerkStdZ  
55.fBodyGyroMeanX    
56.fBodyGyroMeanY  
57.fBodyGyroMeanZ  
58.fBodyGyroStdX  
59.fBodyGyroStdY  
60.fBodyGyroStdZ  
61.fBodyAccMagMean  
62.fBodyAccMagStd  
63.fBodyBodyAccJerkMagMean  
64.fBodyBodyAccJerkMagStd  
65.fBodyBodyGyroMagMean  
66.fBodyBodyGyroMagStd  
67.fBodyBodyGyroJerkMagMean  
68.fBodyBodyGyroJerkMagStd  
