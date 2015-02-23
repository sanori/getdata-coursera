dataDir <- "./UCI HAR Dataset"



# Load dataset and drop unnecessary columns
dataset <- local({
    # Necessary columns
    columns <- c(
        1,   2,   3,   4,   5,   6,    # tBodyAcc-mean/std()-XYZ
        41,  42,  43,  44,  45,  46,   # tGravityAcc-mean/std()-XYZ
        81,  82,  83,  84,  85,  86,   # tBodyAccJerk-mean/std()-XYZ
        121, 122, 123, 124, 125, 126,  # tBodyGyro-mean/std()-XYZ
        161, 162, 163, 164, 165, 166,  # tBodyGyroJerk-mean/std()-XYZ
        201, 202,                      # tBodyAccMag-mean/std()
        214, 215,                      # tGravityAccMag-mean/std()
        227, 228,                      # tBodyAccJerkMag-mean/std()
        240, 241,                      # tBodyGyroMag-mean/std()
        253, 254,                      # tBodyGyroJerkMag-meanstd()
        266, 267, 268, 269, 270, 271,  # fBodyAcc-mean/std()-XYZ
        345, 346, 347, 348, 349, 350,  # fBodyAccJerk-mean/std()-XYZ
        424, 425, 426, 427, 428, 429,  # fBodyGyro-mean/std()-XYZ
        503, 504,                      # fBodyAccMag-mean/std()
        516, 517,                      # fBodyBodyAccJerkMag-mean/std()
        529, 530,                      # fBodyBodyGyroMag-mean/std()
        542, 543                       # fBodyBodyGyroJerkMag-mean/std()
    )
    datasetTest <- read.table(paste(dataDir, "test/X_test.txt",
                                    sep="/"))[,columns]
    datasetTrain <- read.table(paste(dataDir, "train/X_train.txt",
                                     sep="/"))[,columns]
    rbind(datasetTrain, datasetTest)  
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

names(subject) <- "subject"
dataset$activity <- labeledActivity$activity.name
dataset$subject <- subject

