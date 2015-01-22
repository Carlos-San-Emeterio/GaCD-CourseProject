## Course Project: Run Analysis
## Getting and Cleaning Data
## Johns Hopkins University
## Coursera

## Tasks:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation. 
## 3) Uses descriptive activity names to name the activities in the data set.
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) Create a tidy data set with the average of each variable for each activity and each subject.


## 1) Merges the training and the test sets to create one data set.
## 4) Appropriately labels the data set with descriptive variable names. 

# Read files
features<-read.table("UCI HAR Dataset/features.txt")
test.y<-read.table("UCI HAR Dataset/test/y_test.txt", col.names="activity")
test.subject<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
test.x<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
train.y<-read.table("UCI HAR Dataset/train/Y_train.txt", col.names="activity")
train.subject<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
train.x<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=features[,2])

# Join data
test<-cbind(test.subject,test.y,test.x)
train<-cbind(train.subject,train.y,train.x)
data<-rbind(test,train)

# Clean memory
rm(features)
rm(test.subject, test.y, test.x, test)
rm(train.subject, train.y, train.x, train)

## 2) Extracts only the measurements on the mean and standard deviation. 

mean.columns<-grep("mean",colnames(data))
std.columns<-grep("std",colnames(data))
data<-data[,sort(c(1,2,mean.columns,std.columns))]
rm(mean.columns, std.columns)

## 3) Uses descriptive activity names to name the activities in the data set.

library(base)
activities <-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, col.names= c("activity","activity.description"))
data<-merge(activities, data)
rm(activities)

## 5) Create a tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
#Estimate data
cnames<-colnames(data[,c(1,seq(4,ncol(data)))])
tidy.data <-aggregate(data[,c(1,seq(4,ncol(data)))], 
    by=list(activity.description= data$activity.description,data$subject), FUN=mean)
colnames(tidy.data)<-c("activity.description","subject",cnames)
#Order data
index<-order(tidy.data[,colnames(tidy.data)[2]],
             tidy.data[,colnames(tidy.data)[3]])
tidy.data<-tidy.data[index,]
rm(cnames,index)
#Write data
write.table(tidy.data, file="tidydata.txt",row.name=FALSE,col.names = TRUE)
