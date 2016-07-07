#plots line chart of Active Global Power vs date
print("checking if required packages are installed")
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("lubridate")) {
  install.packages("lubridate")
}
#read data in
filepath <- "./household_power_consumption.txt"
print("reading data in")
fulldata <- read.table(filepath, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", nrows = 100000)

#subset data
print("subsetting data")
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

#remove the original data
rm(fulldata)

c_datetime <- paste(data$Date, data$Time, sep=" ")

#convert date and time from string to date and time
datetime <- dmy_hms(c_datetime)

#plot to png
print("Plotting data....")
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#Plot first chart
plot(datetime, data$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

#Plot second chart
plot(datetime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

#Plot third chart
plot(datetime,data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col = "black")
lines(datetime,data$Sub_metering_2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red")
lines(datetime,data$Sub_metering_3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

#Plot fourth chart
plot(datetime, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()