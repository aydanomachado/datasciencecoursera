library(plyr)

# Loading information about activities and features
activity <- read.table("data/activity_labels.txt", col.names = c("activity_id","activity"))
features <- read.table("data/features.txt", col.names = c("feature_id","feature"))

# Creating test dataset
X_test <- read.table("data/test/X_test.txt", col.names = features$feature, check.names = FALSE)
Y_test <- read.table("data/test/y_test.txt", col.names = c("activity_id"))
Y_test <- join(Y_test, activity)
subject_test <- read.table("data/test/subject_test.txt", col.names = c("subject"))
test_dataset <- cbind(X_test, subject_test, Y_test)
rm(X_test, subject_test, Y_test)

# Creating train dataset
X_train <- read.table("data/train/X_train.txt", col.names = features$feature, check.names = FALSE)
Y_train <- read.table("data/train/y_train.txt", col.names = c("activity_id"))
Y_train <- join(Y_train, activity)
subject_train <- read.table("data/train/subject_train.txt", col.names = c("subject"))
train_dataset <- cbind(X_train, subject_train, Y_train)
rm(X_train, subject_train, Y_train)

# Creating full dataset (train + test datasets)
full_dataset <- rbind(train_dataset,test_dataset)
# Writing a file with full dataset
write.table(full_dataset, "tidy_data_full_dataset.txt")
rm(train_dataset,test_dataset)

# Creating a dataset with mean and std features
mean_std_dataset <- full_dataset[, grepl("mean\\(\\)|std\\(\\)|subject|activity$", names(full_dataset))]
# Writing a file sith the dataset with mean and std features
write.table(mean_std_dataset, "tidy_data_mean_std_dataset.txt")
rm(full_dataset)

# Creating a second, independent tidy data set with the average of each variable 
# for each activity and each subject. And saving it on a file.
library(reshape2)
data_to_reshape <- melt(mean_std_dataset, id.vars=c("subject", "activity"))
means_by_subject_and_activity <- dcast(data_to_reshape, subject + activity ~ variable, mean)
write.table(means_by_subject_and_activity, "tidy_data_means_by_subject_and_activity.txt")
