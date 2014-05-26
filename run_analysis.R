# Coursera "Getting and Cleaning Data" by J. Leek, R. Peng and B. Caffo
# Course project solution prepared by JW on 5/25/2014
#
# The following dataframes are left in R after completion of the script:
# df        - The cleaned dataframe from activity, subject, and measurement data.
#             Only means and standard deviations are kept
# dfmelted  - The df dataframe melted using activity and subjects as id columns
# dfcasted  - The recasted dfmelted dataframes as means for all measurments for activity and subject
# activitylabels - The names and associated levels of all the measured activities


#initialize libraries if not found, attempt to load and install

if(require(reshape2)) {
  message("Library reshape2 loaded correctly")
} else {
  message("Library reshape2 not found, attempting to install...")
  install.packages("reshape2")
  if(require(plyr)) {
    message("Library reshape2 installed and loaded correctly")
  } else {
    stop("Could not install reshape2")
  }
}


if(require(plyr)) {
  message("Library plyr loaded correctly")
} else {
  message("Library plyr not found, attempting to install...")
  install.packages("plyr")
  if(require(plyr)) {
    message("Plyr installed and loaded correctly")
  } else {
    stop("Could not install plyr")
  }
}


## File Locations

xtrain <- "UCI HAR Dataset/train/X_train.txt"
ytrain <- "UCI HAR Dataset/train/Y_train.txt"
xtest <- "UCI HAR Dataset/test/X_test.txt"
ytest <- "UCI HAR Dataset/test/Y_test.txt"
feats <- "UCI HAR Dataset/features.txt"
acts <- "UCI HAR Dataset/activity_labels.txt"
trainsubs <-"UCI HAR Dataset/train/subject_train.txt"
testsubs <- "UCI HAR Dataset/test/subject_test.txt"

## Reassembling training and test data from files for X, Y, and Subjects

message("Reading data...")
xdata <-rbind(read.table(xtrain),read.table(xtest))
ydata <-rbind(read.table(ytrain),read.table(ytest))
subjects<-rbind(read.table(trainsubs),read.table(testsubs))
message("Complete.")

## Assigning proper feature names and subject names

featnames<-read.table(feats)
names(xdata)<-featnames[,2]
names(subjects) <- "subject"


# trim xdata to only have means and standard deviations

colsubset<-c(grep("mean\\(", featnames[,2]), grep("std\\(", featnames[,2]))
colsubset<-sort(colsubset)
xdata<-xdata[,colsubset]

##Assigning proper Activity names

activitylabels<-read.table(acts)
activitylabels[,2]<-tolower(activitylabels[,2])
ydata<-join(ydata, activitylabels, by = "V1")
names(ydata)<-c("id","activity")

#combining data frames of first subjects, then activities, and finally xdata

df <- cbind(subjects,ydata["activity"],xdata)

#clearing temporary dataframes

rm(subjects, featnames, xdata, ydata)

#formatting and cleaning data frame names

names(df) <- gsub("-", ".", names(df))
names(df) <- sub("mean\\(\\)", "mean", names(df))
names(df) <- sub("std\\(\\)", "std", names(df))
names(df) <- sub("BodyBody", "Body", names(df))

#melting data frame by activity and subject, and recasting by mean

dfmelted <- melt(df, id=c("activity","subject"),measure.vars=names(df)[3:length(names(df))])
dfcasted <- dcast(dfmelted, activity + subject ~ variable, mean)

#write finished analysis

message("")
message("Writing solution to JWCourseProjectSoln.txt ....")
write.table(dfcasted, file = "JWCourseProjectSoln.txt")
message("Done.")
