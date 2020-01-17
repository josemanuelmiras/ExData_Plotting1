#### Course Project Exploratory Data Analysis
###Data from https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
###This script is for creating the second of the four graphs required to complete the assignment


###Setting the working directory
getwd()
setwd(getwd())

###This code is for Checking whether data file exists. If not, it will unzip the file and create the "UCI HAR Dataset" directory.
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

###Reading the dataset
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
head(data)
str(data)

###Subsetting the dataset to have only the dates we are interested in
subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

###Transforming Date and Time from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

###Designing the required graph
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")

###~Creating the required PNG file
png(file = "plot2.png", width = 480, height = 480)
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
