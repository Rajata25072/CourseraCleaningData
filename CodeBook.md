# Column Variable Descriptions

The following is a description for the column names within "JWCourseProjectSoln.txt"

* Variable Format: "FeatureNames.Measure.Direction"
* Example: tBodyAcc.mean.X

## FeatureNames
The following was three paragraphs were taken verbatim from features_info.txt:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz."

"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)." 

"Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)." 

These signals were used to estimate variables of the feature vector for each pattern:  <br>

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


* The script takes the mean for all variables that were represented by either a mean or standard deviation (mean() or std())


## Measure

The resultant compiled values are
'.mean': Mean of mean value from the original dataset<br>
'.std': Mean of Standard deviation from the original dataset<br>

## Direction

'.X' '.Y' or '.Z' is used to denote 3-axial signals in the X, Y and Z directions respectively.
