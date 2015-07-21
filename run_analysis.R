setwd("~/Desktop/Project 1/UCI HAR Dataset")
library(plyr)
library(data.table)

##Step 1: Merges the training and the test sets to create one data set.
#Read in train data 
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")
#Read in test data
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")
#Merge the train data
data_x <- rbind(xtrain, xtest)
#Merge the test data
data_y <- rbind(ytrain, ytest)
#Merge the subject data
data_subject <- rbind(subjecttrain, subjecttest)

#Step 2: Extracts only the measurements on the mean and standard 
#deviation for each measurement. 

features <- read.table("features.txt")

#Take only cols. with "std" or "mean" in name 
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

#subset the cols.
data_x <- data_x[, mean_std_features]

#Change and correct the col names
names(data_x) <- features[mean_std_features, 2]

#Step 3: Uses descriptive activity names 
#to name the activities in the data set

activities <- read.table("activity_labels.txt")

#Correct activity names
data_y[, 1] <- activities[data_y[, 1], 2]

#Correct col names
names(data_y) <- "activity"

#Step 4: Appropriately labels the data set with descriptive variable names. 

#Correct col names
names(data_subject) <- "subject"

#Merge/bind all data into a single dataset
alldata <- cbind(data_x, data_y, data_subject)

#Step 5: From the data set in step 4, creates a second, independent tidy
#data set with the average of each variable for each activity and each subject.

#68 col except for the last two: subject and activity
averagesdata <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagesdata, "averagesdata.txt", row.name=FALSE)
