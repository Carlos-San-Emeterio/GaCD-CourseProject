====================================================
Tidy Data From 
Human Activity Recognition Using Smartphones Dataset
====================================================
Course Project: Run Analysis
Getting and Cleaning Data
Johns Hopkins University
Coursera
====================================================
Tasks:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation. 
3) Uses descriptive activity names to name the activities in the data set.
4) Appropriately labels the data set with descriptive variable names. 
5) Create a tidy data set with the average of each variable for each activity and each subject.

For Human Activity Recognition Using Smartphones Dataset documentation read README.txt file from that dataset and features_info.txt.
 
The tasks in the script are performed in different order as they are given, because task 4 can be done at the same time that task 1 and it is cleaner to give names to the variables at its creation. Task 1 and 4 are made, loading the data, joining it and deleting the variables that are unnecessary for next steps.
In step 2, all the columns with the words mean and std are included, as it is required, and the other variables are discarded.
In step 3, the data for activity labels are loaded and added to our data.
In the last step, tidy data is calculated, ordered and saved in the "tidydata.txt" file