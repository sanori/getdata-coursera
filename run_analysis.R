

dataDir <- "./UCI HAR Dataset"

# Load dataset and drop unnecessary columns
dataset <- local({
    # extract nessesary columns
    features <- read.table(paste(dataDir, "features.txt",
                                    sep="/"))
    necFeatures <- features[grepl("-(mean|std)\\(",features$V2),]
    columns <- necFeatures$V1
    
    datasetTest <- read.table(paste(dataDir, "test/X_test.txt",
                                    sep="/"))[,columns]
    datasetTrain <- read.table(paste(dataDir, "train/X_train.txt",
                                     sep="/"))[,columns]
    d <- rbind(datasetTrain, datasetTest)
    names(d) <- necFeatures$V2
    d
})

labeledActivity <- local({
    activityTest <- read.table(paste(dataDir, "test/Y_test.txt", sep="/"))
    activityTrain <- read.table(paste(dataDir, "train/Y_train.txt", sep="/"))
    activity <- rbind(activityTrain, activityTest)
    names(activity) <- "activity.id"
    activityLabels <- read.table(paste(dataDir, "activity_labels.txt", sep="/"),
                                 col.names=c("activity.id", "activity.name"))
    merge(activity, activityLabels)
})

subject <- local({
    subjectTest <- read.table(paste(dataDir, "test/subject_test.txt", sep="/"))
    subjectTrain <- read.table(paste(dataDir, "train/subject_train.txt", sep="/"))
    rbind(subjectTrain, subjectTest)
})

names(subject) <- "subjectId"
dataset$activity <- labeledActivity$activity.name
dataset$subjectId <- subject

