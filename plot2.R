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
png("plot2.png", width = 480, height = 480)

plot(datetime,data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

