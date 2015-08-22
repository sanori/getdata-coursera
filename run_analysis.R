
dataDir <- "./UCI HAR Dataset"

dataset <- local({
    # extract nessesary columns
    features <- read.table(paste(dataDir, "features.txt",
                                    sep="/"))
    necFeatures <- features[grepl("-(mean|std)\\(",features$V2),]
    columns <- necFeatures$V1
    
    # Load features(predictors) and drop unnecessary variables
    datasetTest <- read.table(paste(dataDir, "test", "X_test.txt",
                                    sep="/"))[,columns]
    datasetTrain <- read.table(paste(dataDir, "train", "X_train.txt",
                                     sep="/"))[,columns]
    d <- rbind(datasetTrain, datasetTest)
    names(d) <- necFeatures$V2
    
    # Load outcome variables and attach to the dataset
    activityTest <- read.table(paste(dataDir, "test", "Y_test.txt", sep="/"))
    activityTrain <- read.table(paste(dataDir, "train", "Y_train.txt", sep="/"))
    d$activity.id <- rbind(activityTrain, activityTest)$V1
    
    # Load subject variable and attach to the dataset
    subjectTest <- read.table(paste(dataDir, "test", "subject_test.txt", sep="/"))
    subjectTrain <- read.table(paste(dataDir, "train", "subject_train.txt", sep="/"))
    d$subjectId <- rbind(subjectTrain, subjectTest)$V1
    
    d
})

# join with descriptive values
activityLabels <- read.table(paste(dataDir, "activity_labels.txt", sep="/"),
                                 col.names=c("activity.id", "activity.name"))
dataset <- merge(dataset, activityLabels, all.x = TRUE)
dataset$activity.id <- NULL

# make summay data
summary <- aggregate(. ~ subjectId + activity.name, data=dataset, mean)
summary <- summary[order(summary$subjectId, summary$activity),]

write.table(summary, "summary.txt", row.names = FALSE)
