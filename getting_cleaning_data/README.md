# Getting and Cleaning Data Course Project

## Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How ```run_analysis.R``` implements the above steps:

* Requires ```reshapre2``` and ```plyr``` libraries.
* Loads activities and features information.
* Loads test and train data.
* Merges both datasets and write "tidy_data_full_dataset.txt" file with all features and activity labels
* Extracts the mean and standard deviation column names and data.
* Writes "tidy_data_mean_std_dataset.txt" file
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Writes "tidy_data_means_by_subject_and_activity.txt" file.