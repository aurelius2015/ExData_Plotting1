# remove everything in the Global Environment
rm(list=ls())

# set working directory
setwd("C:/Documents and Settings/DP/My Documents/R/4-Exploratory Data Analysis/Assignment1")

# read data
pge <- read.table("household_power_consumption.txt", header = T, sep = ";")

# select rows that are for "1/2/2007" and "2/2/2007"
feb12 <- pge[pge$Date =="1/2/2007" | pge$Date == "2/2/2007",]

# combine "data and time" data into single column and put it in the date column
feb12$Date <- strptime(paste(feb12$Date, feb12$Time), "%d/%m/%Y %H:%M:%S")

# remove "time" column
feb12$Time <- NULL

# remove large data set "pge" from memory
rm(pge)

# Plot2
# Start PNG device driver to save output to Plot2.png
png(filename = "Plot2.png", width = 480, height = 480)

# create plot for Date vs. Global_active_power and put it in png file
plot(feb12$Date,as.character(feb12$Global_active_power),
     type = "l", 
     col = "black",
     main = "",
     xlab="",
     ylab = "Global Active Power (kilowatts)")

# close device driver
dev.off()