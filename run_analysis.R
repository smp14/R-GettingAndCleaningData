setwd("C:/Users/Saroja/Desktop/coursera/getdata-projectfiles-UCI HAR Dataset")
getwd()



xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")

features<-read.table("./UCI HAR Dataset/features.txt")
colnames(xtest)<-t(features[,2])
colnames(xtrain)<-t(features[,2])
xtest$activity<-ytest[,1]
xtrain$activity<-ytrain[,1]
xtest$participant<-subtest[,1]
xtrain$participant<-subtrain[,1]
total<-rbind(xtrain,xtest)
meanextract<-grep("mean()",colnames(total),fixed=TRUE)
meanextract<-total[,meanextract]

stddev<-grep("std()",colnames(total))


stdextract<-total[,stddev]
total$activity[total$activity==1]<-"walking"

total$activity[total$activity==2]<-"walking upstairs"
total$activity[total$activity==3]<-"walking downstairs"
total$activity[total$activity==4]<-"sitting"
total$activity[total$activity==5]<-"standing"
total$activity[total$activity==6]<-"laying"


colnames(total)<-gsub("Acc","accelerator",colnames(total))

colnames(total)<-gsub("Gyro","gyroscope",colnames(total))
colnames(total)<-gsub("Mag","magnitude",colnames(total))
colnames(total)<-gsub("^t","time",colnames(total))

colnames(total)<-gsub("^f","frequency",colnames(total))

