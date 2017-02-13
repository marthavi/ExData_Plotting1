
library(lubridate)
# Read data 
GAP <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Tidying data

GAP$Date <- dmy(GAP$Date)
gap <- GAP[GAP$Date >= "2007-02-01" & GAP$Date <= "2007-02-02", ]

# Creating PNG file

png("plot1.png", width = 480, height = 480)

hist(as.numeric(gap$Global_active_power)*2/1000, col= "red", main = "Global Active Power",
     xlab= "Global Active Power (Kilowatts)")

dev.off()

