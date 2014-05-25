# Coursera "Getting and Cleaning Data" course project solution
### run_analysis.R

This R script processes data from the Human Activity Recognition Using Smartphones Dataset
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto. Which can be obtained from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the project can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To work the script must be placed in the same directory as the "UCI HAR Dataset" folder

The script performs the following tasks:
* Combines the test data and training data into one large dataframe
* Extracts only data for the mean and standard deviation variables
* Cleans the variable names and activity names to remove unwanted characters
* Pivots the data to take the mean of each mean variable and standard deviation variable for every activity and subject
* Outputs the data to JWCourseProjectSoln.txt
* Leaves processed dataframes in R for further manipulation. See script for details.

### Index of files
Filename | Description
---------|------------
run_analysis.R | The R Script, Course Project solution
README.md | This File
JWCourseProjectSoln.txt|Output File
CodeBook.md| CodeBook indicating variable meanings and how original data was manipulated