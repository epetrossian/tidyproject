# run_analysis.R
#
# Creates two tidy data set files based on the UCI HAR Samsung data set.
#
# The first file "uci_har_tidy.csv" is a tidy merged data set between the train
# data set and the test data set.
#
# The second file "uci_har_tidy_avgs.csv" is a tidy data set of the averages of
# the data in "uci_har_tidy.csv" grouped by activity and subject
require("data.table")

# Read metadata
colFile <- read.table("UCI HAR Dataset/features.txt", sep="", header = FALSE, stringsAsFactors=FALSE)
colNames <- t(colFile)[2,]

activityFile <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE, stringsAsFactors=FALSE)


# Read test data - extracts all mean and std measures
testData <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE, stringsAsFactors=FALSE, col.names = colNames)
testData <- testData[, grepl("*mean*|*std*|*Mean*", colNames)]
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt", sep=" ", header = FALSE, col.names=c("activity"))
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", sep=" ", header = FALSE, col.names=c("subject"))

testAll <- cbind(testSubject, testActivity, testData)

# Read train data - extracts all mean and std measures
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE, stringsAsFactors=FALSE, col.names = colNames)
trainData <- trainData[, grepl("*mean*|*std*|*Mean*", colNames)]
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt", sep=" ", header = FALSE, col.names=c("activity"))
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ", header = FALSE, col.names=c("subject"))
trainAll <- cbind(testSubject, testActivity, testData)

# Combind test and train data
allData <- rbind(testAll, trainAll)

# convert activity to levels with labels
allData$activity <- as.factor(allData$activity)
levels(allData$activity) <- activityFile[,2]

# Create averages data set grouped by subject and activity
avgs <- data.table(allData)
avgs <- avgs[, lapply(.SD,mean), by=c("subject", "activity")]

# Write tidy data sets to .csv files
write.table(allData, "uci_har_tidy.txt", row.names=FALSE, )
write.table(avgs, "uci_har_tidy_avgs.txt", row.names=FALSE)