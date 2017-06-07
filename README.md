# Getting-and-Cleaning-Data

# Johns Hopkins University - Getting and Cleaning Data README
For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
## Files in this repository
* README.md -- This document
* CodeBook.md -- Codebook describing variables, the data and transformations
* run_analysis.R -- R code for tidying data
 
## run_analysis.R goals
You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
You may download source file from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, then extract zip to the working directory.
If R program detect the folder doesn't exist, it will download file automatically.
 
The output is created in working directory with the name of tidy_data.txt
 
*Note:* the R script is built to run without including any libraries for the purpose of this course.
 
## run_analysis.R walkthrough
It follows the goals step by step.
 
* Step 1:
  * Check UCI HAR Dataset folder existence; if not, download file and unzip it.
 
* Step 2:
  * Read all test and training files.
  * Combine training and test data for subject, x, y.
 
* Step 3:
  * Read all features from features.txt and filter it to only leave features that are either means ("mean()") or standard deviations ("std()").
  * Also, using previous filtering rule to label each column name of features.
   
* Step 4:
  * Read the activity labels from activity_labels.txt and replace the numbers with the text by `merge()` function.
 
* Step 5:
  * Using `cbind()` to merge subject, activity, and filtered features.
  * Label subject and activity column.
   
* Step 6:
  * Write the new tidy set into a text file called tidy_data.txt.
