##setwd()

fileurl <- "~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt"

library(data.table)

power <- fread(fileurl, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## used str(power), head(power), names(power) to gather some more information
##regarding my table
## subset just those 2 days in february

power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

png(file = "plot1.png")
hist(power2$Global_active_power, col = "red", main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

## source("plot1.R) to run