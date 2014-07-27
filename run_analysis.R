
run_analysis <- function(){
  ## below 2 packages are required to run this script 
  
  require(reshape2)
  require(plyr)
  
  ## Read activity vector and set column names
  activity_labels <- read.delim2("./UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE)
  names(activity_labels) <- c("activity","activityLabel")
  
  ## Read feature vector and set column names
  features <- read.delim2("./UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
  names(features) <- c("id","feature")
  
  ## use pattern to get list of mesurements that have mean and stanadared deviations
  measurePattern <- "mean\\(\\)|std\\(\\)"
  meanStdIds <- features[grep(measurePattern,features$feature,perl=TRUE ),]$id
  columnNames <- c("activity","subject","activityLabel")

  ## Read train data vector and set column names
  x_train <- read.delim2("./UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)
  ##names(x_train) <- features$feature
    
  ## Read train activity vector and set column names
  y_train <- read.delim2("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
  names(y_train) <- "activity"

  ## Read train subject vector and set column names
  subject_train <- read.delim2("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
  names(subject_train) <- "subject"
  
  ## combine subject,activity and train data into one data set
  trainData <- cbind(subject_train,y_train,x_train)

  ## Read test data vector and set column names
  x_test <- read.delim2("./UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE)
  ##names(x_test) <- features$feature

  ## Read test activity vector and set column names
  y_test <- read.delim2("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
  names(y_test) <- "activity"

  ## Read test subject vector and set column names
  subject_test <- read.delim2("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
  names(subject_test) <- "subject"
  testData <- cbind(subject_test,y_test,x_test)  
  
  ## combine test and train data into one dataset
  smartphoneData <- rbind(trainData,testData)

  ## extract columns subject,activity and mesurements related to mean and std
  mssmartPhoneData <- cbind(smartphoneData[1:2], smartphoneData[meanStdIds + 2])
  
  ## add activity description column to data set
  mssmartPhoneData <- merge(mssmartPhoneData , activity_labels, by.x = c("activity"), by.y =c("activity"))
 
  phoneDataAvg <- ddply(mssmartPhoneData,.(activity,subject,activityLabel),summarize, 
             V1 =  mean(as.numeric(V1)),
             V2 =  mean(as.numeric(V2)),
             V3 =  mean(as.numeric(V3)),
             V4 =  mean(as.numeric(V4)),
             V5 =  mean(as.numeric(V5)),
             V6 =  mean(as.numeric(V6)),
             V41 =  mean(as.numeric(V41)),
             V42 =  mean(as.numeric(V42)),
             V43 =  mean(as.numeric(V43)),
             V44 =  mean(as.numeric(V44)),
             V45 =  mean(as.numeric(V45)),
             V46 =  mean(as.numeric(V46)),
             V81 =  mean(as.numeric(V81)),
             V82 =  mean(as.numeric(V82)),
             V83 =  mean(as.numeric(V83)),
             V84 =  mean(as.numeric(V84)),
             V85 =  mean(as.numeric(V85)),
             V86 =  mean(as.numeric(V86)),
             V121 =  mean(as.numeric(V121)),
             V122 =  mean(as.numeric(V122)),
             V123 =  mean(as.numeric(V123)),
             V124 =  mean(as.numeric(V124)),
             V125 =  mean(as.numeric(V125)),
             V126 =  mean(as.numeric(V126)),
             V161 =  mean(as.numeric(V161)),
             V162 =  mean(as.numeric(V162)),
             V163 =  mean(as.numeric(V163)),
             V164 =  mean(as.numeric(V164)),
             V165 =  mean(as.numeric(V165)),
             V166 =  mean(as.numeric(V166)),
             V201 =  mean(as.numeric(V201)),
             V202 =  mean(as.numeric(V202)),
             V214 =  mean(as.numeric(V214)),
             V215 =  mean(as.numeric(V215)),
             V227 =  mean(as.numeric(V227)),
             V228 =  mean(as.numeric(V228)),
             V240 =  mean(as.numeric(V240)),
             V241 =  mean(as.numeric(V241)),
             V253 =  mean(as.numeric(V253)),
             V254 =  mean(as.numeric(V254)),
             V266 =  mean(as.numeric(V266)),
             V267 =  mean(as.numeric(V267)),
             V268 =  mean(as.numeric(V268)),
             V269 =  mean(as.numeric(V269)),
             V270 =  mean(as.numeric(V270)),
             V271 =  mean(as.numeric(V271)),
             V345 =  mean(as.numeric(V345)),
             V346 =  mean(as.numeric(V346)),
             V347 =  mean(as.numeric(V347)),
             V348 =  mean(as.numeric(V348)),
             V349 =  mean(as.numeric(V349)),
             V350 =  mean(as.numeric(V350)),
             V424 =  mean(as.numeric(V424)),
             V425 =  mean(as.numeric(V425)),
             V426 =  mean(as.numeric(V426)),
             V427 =  mean(as.numeric(V427)),
             V428 =  mean(as.numeric(V428)),
             V429 =  mean(as.numeric(V429)),
             V503 =  mean(as.numeric(V503)),
             V504 =  mean(as.numeric(V504)),
             V516 =  mean(as.numeric(V516)),
             V517 =  mean(as.numeric(V517)),
             V529 =  mean(as.numeric(V529)),
             V530 =  mean(as.numeric(V530)),
             V542 =  mean(as.numeric(V542)),
             V543 =  mean(as.numeric(V543))
  )
  
  names(mssmartPhoneData)[4:69] <- as.character( features[meanStdIds,]$feature)
  
  ##write data to the file  
  write.table(columnNames,file="features.txt",quote = FALSE,sep = " ",row.names = FALSE,col.names = FALSE)
  write.table(features[meanStdIds,]$feature,file="features.txt",append = TRUE,quote = FALSE,sep = " ",row.names = FALSE,col.names = FALSE)
  ##write.table(mssmartPhoneData,file="UCIHARDataset.txt",quote = FALSE,sep = " ",row.names = FALSE,col.names = FALSE)
  write.table(phoneDataAvg,file="UCIHARTidyDataset.txt",quote = FALSE,sep = " ",row.names = FALSE,col.names = FALSE)
  
  ## return the both data sets.
  ## list(mssmartPhoneData,phoneDataAvg)
  names(phoneDataAvg)[4:69] <- as.character( features[meanStdIds,]$feature)
  
  phoneDataAvg
  
}