### 
# This script uses data from http://archive.ics.uci.edu/ml/
# The specifci data set is : https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption#
#
# This script assumes the dataset 
# (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) 
# is already downloaded and unzipped in the working directory
# (to prevent performance or networking issues)
#
# Note after unzipping the data is found in the file household_power_consumption.txt
#

# Goal   : Create a histogram over a 2 day period in 2007
# 
# Format : PNG
# Size   : 480 pixels x 480 pixels

# Read set from current working directory

# Make sure we read the date as a class Date
setClass("text2Date")
setAs("character","text2Date", function(from) as.Date(from, format="%d/%m/%Y") )

# Read all data <TODO filter while reading>
HoHoPowerCons <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("myDate", "character", rep("numeric", 7)))

# get subset for plots only interested in  2007-02-01 and 2007-02-02
# could do this in one line with the hist command...s
plotperiod <- HoHoPowerCons[which(HoHoPowerCons$Date >= "2007-02-01" & HoHoPowerCons$Date <= "2007-02-02"),]

# Histogram of the global active power
# screen: hist(plotperiod$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# for png (note default size is 480x480, which is the requested size.)
png("plot1.png")
hist(plotperiod$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
