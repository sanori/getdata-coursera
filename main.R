#!/usr/bin/env Rscript

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataZipFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
dataDir <- "UCI HAR Dataset"
if (!file.exists(dataDir)) {
    if (!file.exists(dataZipFile)) {
        download.file(dataUrl, dataZipFile, mode = "wb")
    }
    unzip(dataZipFile)    
}

source("run_analysis.R")
