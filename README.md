# Getting and Cleaning Data
This is my assignment for "Getting and Cleaning Data" course at Coursera.
This repository contains the following files:
1. README.md - gives a short overview about the files in this repository
2. tidy_data.txt - is the tidy and clean dataset
3. run_analysis.R - is the script that shows how the dataset was created
4. codebook.md - gives overview about the data set, variables and transformation that was done during the analysis

The following files from the initial dataset is used:
1. ***features.txt*** - includes the descriptions for features measured
2. ***train/X_train.txt*** - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
3. ***test/X_test.txt*** - includes the measurements of the features in test set
4. ***train/subject_train.txt*** - subject for each measurement from the train set
5. ***test/subject_test.txt*** - subject for each measurement from the test set
6. ***train/y_train.txt*** - activity (from 1 to 6) for each measurement from the train set
7. ***test/y_test.txt*** - activity (from 1 to 6) for each measurement from the test set

The run_analysis.R script does the following:
1. Downloads and unzip the the zip file
2. Creates one single dataset from test and train files
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Use descriptive activity names to name the activities in the data set.
5. Appropriately label the data set with descriptive variable names.
6. Create a second, independent tidy set with the average of each variable for each activity and each subject.
7. Write the data set to the tidy_data.txt file

