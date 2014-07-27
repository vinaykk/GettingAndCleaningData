Getting and Cleaning Data Course Project Help  
======================

Instroduction
-------------------------

This project is to demonstrate ability to collect, work with, and clean a data set.  

Files required to run analysis 
--------------------------

Following are the files associated with this project
  * run_analysis.R
  * Readme.md
  * CodeBook.md 
  * Data for the project is obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of source data is avaible in files README.txt and features_info.txt contained in above zip file.

Steps to commplete analysis
-----------------------------

Following are the steps to complete anaysis of this data. 

1. Extract above zip file to current working directory on r. 
2. Copy run_analysis.R to working directory. 
3. Load run_analysis.R source using source command.
4. Run tidydata <- run_analysis() to start anaylsis. 
5. After completing anaysis 2 files are generated in the working directory. 
6. features.txt contains column names of the tidy data set.
7. UCIHARTidyDataset.txt contains  tidy data set with the average of each variable for each activity and each subject
8. This fuction also returns this tidy data set in dataframe. 

Description of the Logic in run_analysis()
-----------------------

Following descrips logic used in analyzing data set for this project to generate Tidy data set

* Activity labels are loaded from ./UCI HAR Dataset/activity_labels.txt 

* Features names are loaded from ./UCI HAR Dataset/features.txt

* Regular expression is used to obtain ids of features that has mean() or std() in thier names. These Ids are stored in meanStdIds.

* Train and test data are loaded in various objects and finally merged to mssmartPhoneData. This data set now contains both train and test data for measurements on the mean and strandard deviation for each measurement. rbind and cbind functions are used to merge train and test datasets. 

* Activity descriptions are added as an aditional column using merge funciton. This is stored in data frame mssmartPhoneData. 

* ddply is used to generate tidy data set from mssmartPhoneData. resulted dataframe is stored in phoneDataAvg and contians average of each variable for each activity and each subject. 

* Both mssmartPhoneData amd phoneDataAvg data sets are labeled with variable names loaded from features.txt 

* Tidy dataset and its column names are outputed in files UCIHARTidyDataset.txt and features.txt

* Dataframe is also retured by this fuction. 

