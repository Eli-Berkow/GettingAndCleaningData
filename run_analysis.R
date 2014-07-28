#Set Working Directory

setwd("~/Projects/Coursera - Data Science/Getting and Cleaning Data/
      getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

#Load Data

subject_test = read.table("test/subject_test.txt")
x_test = read.table("test/x_test.txt")
y_test = read.table("test/y_test.txt")

subject_train = read.table("train/subject_train.txt")
x_train = read.table("train/x_train.txt")
y_train = read.table("train/y_train.txt")

features = read.table("features.txt", stringsAsFactor = FALSE)
activity_labels = read.table("activity_labels.txt",stringsAsFactor = FALSE)

#Appropriately label the data set with descriptive variable names [4]

colnames(subject_test)="Subject"
colnames(x_test)=features[,2]
colnames(y_test)="Activity"

colnames(subject_train)="Subject"
colnames(x_train)=features[,2]
colnames(y_train)="Activity"

#Merge the training and test sets to create one data set [1]

test=cbind(subject_test,y_test,x_test)
train=cbind(subject_train,y_train,x_train)
allData=rbind(test,train)

#Extract the mean and standard deviation columns for each measurement [2]

wantedColumns=grep("-mean\\(\\)|-std\\(\\)",names(allData))

allWantedColumns=c(1,2,wantedColumns) #Keep first two columns

wantedData=allData[,allWantedColumns]

#Replace numbers with descriptive activity names for activities in the data set [3]

wantedData$Activity=activity_labels$V2[match(wantedData$Activity,activity_labels$V1)]


#Creates a second, independent tidy data set with the average of each variable
#for each activity and each subject

meltedData = melt(wantedData,id.vars = c("Subject","Activity"))
wantedDataSummary = ddply(meltedData,.(Subject, Activity, variable),summarize, value = mean(value))
wantedDataSummary2 = dcast(wantedDataSummary, Subject + Activity ~ variable)

#Write to file
write.csv(wantedDataSummary,file = "wantedDataSummary.txt", row.names = FALSE)
write.csv(wantedDataSummary2,file = "wantedDataSummary2.txt", row.names = FALSE)