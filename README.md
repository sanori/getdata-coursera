Make Summary of the Human Activity Data[^*]
===========================================

[^*]:
This project was a result of course project of
[Getting and Cleaning Data](https://www.coursera.org/course/getdata)
course in Coursera.

This project makes tidy summary data of
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) as `summary.txt` file.
The description of each files are as follows:

 * `main.R`: Run the whole process. Download and unzip the data
   and execute `run_analysys.R`. If the data already exists, pass the process.
 * `run_analysis.R`: Summarize the data and create `summary.txt`.
   The details are described in the follwing section.
 * `summary.txt`: Result of this project and `run_analysis.R`.
   Wide type summary data.
 * `CodeBook.md`: Detailed description of the data in `summary.txt`.
 * `README.md`: This document

Process of `run_analysis.R`
---------------------------
 1. We assume that the data is prepared in `dataDir`.
    Actually, `main.R` downloads and uncompress the given data.
 2. Load the feature (variable) name and column list from `features.txt` file.
    We only selects the features with mean and std aggregation function.
 3. Load the feature values from `X_train.txt` and `X_test.txt`
    and filter out unnecessary values.
 4. Load the activity IDs from `Y_train.txt` and `Y_test.txt`
    and attach to the feature data.
 5. Load the subject IDs from `subject_train.txt` and `subject_test.txt`
    and attach to the above data.
 6. Load the mapping of action IDs and descriptive text
    from `activity_labels.txt` and replace the activity ID to corresponding
    activity name.
 7. Get the mean (average) value of each variable
    for each subject and its activity and save the data as `summary.txt`.
