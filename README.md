# GettingCleaningData
Coursera Course Getting and Cleaning Data from Johns Hopkins.

Background information for the project:
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

Step 1: download the data for the project from this url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
download the folder and unzip it.

In this repository you'll find:
1. run_analysis.R : the R-code run on the downloaded dataset; this
- merges the training and test sets to create one data set
- extracts only the measurements of the mean and standard deviation for each measurement
- sets descriptive activity names to name the activities in the data set
- labels the variables with descriptive variable names
- creates a independent tidy data set with the average of each variable for each activity and each subject.

2. Tidy.txt : the clean dataset extracted from the original downloaded data using run_analysis.R.

3. Codebook.md : the code book, which describes the contents of the tidy data set (data, variables and transformations used to generate the data).
