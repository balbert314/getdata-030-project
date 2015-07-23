# getdata-030-project
## Getting and Cleaning Data

The included script "run_analysis.R" will clean and merge the data set from this project:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [1]

Downloaded from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once it has cleaned and merged the data from the above mentioned link it will remove any columns 
from the data not related to mean or standard deviation. It will then create a summary table that
shows the average of all measurements for each interaction level between subject and activity
(each subject-activity pair will have one value for each variable).

Please see the inline comments in run_analysis.R for specific guidance on the steps in this process.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012