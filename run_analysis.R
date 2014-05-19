# Contains 2 functions for creating tidy data from raw data. The raw data should be contained in UCI HAR Dataset/ folder.
# 'readData': Reads the data from the raw data file.
# 'createTidyData':  Reads the raw data inside the UCI HAR Dataset/ folder and converts it to tidy data which is written to a new file

library(reshape2)

readData <- function(dataset) {
  # Reads the data from the raw data file.
  #
  # Args:
  #   dataset: Name of the dataset, which should be contained in the UCI HAR Dataset/ folder.
  #
  # Returns:
  #   A data.frame with the mean and standard deviation mesurements from the given dataset. 
  
  # read the column names and rename them to make them more descriptive
  colNames <- read.table("UCI HAR Dataset/features.txt", header=FALSE, as.is=TRUE, col.names=c("ID", "ColumnNames"))$ColumnNames
  colNames <- gsub("-mean", colNames, replacement="Mean")
  colNames <- gsub("-std", colNames, replacement="Std")
  colNames <- gsub("^t", colNames, replacement="time")
  colNames <- gsub("^f", colNames, replacement="frequency")
  colNames <- gsub("tBody", colNames, replacement="timeBody")
  colNames <- gsub("BodyBody", colNames, replacement="Body")
  colNames <- gsub("\\(\\)", colNames, replacement="")
  colNames <- gsub("timeBodyGyroJerkMean\\)", colNames, replacement="timeBodyGyroJerkMean")
  colNames <- gsub("timeBodyAccJerkMean\\)", colNames, replacement="timeBodyAccJerkMean")
  colNames <- gsub("Mag", colNames, replacement="Magnitude")
  colNames <- gsub("Gyro", colNames, replacement="Gyroscope")
  colNames <- gsub("Acc", colNames, replacement="Acceleration")
  colNames <- gsub("Jerk", colNames, replacement="JerkSignals")
  
  # read the X data file into 'data'
  data <- read.table(paste0("UCI HAR Dataset/", dataset, "/X_", dataset, ".txt"), header=FALSE)
  colnames(data)<-colNames
  
  # read the Y data file and append to 'data'
  y_data <- read.table(paste0("UCI HAR Dataset/", dataset, "/y_", dataset, ".txt"), header=FALSE, col.names=c("ActivityID"))
  data$ActivityID <- y_data$ActivityID
  
  # read the subject data file and append to 'data'
  subject_data <- read.table(paste0("UCI HAR Dataset/", dataset, "/subject_", dataset, ".txt"), header=FALSE, col.names=c("SubjectID"))
  data$SubjectID <- subject_data$SubjectID
  
  # remove unused columns
  subset_colNames <- grep(".*ID|.*Mean[^A-Z]|.*Std[^A-Z]|.*Mean$|.*Std$", colnames(data))
  data <- data[, subset_colNames]

  # return the data
  data
}

createTidyData <- function(fname) {
  # Reads the raw data inside the UCI HAR Dataset/ folder and converts it to tidy data which is written to a new file
  #
  # Args:
  #   fname: Name of the file the tidy data should be written to.
  
  # load data
  data <- rbind(readData("test"), readData("train"))
  
  # read activities file, which maps ActivityID's to an ActivityName
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, as.is=TRUE, col.names=c("ActivityID", "ActivityName"))
  activity_labels$ActivityName <- as.factor(activity_labels$ActivityName)
  
  # merge ActivityName into data
  merged_data <- merge(data, activity_labels, by='ActivityID', all.x=TRUE)

  # melt the data
  id_vars = c("ActivityID", "ActivityName", "SubjectID")
  measure_vars = setdiff(colnames(data), id_vars)
  melted_data <- melt(merged_data, id=id_vars, measure.vars=measure_vars)
  
  # cast melted data back into data frame
  tidy_data <- dcast(melted_data, SubjectID + ActivityName ~ variable, mean)
    
  # write the tidy data to file
  write.table(tidy_data, fname, sep=";")
}

# run the function
createTidyData("./tidyData.csv")