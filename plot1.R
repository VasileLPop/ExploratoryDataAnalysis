

################  Exploratory-Data-Analysis Plot1  ##############################

##  Working directory
getwd() # Shows the working directory (wd)
setwd("D://R Course/C4 Explanatory Analysis") # Changes the wd

## Import Data into R
electricpower <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
electricpower$Date <- as.Date(electricpower$Date, format="%d/%m/%Y")

## Subsetting the data for only 2 days specified
electricpower2days <- subset(electricpower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## remove original data
rm(electricpower)

## Converting dates
datetime <- paste(as.Date(electricpower2days$Date), electricpower2days$Time)
electricpower2days$Datetime <- as.POSIXct(datetime)

## Create Plot 1
hist(electricpower2days$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


