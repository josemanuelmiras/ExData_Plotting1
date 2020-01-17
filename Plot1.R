#### Course Project Exploratory Data Analysis
###Data from https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
###This script is for creating the first of the four graphs required to complete the assignment


###Setting the working directory
getwd()
setwd(getwd())

###This code is for Checking whether data file exists. If not, it will unzip the file and create the "UCI HAR Dataset" directory.
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

###Rough calculation about how much memory is needed
#2075259 * 9 * 8  ##Rows by columns by bytes
#149418648/220 ## bytes/MB
#679175.7 #MB
#0.68 #GB

###Reading the dataset
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
head(data)
str(data)

###Subsetting the dataset to have only the dates we are interested in
subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

###Designing the histogram
hist(as.numeric(as.character(subpower$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

###Saving the histogram into a PNG file
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(subpower$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
