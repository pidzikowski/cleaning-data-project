
# Read in the training and testing sets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge the sets.
x_merged <- rbind(X_train,x_test)
y_merged <- rbind(y_train,y_test)
s_merged <- rbind(s_train,s_test)

# Filter only the mean and standard deviation for each measurement from feature vector.

features <- read.table("./UCI HAR Dataset/features.txt")
feature_filter <- grep("-(std|mean)+\\(",features$V2)
x_filtered <- x_merged[,feature_filter]

# Use descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_names <- activities[y_merged[,1],2]

# header names
names(x_filtered) <- features[feature_filter,2]
names(activity_names) <- "activity_name"
names(s_merged) <- "subject"

# merge all tables into one set for easier analysis

combined_data <- cbind(x_filtered,activity_names,s_merged)

# From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity and each subject.
# leverage the summarise_each function in dplyr

library(dplyr)
tidy_data <- summarise_each(group_by(combined_data, subject, activity_names),funs(mean))

write.table(tidy_data, "tidy_out.txt", row.names = FALSE)

