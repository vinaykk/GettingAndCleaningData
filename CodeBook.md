This file contains description of the logic used in analyzing following data set for this project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Activity labels are loaded from ./UCI HAR Dataset/activity_labels.txt 

features names are loaded from ./UCI HAR Dataset/features.txt

regular expression is used to obtain ids of features that has mean() or std() in thier names. this info is stored in meanStdIds.

Train and test data loated in various objects and finally merged to mssmartPhoneData. This data set now contains both train and test data for measurements on the mean and strandard deviation for each measurement. rbind and cbind functions are used to merge train and test datasets. 

Activity descriptions are added as an aditional column using merge funciton. This is stored in data frame mssmartPhoneData. 

ddply is used to generate independent tidy data set from mssmartPhoneData. result is stored in phoneDataAvg and contians average of each variable for each activity and each subject. 

Both mssmartPhoneData amd phoneDataAvg data sets are labeled with variable names loaded from features.txt 

Tidy dataset and its column names are outputed in files UCIHARTidyDataset.txt and features.txt

Dataframe is also retured by this fuction. 

