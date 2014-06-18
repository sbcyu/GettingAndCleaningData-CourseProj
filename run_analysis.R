homeDirectory = getwd()
dataFolder = file.path(homeDirectory,"UCI HAR Dataset")

#Load all datasets
features <- read.table(file.path(dataFolder, "features.txt"))
activity <- read.table(file.path(dataFolder, "activity_labels.txt"))
##Training data
xTrainData <- read.table(file.path(dataFolder, "train", "X_train.txt"), header = F, sep="")
yTrainData <- read.table(file.path(dataFolder, "train", "y_train.txt"))
subjectTrainData <- read.table(file.path(dataFolder, "train", "subject_train.txt"))
##Test Data
xTestData <- read.table(file.path(dataFolder, "test", "X_test.txt"), header = F, sep="")
yTestData <- read.table(file.path(dataFolder, "test", "y_test.txt"))
subjectTestData <- read.table(file.path(dataFolder, "test", "subject_test.txt"))

#Set the labels to the datasets before merging them
names(xTrainData) <- features[,2]
names(xTestData) <- features[,2]
names(subjectTrainData) <- c("subject")
names(subjectTestData) <- c("subject")
names(yTrainData) <- c("activity")
names(yTestData) <- c("activity")
names(activity) <- c("num", "desc")

#Extract the measurements on the mean and standard deviation for each measurement. 
xTrainData <- xTrainData[grep("mean|std",features$V2, value=T)] 
xTestData <- xTestData[grep("mean|std",features$V2, value=T)] 

#Merge the datasets, one for the TEST and one for TRAIN
mergedTrainData <- cbind(subjectTrainData,xTrainData, yTrainData)
mergedTestData <- cbind(subjectTestData,xTestData, yTestData)
#Merge both TEST and TRAIN datasets into one dataset
fullDataset <- rbind(mergedTrainData, mergedTestData)
write.table(fullDataset, "merged_dataset.txt", sep=",",  row.names=F)

#Create an activityName column from being an integer value to a descriptive name
fullDataset$activityName <- "-"
for (i in 1:6) {
  fullDataset$activityName[fullDataset$activity == i] <- 
    gsub("_", " ", as.character(activity$desc[[i]]))
}  

#Create an independent tidy dataset with the average of each variable for
#each activity and each subject
#install.packages("reshape2")
library(reshape2)
meltedDataset <- melt(fullDataset, id=c("subject", "activity", "activityName"))

#Compute the average/mean for each variable
computedMean <- dcast(meltedDataset, formula = subject + activity + activityName ~ variable, mean)
write.table(computedMean, "tidy_dataset.txt", sep=",",  row.names=F)