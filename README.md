# README

## Original Source

The true original source of the data from this analysis is from the UCI HAR Samsung dataset:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The data used in this analysis was download from:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

Please refer to features_info.txt in the root folder of zip file from the link above for a description of the data from the original source.

## Files

* run_analys.R - used to create a tidy data set from the UCI HAR Samsung dataset. Running the R file will produce two files:
  * uci_har_tidy.txt - a tidy version of the UCI HAR Samsung dataset that includes a single row for every measurement and merges the data from the test and train datasets.
  * uci_har_tidy_avgs.txt - the means of the data in the uci_har_tidy_.txt datset grouped by activity and subject.
* CodeBook.md - a code book that explains each of the columns in the tidy data set.

## Steps to reproduce the tidy data set
The analysis assumes that the UCI HAR Saumsung zip file from the link above has been download to your local machine and unzipped into your working directory.  The contents of the zip file should not be changed and the data should be unzipped to a folder called "UCI HAR Dataset".

The original environment used to create the analysis is:
* OS: Windows 7 64-bit
* R Version: 3.1.3 (2015-03-09)

The required packages to run the analysis are:
* base R packages
* data.table

### Procedure Steps:
# Download the UCI HAR Samsung Dataset from the links above
# Unzip the contents of the data set
# Place run_analysis.R in the same directory as the root folder of the UCI HAR Dataset
# Run run_analysis.R

## Purpose of run_analysis.R
run_analysis.R creates a tidy version of the data found in the UCI HAR datset.  The data from both the test and train data sets are merged into a single data set and outputed to a txt file.  The delimiter for the text file is a single space.  Each row of the tidy data set in the main output file (uci_har_tidy.txt) contains an observation from a given subject and activity.