#initialize libraries
library(plyr)

## File Locations
xtrain <- "UCI HAR Dataset/train/X_train.txt"
ytrain <- "UCI HAR Dataset/train/Y_train.txt"
xtest <- "UCI HAR Dataset/test/X_test.txt"
ytest <- "UCI HAR Dataset/test/Y_test.txt"
feats <- "UCI HAR Dataset/features.txt"
acts <- "UCI HAR Dataset/activity_labels.txt"
trainsubs <-"UCI HAR Dataset/train/subject_train.txt"
testsubs <- "UCI HAR Dataset/test/subject_test.txt"

## Binding all X, Y, and Subject data into individual datasets
message("Reading data...")
xdata <-rbind(read.table(xtrain),read.table(xtest))
ydata <-rbind(read.table(ytrain),read.table(ytest))
subjects<-rbind(read.table(trainsubs),read.table(testsubs))
message("Complete.")

## Assigning proper feature names and subject names
featnames<-read.table(feats)
names(xdata)<-featnames[,2]
names(subjects) <- "subject"


# trim xdata to only have means and standard deviations, add subjects
colsubset<-c(grep("mean\\(", featnames[,2]), grep("std\\(", featnames[,2]))
colsubset<-sort(colsubset)
xdata<-xdata[,colsubset]

##Assigning proper Activity names
activitylabels<-read.table(acts)
activitylabels[,2]<-tolower(activitylabels[,2])
ydata<-join(ydata, activitylabels, by = "V1")
names(ydata)<-c("id","activity")

#combining data tables
df <- cbind(subjects,ydata["activity"],xdata)

#clearing temporary dataframes
rm(activitylabels, subjects, featnames, xdata, ydata)

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