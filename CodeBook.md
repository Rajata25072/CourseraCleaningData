# Column Variable Descriptions

The following is a description for the column names within "JWCourseProjectSoln.txt"

* The data is sorted first by activity, then subject 
	* Activities are chosen from the following 6 activities: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
	* Subjects are numbered from 1 to 30
* The remaining columns are of the format: "FeatureNames.Measure.Direction" described below
	* Example: tBodyAcc.mean.X

## FeatureNames
The following was three paragraphs were taken verbatim from features_info.txt of the original data (see README.md for references):

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

>Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

* The script run_analysis.R takes the mean for all variables that were represented by either a mean or standard deviation (mean() or std()) for each activity per each test subject.

* The segmented feature names contains these discrete parts:
	* t is for time, f is for frequency
	* Body or Gravity part of motion
	* Acc for measured by accelerometer or Gyro for measured by gyroscope
	* Jerk (optional) for Jerk signals
	* Mag (optional) for magnitude calculated by Euclidean norm

* The following are the "FeatureName" section of the column names as described above:  <br>


tBodyAcc<br>
tGravityAcc<br>
tBodyAccJerk<br>
tBodyGyro<br>
tBodyGyroJerk<br>
tBodyAccMag<br>
tGravityAccMag<br>
tBodyAccJerkMag<br>
tBodyGyroMag<br>
tBodyGyroJerkMag<br>
fBodyAcc<br>
fBodyAccJerk<br>
fBodyGyro<br>
fBodyAccMag<br>
fBodyAccJerkMag<br>
fBodyGyroMag<br>
fBodyGyroJerkMag<br>

## Measure

* '.mean': Mean of the mean measurement for each activity per sbuject from the original dataset<br>
* '.std': Mean of the standard deviation from the mean measurement for each activity per subject from the original dataset<br>

## Direction

* '.X' '.Y' or '.Z' is used to denote 3-axial signals in the X, Y and Z directions respectively.
