
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="assignment.zip")
#Download the file to a folder, unzip it, 
#and set the resulting "UCI HAR Dataset" file as your working directory.

library(plyr)
#loading test and train files
xtest = read.table("test/X_test.txt")
xtrain = read.table("train/X_train.txt")
ytest = read.table("test/y_test.txt")
ytrain = read.table("train/y_train.txt")
stest = read.table("test/subject_test.txt")
strain = read.table("train/subject_train.txt")
#labels of activities
activlabs = read.table("activity_labels.txt")
#labels of features
featurelabs <- read.table("features.txt")

featurelabs

#name the variables
colnames(ytest) = "activity"
colnames(ytrain) = "activity"
colnames(strain) = "subject"
colnames(stest) = "subject"
colnames(activlabs) <- c('activity','activitytype')
colnames(xtest) <- t(featurelabs[2])
colnames(xtrain) <- t(featurelabs[2])

#merging files
testset = cbind(stest, ytest, xtest)
trainset = cbind(strain, ytrain, xtrain)
combinedset = rbind(testset, trainset)

#selecting only columns with mean and std, and including column 1 and 2 which are ID and activity labels.
columnsmeanstd = grep(".*Mean.*|.*Std.*", names(combinedset), ignore.case=TRUE)
columnsidactivitymeanstd = c(1,2,columnsmeanstd)
datameanstd = combinedset[,columnsidactivitymeanstd]
#activity and ID as factor instead of numeric value.
datameanstd$activity = as.factor(datameanstd$activity)
datameanstd$subject = as.factor(datamenastd$subject)

#write tidy table with avarages for each subject and activity
tidydata = aggregate(. ~subject + activity, datameanstd, mean)
tidydata = tidydata[order(tidydata$subject,tidydata$activity),]
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
