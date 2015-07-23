## This script requires the dplyr library.
## If you do not have it installed please install using: install.packages("dplyr")
library(dplyr)

## Load features from file and remove parenthesis from feature names
read.table("UCI HAR Dataset/features.txt") -> features
gsub("\\(|\\)","",features$V2) -> features$V2

## Load activities from file
read.table("UCI HAR Dataset/activity_labels.txt") -> activities

## Load x variable observations (measurements)
read.table("UCI HAR Dataset/train/X_train.txt") -> x_train
read.table("UCI HAR Dataset/test/X_test.txt") -> x_test
rbind(x_train,x_test) -> x_data

## Set column names for x variable data and Remove illegal characters from variable names
as.character(features$V2) -> names(x_data)
validcols <- make.names(names=names(x_data), unique=TRUE, allow_ = TRUE)
names(x_data) <- validcols

## Remove all columns that do not contain the words "mean" or "std"
select(x_data, matches("mean|std")) -> x_data

## Load y variable observations (subjects)
read.table("UCI HAR Dataset/train/y_train.txt") -> y_train
read.table("UCI HAR Dataset/test/y_test.txt") -> y_test
rbind(y_train,y_test) -> y_data

## Coerce y values to factor data type
as.factor(y_data[,1]) -> y_data[,1]

## Set levels for activity factor variable using data loaded from activity_labels.txt
as.character(activities$V2) -> levels(y_data[,1])

## Rename column to 'Activity'
rename(y_data,Activity=V1) -> y_data

## Load subject data and rename the column to 'Subject'
read.table("UCI HAR Dataset/train/subject_train.txt") -> subject_train
read.table("UCI HAR Dataset/test/subject_test.txt") -> subject_test
rbind(subject_train,subject_test) -> subject_data
rename(subject_data,Subject=V1) -> subject_data

## Column bind (combine) data frames into one
cbind(subject_data,y_data,x_data) -> merged_data

## Group data by subject and activity using dplyr group_by
group_by(merged_data, Subject, Activity) -> merged_grouped

## Create summary statistics and write to file
summarise_each(merged_grouped,funs(mean)) -> summary
write.table(summary,file ="step5.txt",row.names=FALSE)

## Clean up workspace
rm("activities","features","subject_data","subject_test","subject_train","validcols","x_data","x_test","x_train","y_data","y_test","y_train")


