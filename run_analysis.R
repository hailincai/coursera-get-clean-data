#load required libraries
library(stringr)
library(dplyr)

#This function is used to download the data set from web
#and extract it to data folder
downloaddataset<-function(){
  if (!file.exists("data")){
    dir.create("data");
  }
  
  if (!file.exists("data/dataset.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile="data/dataset.zip")  
    unzip("data/dataset.zip", exdir="data")
  }
}

downloaddataset()

#
selectedDataCols <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
selectDataColNames <- c("tbodyaccmeanx","tbodyaccmeany","tbodyaccmeanz","tbodyaccstdx","tbodyaccstdy","tbodyaccstdz","tgravityaccmeanx","tgravityaccmeany","tgravityaccmeanz","tgravityaccstdx","tgravityaccstdy","tgravityaccstdz","tbodyaccjerkmeanx","tbodyaccjerkmeany","tbodyaccjerkmeanz","tbodyaccjerkstdx","tbodyaccjerkstdy","tbodyaccjerkstdz","tbodygyromeanx","tbodygyromeany","tbodygyromeanz","tbodygyrostdx","tbodygyrostdy","tbodygyrostdz","tbodygyrojerkmeanx","tbodygyrojerkmeany","tbodygyrojerkmeanz","tbodygyrojerkstdx","tbodygyrojerkstdy","tbodygyrojerkstdz","tbodyaccmagmean","tbodyaccmagstd","tgravityaccmagmean","tgravityaccmagstd","tbodyaccjerkmagmean","tbodyaccjerkmagstd","tbodygyromagmean","tbodygyromagstd","tbodygyrojerkmagmean","tbodygyrojerkmagstd","fbodyaccmeanx","fbodyaccmeany","fbodyaccmeanz","fbodyaccstdx","fbodyaccstdy","fbodyaccstdz","fbodyaccjerkmeanx","fbodyaccjerkmeany","fbodyaccjerkmeanz","fbodyaccjerkstdx","fbodyaccjerkstdy","fbodyaccjerkstdz","fbodygyromeanx","fbodygyromeany","fbodygyromeanz","fbodygyrostdx","fbodygyrostdy","fbodygyrostdz","fbodyaccmagmean","fbodyaccmagstd","fbodybodyaccjerkmagmean","fbodybodyaccjerkmagstd","fbodybodygyromagmean","fbodybodygyromagstd","fbodybodygyrojerkmagmean","fbodybodygyrojerkmagstd", "activity", "subject")

#loading the test data and train data into memory
testDataFile <- "data/UCI HAR Dataset/test/X_test.txt"
testActiFile <- "data/UCI HAR Dataset/test/y_test.txt"
testSubjectFile <- "data/UCI HAR Dataset/test/subject_test.txt"

testData <- read.csv(testDataFile, header=FALSE, sep="")
testActi <- read.csv(testActiFile, header=FALSE, sep="")
testSubject <- read.csv(testSubjectFile, header=FALSE, sep="")

trainDataFile <- "data/UCI HAR Dataset/train/X_train.txt"
trainActiFile <- "data/UCI HAR Dataset/train/y_train.txt"
trainSubjectFile <- "data/UCI HAR Dataset/train/subject_train.txt"
trainData <- read.csv(trainDataFile, header=FALSE, sep="")
trainActi <- read.csv(trainActiFile, header=FALSE, sep="")
trainSubject <- read.csv(trainSubjectFile, header=FALSE, sep="")

#add activity and subject column for testData and trainData
testData <- testData %>%
  select(selectedDataCols) %>%
  mutate(activity=testActi[,1]) %>%
  mutate(subject=testSubject[,1])
trainData <- trainData %>%
  select(selectedDataCols) %>%
  mutate(activity=trainActi[,1]) %>%
  mutate(subject=trainSubject[,1])

#update the colnames for testData and trainData
colnames(testData) <- selectDataColNames
colnames(trainData) <- selectDataColNames

#bind testData and trainData togather
finalData<-rbind(testData, trainData)

#make the finalData$activity becomes human readable value
finalData$activity<-as.factor(finalData$activity)
levels(finalData$activity)<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

#clean up intermitent variables
rm(testData)
rm(trainData)
rm(testActi)
rm(testSubject)
rm(trainActi)
rm(trainSubject)

#group data based on activity and subject
#then create the average
finalData1 <- as.tbl(finalData)
finalData1 <- group_by(finalData1, activity, subject)
summaryData <- summarise(finalData1, avgtbodyaccmeanx=mean(tbodyaccmeanx),
                         avgtbodyaccmeany=mean(tbodyaccmeany),
                         avgtbodyaccmeanz=mean(tbodyaccmeanz),
                         avgtbodyaccstdx=mean(tbodyaccstdx),
                         avgtbodyaccstdy=mean(tbodyaccstdy),
                         avgtbodyaccstdz=mean(tbodyaccstdz),
                         avgtgravityaccmeanx=mean(tgravityaccmeanx),
                         avgtgravityaccmeany=mean(tgravityaccmeany),
                         avgtgravityaccmeanz=mean(tgravityaccmeanz),
                         avgtgravityaccstdx=mean(tgravityaccstdx),
                         avgtgravityaccstdy=mean(tgravityaccstdy),
                         avgtgravityaccstdz=mean(tgravityaccstdz),
                         avgtbodyaccjerkmeanx=mean(tbodyaccjerkmeanx),
                         avgtbodyaccjerkmeany=mean(tbodyaccjerkmeany),
                         avgtbodyaccjerkmeanz=mean(tbodyaccjerkmeanz),
                         avgtbodyaccjerkstdx=mean(tbodyaccjerkstdx),
                         avgtbodyaccjerkstdy=mean(tbodyaccjerkstdy),
                         avgtbodyaccjerkstdz=mean(tbodyaccjerkstdz),
                         avgtbodygyromeanx=mean(tbodygyromeanx),
                         avgtbodygyromeany=mean(tbodygyromeany),
                         avgtbodygyromeanz=mean(tbodygyromeanz),
                         avgtbodygyrostdx=mean(tbodygyrostdx),
                         avgtbodygyrostdy=mean(tbodygyrostdy),
                         avgtbodygyrostdz=mean(tbodygyrostdz),
                         avgtbodygyrojerkmeanx=mean(tbodygyrojerkmeanx),
                         avgtbodygyrojerkmeany=mean(tbodygyrojerkmeany),
                         avgtbodygyrojerkmeanz=mean(tbodygyrojerkmeanz),
                         avgtbodygyrojerkstdx=mean(tbodygyrojerkstdx),
                         avgtbodygyrojerkstdy=mean(tbodygyrojerkstdy),
                         avgtbodygyrojerkstdz=mean(tbodygyrojerkstdz),
                         avgtbodyaccmagmean=mean(tbodyaccmagmean),
                         avgtbodyaccmagstd=mean(tbodyaccmagstd),
                         avgtgravityaccmagmean=mean(tgravityaccmagmean),
                         avgtgravityaccmagstd=mean(tgravityaccmagstd),
                         avgtbodyaccjerkmagmean=mean(tbodyaccjerkmagmean),
                         avgtbodyaccjerkmagstd=mean(tbodyaccjerkmagstd),
                         avgtbodygyromagmean=mean(tbodygyromagmean),
                         avgtbodygyromagstd=mean(tbodygyromagstd),
                         avgtbodygyrojerkmagmean=mean(tbodygyrojerkmagmean),
                         avgtbodygyrojerkmagstd=mean(tbodygyrojerkmagstd),
                         avgfbodyaccmeanx=mean(fbodyaccmeanx),
                         avgfbodyaccmeany=mean(fbodyaccmeany),
                         avgfbodyaccmeanz=mean(fbodyaccmeanz),
                         avgfbodyaccstdx=mean(fbodyaccstdx),
                         avgfbodyaccstdy=mean(fbodyaccstdy),
                         avgfbodyaccstdz=mean(fbodyaccstdz),
                         avgfbodyaccjerkmeanx=mean(fbodyaccjerkmeanx),
                         avgfbodyaccjerkmeany=mean(fbodyaccjerkmeany),
                         avgfbodyaccjerkmeanz=mean(fbodyaccjerkmeanz),
                         avgfbodyaccjerkstdx=mean(fbodyaccjerkstdx),
                         avgfbodyaccjerkstdy=mean(fbodyaccjerkstdy),
                         avgfbodyaccjerkstdz=mean(fbodyaccjerkstdz),
                         avgfbodygyromeanx=mean(fbodygyromeanx),
                         avgfbodygyromeany=mean(fbodygyromeany),
                         avgfbodygyromeanz=mean(fbodygyromeanz),
                         avgfbodygyrostdx=mean(fbodygyrostdx),
                         avgfbodygyrostdy=mean(fbodygyrostdy),
                         avgfbodygyrostdz=mean(fbodygyrostdz),
                         avgfbodyaccmagmean=mean(fbodyaccmagmean),
                         avgfbodyaccmagstd=mean(fbodyaccmagstd),
                         avgfbodybodyaccjerkmagmean=mean(fbodybodyaccjerkmagmean),
                         avgfbodybodyaccjerkmagstd=mean(fbodybodyaccjerkmagstd),
                         avgfbodybodygyromagmean=mean(fbodybodygyromagmean),
                         avgfbodybodygyromagstd=mean(fbodybodygyromagstd),
                         avgfbodybodygyrojerkmagmean=mean(fbodybodygyrojerkmagmean),
                         avgfbodybodygyrojerkmagstd=mean(fbodybodygyrojerkmagstd))
write.csv(summaryData, "data/summary.csv", row.names=FALSE)