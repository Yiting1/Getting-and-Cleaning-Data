#Step1
if(!file.exists("UCI HAR Dataset")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "data.zip")
  unzip("data.zip")
}


data.features <- read.table("UCI HAR Dataset/features.txt", header = F, sep = " ")
data.activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = F, sep = " ")


#Step2 Load Train Data
train.x <- read.table("UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

data.x <- rbind(train.x, test.x)
data.y <- rbind(train.y, test.y)

data.subject <- rbind(train.subject, test.subject)

features.mean.std <- grepl("mean\\(\\)|std\\(\\)",data.features[,2])
data.extract.x <- data.x[,features.mean.std]
names(data.extract.x) <- data.features[features.mean.std,2]



names(data.y) <- "activityId"
names(data.activity.labels) <- c("activityId","activity")
data.y.named <- merge(data.y, data.activity.labels, by.x = "activityId", by.y = "activityId")[, 2]
data <- cbind(data.subject, data.y.named, data.extract.x)
names(data)[1] <- "subject"
names(data)[2] <- "activity"
write.table(data, "tidy_data.txt", row.names = F)
