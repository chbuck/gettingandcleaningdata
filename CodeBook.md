### Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Variable Descriptions

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcceleration-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerkSignals-XYZ and timeBodyGyroscopeJerkSignals-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, timeBodyGyroscopeJerkSignalsMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkSignalsMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerkSignals-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerationMagnitude, frequencyBodyAccelerationJerkSignalsMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkSignalsMagnitude.. 

We only estimated the mean and the standard deviation (std) values from that data. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Angle describes the angle between two vectors.


The set of variables that were estimated from these signals are: 

1.SubjectID 
2.ActivityName 
3.timeBodyAccelerationMean-X 
4.timeBodyAccelerationMean-Y 
5.timeBodyAccelerationMean-Z 
6.timeBodyAccelerationStd-X 
7.timeBodyAccelerationStd-Y 
8.timeBodyAccelerationStd-Z 
9.timeGravityAccelerationMean-X 
10.timeGravityAccelerationMean-Y 
11.timeGravityAccelerationMean-Z 
12.timeGravityAccelerationStd-X 
13.timeGravityAccelerationStd-Y 
14.timeGravityAccelerationStd-Z 
15.timeBodyAccelerationJerkSignalsMean-X 
16.timeBodyAccelerationJerkSignalsMean-Y 
17.timeBodyAccelerationJerkSignalsMean-Z 
18.timeBodyAccelerationJerkSignalsStd-X 
19.timeBodyAccelerationJerkSignalsStd-Y 
20.timeBodyAccelerationJerkSignalsStd-Z 
21.timeBodyGyroscopeMean-X 
22.timeBodyGyroscopeMean-Y 
23.timeBodyGyroscopeMean-Z 
24.timeBodyGyroscopeStd-X 
25.timeBodyGyroscopeStd-Y 
26.timeBodyGyroscopeStd-Z 
27.timeBodyGyroscopeJerkSignalsMean-X 
28.timeBodyGyroscopeJerkSignalsMean-Y 
29.timeBodyGyroscopeJerkSignalsMean-Z 
30.timeBodyGyroscopeJerkSignalsStd-X 
31.timeBodyGyroscopeJerkSignalsStd-Y 
32.timeBodyGyroscopeJerkSignalsStd-Z 
33.timeBodyAccelerationMagnitudeMean 
34.timeBodyAccelerationMagnitudeStd 
35.timeGravityAccelerationMagnitudeMean 
36.timeGravityAccelerationMagnitudeStd 
37.timeBodyAccelerationJerkSignalsMagnitudeMean 
38.timeBodyAccelerationJerkSignalsMagnitudeStd
39.timeBodyGyroscopeMagnitudeMean 
40.timeBodyGyroscopeMagnitudeStd 
41.timeBodyGyroscopeJerkSignalsMagnitudeMean 
42.timeBodyGyroscopeJerkSignalsMagnitudeStd 
43.frequencyBodyAccelerationMean-X 
44.frequencyBodyAccelerationMean-Y 
45.frequencyBodyAccelerationMean-Z 
46.frequencyBodyAccelerationStd-X 
47.frequencyBodyAccelerationStd-Y 
48.frequencyBodyAccelerationStd-Z
49.frequencyBodyAccelerationJerkSignalsMean-X
50.frequencyBodyAccelerationJerkSignalsMean-Y 
51.frequencyBodyAccelerationJerkSignalsMean-Z 
52.frequencyBodyAccelerationJerkSignalsStd-X 
53.frequencyBodyAccelerationJerkSignalsStd-Y 
54.frequencyBodyAccelerationJerkSignalsStd-Z 
55.frequencyBodyGyroscopeMean-X 
56.frequencyBodyGyroscopeMean-Y 
57.frequencyBodyGyroscopeMean-Z 
58.frequencyBodyGyroscopeStd-X 
59.frequencyBodyGyroscopeStd-Y 
60.frequencyBodyGyroscopeStd-Z 
61.frequencyBodyAccelerationMagnitudeMean 
62.frequencyBodyAccelerationMagnitudeStd
63.frequencyBodyAccelerationJerkSignalsMagnitudeMean 
64.frequencyBodyAccelerationJerkSignalsMagnitudeStd
65.frequencyBodyGyroscopeMagnitudeMean 
66.frequencyBodyGyroscopeMagnitudeStd 
67.frequencyBodyGyroscopeJerkSignalsMagnitudeMean 
68.frequencyBodyGyroscopeJerkSignalsMagnitudeStd 
69.angle(timeBodyAccelerationMean,gravity) 
70.angle(timeBodyAccelerationJerkSignalsMean,gravityMean) 
71.angle(timeBodyGyroscopeMean,gravityMean) 
72.angle(timeBodyGyroscopeJerkSignalsMean,gravityMean) 
73.angle(X,gravityMean) 
74.angle(Y,gravityMean) 
75.angle(Z,gravityMean)


### Summary steps

Following data transformations will be done by the `run_analysis.R` script.

1. For each of the training and test datasets, 
    1. Read the measurement values from `X_<dataset>.txt`
    2. Read column names from `features.txt`, make them readable and assigne them to our data..
    3. Add ActivityId and SubjectId to data, read from `y_<dataset>.txt` and `subject_<dataset>.txt` files.
    4. Remove columns that do not represent the mean or standard deviation.
2. Merge the training and the test sets into one dataset.
3. Get activity names from `activity_labels.txt`and merge them to the dataset
4. Melt the dataset by specifying ActivityID, ActivityName and SubjectID as ID variables.
5. Re cast the melted dataset with SubjectId and ActivityName as IDs and `mean` as the aggregator function.
6. Save result in `tidy.txt`