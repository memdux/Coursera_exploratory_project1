
rawdata <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")


object.size(rawdata)

str(rawdata)

levels(rawdata$Date)

rawdata$Date = as.Date(rawdata$Date, format = "%d/%m/%Y")

filterdata <- subset(rawdata, Date >= "2007-02-01")
filterdata <- subset(filterdata, Date <= "2007-02-02")

str(filterdata)

rm(rawdata)

# Plot 2

filterdata$DateTime = as.POSIXct(paste(filterdata$Date, filterdata$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
plot(filterdata$DateTime, filterdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab ="", type = "l")
dev.off()

