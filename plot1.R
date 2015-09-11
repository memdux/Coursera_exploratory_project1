
rawdata <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")


object.size(rawdata)

str(rawdata)

levels(rawdata$Date)

rawdata$Date = as.Date(rawdata$Date, format = "%d/%m/%Y")

filterdata <- subset(rawdata, Date >= "2007-02-01")
filterdata <- subset(filterdata, Date <= "2007-02-02")

str(filterdata)

rm(rawdata)

# Plot 1

filterdata$Global_active_power = as.numeric(sub(",", ".", filterdata$Global_active_power, fixed = TRUE))

png(filename="plot1.png")

hist(filterdata$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()





