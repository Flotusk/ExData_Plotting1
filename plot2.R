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

png(file = "plot2.png")
plot(dt, power2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(dt, power2$Global_active_power, type = "l", col = "black")
dev.off()

## source("plot1.R) to run