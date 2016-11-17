##setwd()

fileurl <- "~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt"

library(data.table)

power <- fread(fileurl, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## used str(power), head(power), names(power) to gather some more information
##regarding my table
## subset just those 2 days in february

power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]
dates <- power2[, Date]
times <- power2[, Time]
datestimes <- paste(dates, times)
dt <- strptime(datestimes, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")
plot(dt, power2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(dt, power2$Sub_metering_1, type = "l", col = "black")
lines(dt, power2$Sub_metering_2, type = "l", col = "red")
lines(dt, power2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-", col = c("black", "red", "blue"))
dev.off()

## source("plot1.R) to run