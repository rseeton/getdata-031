## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Set Packages
#install.packages("data.table")
#install.packages("reshape2")
library(data.table)
library(reshape2)


#Set Target Directory and get data:
#dir.create(file.path("./","zipdata"), showWarnings = FALSE)
#getwd()
#fileZIP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileZIP,destfile = "./zipdata/Dataset.zip", method="curl")
#unzip("./zipdata/Dataset.zip")

# Load field labels & subject ids
feature_labels  <- read.table("./UCI HAR Dataset/features.txt")[,2]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
subject_id_data_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_id_data_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_id_data_test) = "subject"
names(subject_id_data_train) = "subject"

# Extract only the measurements on the mean and standard deviation for each measurement.
target_measures <- grepl("std|mean", feature_labels)



###################################################################################################
# TRAINING DATA                                                                                   #
###################################################################################################
# Load X_test data and extract std deviation & mean
X_test_data        <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test_data) = feature_labels
X_test_data        = X_test_data[,target_measures]



# Load and process y_test 
y_test_data        <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_test_data[,2]    = activity_labels[y_test_data[,1]]
names(y_test_data) = c("Activity_ID", "Activity_Label")

# Merge test data for X, y & subjects
test_data          <- cbind(as.data.table(subject_id_data_test), y_test_data, X_test_data)


###################################################################################################
# TRAINING DATA                                                                                   #
###################################################################################################
# Load X_train data and extract std deviation & mean
X_train_data        <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train_data) = feature_labels
X_train_data        = X_train_data[,target_measures]

# Load activity data
y_train_data        <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_train_data[,2]    = activity_labels[y_train_data[,1]]
names(y_train_data) = c("Activity_ID", "Activity_Label")

# Merge train data for X, y & subjects
train_data <- cbind(as.data.table(subject_id_data_train), y_train_data, X_train_data)

# Merge test and train data
fulldata = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(fulldata), id_labels)

# Reshape data
fulldata_mergecols      = melt(fulldata, id = id_labels, measure.vars = data_labels)

# Calculate Average for each variable / activity / subject data point
tidy_data   = dcast(fulldata_mergecols, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)
