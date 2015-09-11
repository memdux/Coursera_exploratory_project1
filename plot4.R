
rawdata <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")

object.size(rawdata)

str(rawdata)

levels(rawdata$Date)

rawdata$Date = as.Date(rawdata$Date, format = "%d/%m/%Y")

filterdata <- subset(rawdata, Date >= "2007-02-01")
filterdata <- subset(filterdata, Date <= "2007-02-02")

str(filterdata)

rm(rawdata)


filterdata$Global_active_power = as.numeric(sub(",", ".", filterdata$Global_active_power, fixed = TRUE))

filterdata$DateTime = as.POSIXct(paste(filterdata$Date, filterdata$Time), format="%Y-%m-%d %H:%M:%S")

# plot 4

png(filename="plot4.png")

par(mfrow=c(2,2))

# plot 4.1
plot(filterdata$DateTime, filterdata$Global_active_power, ylab = "Global Active Power", xlab ="", type = "l")
# plot 4.2
plot(filterdata$DateTime, filterdata$Voltage, ylab = "Voltage", xlab ="datetime", type = "l")

#plot 4.3

plot(filterdata$DateTime, filterdata$Sub_metering_1, ylab = "Energy sub metering",
     xlab ="", type = "l")

par(new=TRUE)
plot(filterdata$DateTime, filterdata$Sub_metering_2, ylab = "Energy sub metering",
     xlab ="", type = "l",
     axes =FALSE,
     col = "red",
     ylim = range(0, 40))

par(new=TRUE)

plot(filterdata$DateTime, filterdata$Sub_metering_3, ylab = "Energy sub metering", 
     xlab ="", type = "l", 
     axes =FALSE, 
     col = "blue",
     ylim = range(0, 40))

legend('topright', c(names(filterdata[7]) , names(filterdata[8]), names(filterdata[9])),
       lty=1, col=c('black', 'red', 'blue'), cex=.5, border = TRUE)
#plot 4.4

plot(filterdata$DateTime, filterdata$Global_reactive_power, ylab = "Global_reactive_power", xlab ="datetime", type = "l")

dev.off()