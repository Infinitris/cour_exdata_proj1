#Histogram plots frequency of global active power
#code works on assumption that data file is already in working directory
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

#convert date and time from string to date and time
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

#plot to png
print("Plotting data....")
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main =  "Global Active Power", xlab = "Global Active Power (kilowatts", col = "red")

dev.off()