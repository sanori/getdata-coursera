Codebook for Summary.txt
========================

This document describes the details of the summary.txt.
`summary.txt` is the summary data of
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
which is a database of human activity measured by Smartphone.

About UCI HAR Dataset
---------------------
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
is the database of human activity data recored by Samsung Galaxy S2 smartphone.
The measured actions are
walking, walking upstairs, walking downstairs, sitting, standing, and laying. 
The data is gotten by 30 volunteers (subjects) within an age 19-38.
The measured value were the preprocessed signals of sensors,
accelerometer and gyroscope, in the smartphone. 
Accelerometer captures the acceleration of the motion
and gyroscope captures the direction of the subject.
Since the acceleration includes gravity, acceleration by human movement
of each action is separated and named `Body` in this dataset.

You may easily understand what and how is measured by watching
the [YouTube video](https://www.youtube.com/watch?v=XOEN9W05_4A).

For more details, please read the documentations in the
[UCI ML repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

About summary.txt
-----------------
`summary.txt` contains
the average(=mean) value of each sensor signals (=variables)
grouped by volunteers and his/her actions.
Not all the actions in HAR Data set is summarized.
Only the mean values and standards deviation of each variable
for each action is summarized.

Names and values in summary.txt
-------------------------------
`subjectId` identifies volunteers by numbers which is from 1 to 30.

`activity.name` denotes the action performed by the volunteer (subject).
There are six actions in this data as follows:

 * WALKING
 * WALKING_UPSTAIRS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING

The rest are the preprocessed sensor data and follows the following naming rules.

 * The first character is `t` or `f`. `t` means time domain
   signal, `f` means the FFT(Fast Fourier Transform)ed value of the signal.
 * The second part of the name is signal origin
   which is either `Body` or `Gravity`.
 * The third part of the name is sensor
   which is either `Acc` (accelerometer) or `Gyro` (gyroscope).
 * The following part before hyphen(`-`), if exists,
   notes that this is the derived signal from the sensor.
   `Jerk` means the [jerk](https://en.wikipedia.org/wiki/Jerk_(physics)) (derivative of acceleration) and
   `Mag` means the magnitude of Euclidean norm.
 * The function part, which is separated by hyphens (`-`),
   is the aggregation function of the signal.
   In this data, we considered only `mean()` and `std()`.
 * the last part, which is separated by hyphen(`-`), is the axis of the signal
   which is one of `X`, `Y` and `Z`.
   
For more information, please consult the `features_info.txt` file in
UCI HAR Dataset directory.