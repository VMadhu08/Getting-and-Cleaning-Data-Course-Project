"""
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
"""

# Step 1: Load required libraries
library(dplyr)

# Step 2: Download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip")
unzip("dataset.zip")

# Step 3: Load data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("Index", "Feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Feature, check.names = FALSE)
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActivityID")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Feature, check.names = FALSE)
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActivityID")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

# Step 4: Merge the datasets
train <- cbind(train_subjects, train_labels, train_data)
test <- cbind(test_subjects, test_labels, test_data)
merged_data <- rbind(train, test)

# Step 5: Extract measurements on mean and standard deviation
selected_features <- grep("mean\\(\\)|std\\(\\)", features$Feature, value = TRUE)
selected_columns <- c("Subject", "ActivityID", selected_features)
data_subset <- merged_data[, selected_columns]

# Step 6: Use descriptive activity names
data_subset <- merge(data_subset, activity_labels, by = "ActivityID")
data_subset$ActivityID <- NULL

# Step 7: Appropriately label the dataset
names(data_subset) <- gsub("^t", "Time", names(data_subset))
names(data_subset) <- gsub("^f", "Frequency", names(data_subset))
names(data_subset) <- gsub("Acc", "Accelerometer", names(data_subset))
names(data_subset) <- gsub("Gyro", "Gyroscope", names(data_subset))
names(data_subset) <- gsub("Mag", "Magnitude", names(data_subset))
names(data_subset) <- gsub("-mean\\(\\)", "Mean", names(data_subset))
names(data_subset) <- gsub("-std\\(\\)", "STD", names(data_subset))

# Step 8: Create a second tidy dataset with averages
tidy_data <- data_subset %>%
  group_by(Subject, Activity) %>%
  summarise(across(everything(), mean))

# Step 9: Save the tidy dataset
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
