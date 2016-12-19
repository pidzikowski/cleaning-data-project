# Variable Names


* X_train, y_train, s_train, x_test, y_test, s_test are imported from the data set and combined into x_merged, y_merged, and s_merged.
These represent the features set, the corresponding activity labels, and the corresponding subject labels.
* activity_names is a list of descriptive activity names
* combined_data combines the features, with the activity name and the subject into one table
* tidy_data is the output after the data is grouped by subject and activity name and the mean is computed for each group.

# Code Description

* The training and the test data are merged into one group
* The activity numbers are mapped to a descriptive name
* The feature set for each activity and subject are combined into one table.
* Data is organized to show the mean of each feature by subject and activity
