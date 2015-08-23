# getdata-031
Getting and Cleaning Data Course Project Repository

The solution has one script which will read the downloaded Samsung accelerometer file ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and performs the following details:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Details on the data processing is located in the CodeBook.md file.
Details on the source data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

NOTE:  

The script assumes the dataset has been downloaded and copied to the current working directory as "getdata-projectfiles-UCI HAR Dataset.zip"
