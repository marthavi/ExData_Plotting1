# Read data 
GAP <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Tidying data

GAP$Date1 <- paste0(GAP$Date, GAP$Time)
GAP$Date1 <- dmy_hms(GAP$Date1)
GAP$Date <- dmy(GAP$Date)

gap <- GAP[GAP$Date >= "2007-02-01" & GAP$Date <= "2007-02-02", ]

gap$Sub_metering_1 <- as.numeric(gap$Sub_metering_1)
gap$Sub_metering_2 <- as.numeric(gap$Sub_metering_2)
gap$Sub_metering_3 <- as.numeric(gap$Sub_metering_3)

# Plotting

png("plot3.png", width = 480, height = 480)
with(gap, plot(Date1, Sub_metering_1, type = "n", xlab = "", 
               ylab = "Energy Sub Metering"))
with(gap, points(Date1, Sub_metering_1, col= "black", type = "l"))
with(gap, points(Date1, Sub_metering_2, col= "red", type = "l"))
with(gap, points(Date1, Sub_metering_3, col= "blue", type = "l"))
legend("topright", lty= 1, col = c("black", "red", "blue"), 
       legend = c("Submeterin_1", "Submetering_2", "Submetering_3"))
dev.off()
