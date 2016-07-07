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
png("plot3.png", width = 480, height = 480)

plot(datetime,data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(datetime,data$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(datetime,data$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()