##****************************************************************************
##  This R script file is used to collect, work with, and clean the data set of 
##  the so-called "wearable computing"
##****************************************************************************
require("reshape2")

## 1. Merges the training and the test sets to create one data set.
print("Step1: Loading & Mergeing data. It may take some minutes.")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X <- rbind(X_train, X_test)
  
S_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
S_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
S <- rbind(S_train, S_test)
  
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Y <- rbind(Y_train, Y_test)


## 2. Extracts only the measurements on the mean and standard deviation for
##    each measurement.
print("Step2: Extracting mean and standard deviation")
features <- read.table("./UCI HAR Dataset/features.txt")
expectedFeatureIndex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, expectedFeatureIndex]
names(X) <- features[expectedFeatureIndex, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- gsub("-", "_", names(X))


## 3. Uses descriptive activity names to name the activities in the data set
print("Step3: Name the activities with descriptive names")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"


## 4. Appropriately labels the data set with descriptive activity names. 
print("Step4: label the data set")
names(S) <- "subject"
data <- cbind(S, Y, X)

## 5. Creates a 2nd, independent tidy data set with the average of each 
##    variable for each activity and each subject.
print("Step5: Creat a tidy data set")
ids = c("activity", "subject")
measures = setdiff(colnames(data), ids)
meltedData <- melt(data, id=ids, measure.vars=measures)
tidyData <- dcast(meltedData, activity + subject ~ variable, mean)
write.table(tidyData, "tidyData.txt")