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

# Plot1
# Start PNG device driver to save output to Plot1.png
png(filename = "Plot1.png", width = 480, height = 480)

# create histogram for Global_active_power and put it in png file
hist(as.numeric(as.character(feb12$Global_active_power)),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# close device driver
dev.off()
