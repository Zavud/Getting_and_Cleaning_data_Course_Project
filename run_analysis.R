#set your working directory to where the UCI HAR Dataset is
setwd("...\\UCI HAR Dataset") # ... is your working directory

#load the dplyr package for later use
require(dplyr)

#preparing the files for reading in
test_files <- list.files(path = "test", full.names = T)[-1]
train_files <- list.files(path = "train", full.names = T)[-1]
all_files <- c(test_files, train_files)

#reading the activity label data and features
activity_labels <-  read.table(list.files()[1], header = F,
                               col.names = c("activity_code", "activity_name"))
features <- read.table(list.files()[2], col.names = c("n", "functions"))

#reading all files at once as a list
list_data <- sapply(all_files, read.table, header = F)

#reading the test data
subject_test <- list_data$`test/subject_test.txt`; names(subject_test) <- "subject"
x_test <- list_data$`test/X_test.txt`; names(x_test) <- features$functions
y_test <- list_data$`test/y_test.txt`; names(y_test) <- "activity"

#reading the train data
subject_train <- list_data$`train/subject_train.txt`; names(subject_train) <- "subject"
x_train <- list_data$`train/X_train.txt`; names(x_train) <- features$functions
y_train <- list_data$`train/y_train.txt`; names(y_train) <- "activity"

#combining the data tables by rows
data_subject <- rbind(subject_test, subject_train)
data_activity <- rbind(y_test, y_train)
data_features <- rbind(x_test, x_train)

#creating one single data containing all the data
data <- cbind(data_subject, data_features, data_activity)

#Extract only measurements on mean and standard deviation
names <- c("subject", "activity", as.character(features$functions))
mean_std_col <- grep("subject|activity|[Mm]ean|std", names, value = F)
mean_std_data <- data[ , mean_std_col]

#Use descriptive activities names for activity measurements
mean_std_data$activity <- activity_labels$activity_name[mean_std_data$activity]

##label the data with appropriate descriptive variable names
names(mean_std_data) <- gsub("^t", "Time", names(mean_std_data))
names(mean_std_data) <- gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data) <- gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data) <- gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data) <- gsub("Mag", "magnitude", names(mean_std_data))
names(mean_std_data) <- gsub("BodyBody", "body", names(mean_std_data))
names(mean_std_data) <- gsub("[[:punct:]]", "", names(mean_std_data))
names(mean_std_data) <- gsub("mean", "Mean", names(mean_std_data))

#Create tidy data set with average of each variable, by activity, by subject
tidy_data <- mean_std_data %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(tidy_data, "tidy_data.txt", row.names = F)
















