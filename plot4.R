

################  Exploratory-Data-Analysis Plot 4  ##############################

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

## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(electricpower2days, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

