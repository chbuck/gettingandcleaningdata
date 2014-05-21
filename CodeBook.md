## Codebook

### Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The sources for the data are here:
- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Variable Descriptions

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcceleration-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerkSignals-XYZ and timeBodyGyroscopeJerkSignals-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, timeBodyGyroscopeJerkSignalsMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkSignalsMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerkSignals-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerationMagnitude, frequencyBodyAccelerationJerkSignalsMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkSignalsMagnitude.. 

We only estimated the mean and the standard deviation (std) values from that data. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Angle describes the angle between two vectors.


The set of variables that were estimated from these signals are: 
- SubjectID 
- ActivityName
- timeBodyAccelerationMean-X 
- timeBodyAccelerationMean-Y 
- timeBodyAccelerationMean-Z 
- timeBodyAccelerationStd-X 
- timeBodyAccelerationStd-Y 
- timeBodyAccelerationStd-Z 
- timeGravityAccelerationMean-X 
- timeGravityAccelerationMean-Y 
- timeGravityAccelerationMean-Z 
- timeGravityAccelerationStd-X 
- timeGravityAccelerationStd-Y 
- timeGravityAccelerationStd-Z 
- timeBodyAccelerationJerkSignalsMean-X 
- timeBodyAccelerationJerkSignalsMean-Y 
- timeBodyAccelerationJerkSignalsMean-Z 
- timeBodyAccelerationJerkSignalsStd-X 
- timeBodyAccelerationJerkSignalsStd-Y 
- timeBodyAccelerationJerkSignalsStd-Z 
- timeBodyGyroscopeMean-X 
- timeBodyGyroscopeMean-Y 
- timeBodyGyroscopeMean-Z 
- timeBodyGyroscopeStd-X 
- timeBodyGyroscopeStd-Y 
- timeBodyGyroscopeStd-Z 
- timeBodyGyroscopeJerkSignalsMean-X 
- timeBodyGyroscopeJerkSignalsMean-Y 
- timeBodyGyroscopeJerkSignalsMean-Z 
- timeBodyGyroscopeJerkSignalsStd-X 
- timeBodyGyroscopeJerkSignalsStd-Y 
- timeBodyGyroscopeJerkSignalsStd-Z 
- timeBodyAccelerationMagnitudeMean 
- timeBodyAccelerationMagnitudeStd 
- timeGravityAccelerationMagnitudeMean 
- timeGravityAccelerationMagnitudeStd 
- timeBodyAccelerationJerkSignalsMagnitudeMean 
- timeBodyAccelerationJerkSignalsMagnitudeStd
- timeBodyGyroscopeMagnitudeMean 
- timeBodyGyroscopeMagnitudeStd 
- timeBodyGyroscopeJerkSignalsMagnitudeMean 
- timeBodyGyroscopeJerkSignalsMagnitudeStd 
- frequencyBodyAccelerationMean-X 
- frequencyBodyAccelerationMean-Y 
- frequencyBodyAccelerationMean-Z 
- frequencyBodyAccelerationStd-X 
- frequencyBodyAccelerationStd-Y 
- frequencyBodyAccelerationStd-Z
- frequencyBodyAccelerationJerkSignalsMean-X
- frequencyBodyAccelerationJerkSignalsMean-Y 
- frequencyBodyAccelerationJerkSignalsMean-Z 
- frequencyBodyAccelerationJerkSignalsStd-X 
- frequencyBodyAccelerationJerkSignalsStd-Y 
- frequencyBodyAccelerationJerkSignalsStd-Z 
- frequencyBodyGyroscopeMean-X 
- frequencyBodyGyroscopeMean-Y 
- frequencyBodyGyroscopeMean-Z 
- frequencyBodyGyroscopeStd-X 
- frequencyBodyGyroscopeStd-Y 
- frequencyBodyGyroscopeStd-Z 
- frequencyBodyAccelerationMagnitudeMean 
- frequencyBodyAccelerationMagnitudeStd
- frequencyBodyAccelerationJerkSignalsMagnitudeMean 
- frequencyBodyAccelerationJerkSignalsMagnitudeStd
- requencyBodyGyroscopeMagnitudeMean 
- frequencyBodyGyroscopeMagnitudeStd 
- frequencyBodyGyroscopeJerkSignalsMagnitudeMean 
- frequencyBodyGyroscopeJerkSignalsMagnitudeStd 
- angle(timeBodyAccelerationMean,gravity) 
- angle(timeBodyAccelerationJerkSignalsMean,gravityMean) 
- angle(timeBodyGyroscopeMean,gravityMean) 
- angle(timeBodyGyroscopeJerkSignalsMean,gravityMean) 
- angle(X,gravityMean) 
- angle(Y,gravityMean) 
- angle(Z,gravityMean)

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