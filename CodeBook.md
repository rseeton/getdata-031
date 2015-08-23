 CodeBook Details:

 
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The variables:
 
 
The data:
From the data package we used the following files

Naming information:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

Testing data:
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt' : Training subject Identifiers

Training data:
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt' : Training subject Identifiers

The transformations:
The same operations were done on both the test and training data.  
From the "features" list, we extract a set of columns called 'target_measures' matching 'std' for Standard Deviation and 'mean' for Averages.
From X_train and X_test we isolate the columns matching the 'target_measures' list.
These outputs are combined with the y_train and y_test data containng descriptions of the activities and the matching subject identifiers to produce the final tidy data ouptut ( tidy_data.txt )

