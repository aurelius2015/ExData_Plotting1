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

# Plot3
# Start PNG device driver to save output to Plot3.png
png(filename = "Plot3.png", width = 480, height = 480)

# set ylim to max of 3 Sub_metering data columns
max_y <- max(as.numeric(as.character(feb12$Sub_metering_1)),
             as.numeric(as.character(feb12$Sub_metering_2)),
             as.numeric(as.character(feb12$Sub_metering_3)))

# create plot for Date vs. Sub_metering_1 in black
plot(feb12$Date, as.character(feb12$Sub_metering_1),
     type="l", col="black",
     ylim = c(0, max_y),
     main = "",
     xlab="",
     ylab = "Energy sub metering")

# Graph Date vs. Sub_metering_2 in red
lines(feb12$Date, as.character(feb12$Sub_metering_2),
      type="l", col="red", ylim = c(0, max_y))

# Graph Date vs. Sub_metering_3 in blue
lines(feb12$Date, as.character(feb12$Sub_metering_3),
      type="l", col="blue", ylim = c(0, max_y))

# Create length for "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col = c("black", "red", "blue"),
       text.col = "black")

# close device driver
dev.off()
