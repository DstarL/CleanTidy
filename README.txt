==================================================================
#File name: README.txt
#Author: David Lyons
#Description: Week4 - Getting and Cleaning Data
#Date created: 2021-04-19
#Date last modified: 2021-04-19
==================================================================

This is my week 4 assignment for the Getting and Cleaning Data Module.
======================================
The original raw data set is described as follows: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original raw dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The additional files produced by this work are:

- 'README.txt'

- 'samsung_data.csv' which is the merged output of the test and the train data and includes the subject identifier and the activities.

- 'samsung_data_average.csv' which includes the measurement averages for each of the 6 activities and also for each of the 30 subjects.

- 'run_analysis.R This script downloads the raw data and wrangles it into the previously noted files.

- 'CodeBook.Rmd' This document describes the actions taken and the measurements in both csv files.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
