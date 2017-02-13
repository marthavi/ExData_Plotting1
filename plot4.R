# Read data 
GAP <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Tidying data

GAP$Date1 <- paste0(GAP$Date, GAP$Time)
GAP$Date1 <- dmy_hms(GAP$Date1)
GAP$Date <- dmy(GAP$Date)
gap <- GAP[GAP$Date >= "2007-02-01" & GAP$Date <= "2007-02-02", ]
gap$Global_active_power <- as.numeric(gap$Global_active_power)/1000*2
gap$Sub_metering_1 <- as.numeric(gap$Sub_metering_1)
gap$Sub_metering_2 <- as.numeric(gap$Sub_metering_2)
gap$Sub_metering_3 <- as.numeric(gap$Sub_metering_3)
gap$Global_reactive_power <- as.numeric(gap$Global_reactive_power)
gap$Voltage <- as.numeric(gap$Voltage)

# Plotting

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
with(gap, plot(Date1, Global_active_power, type = "l", ylab= "Global Active Power (Kilowatts)", xlab = ""))

with(gap, plot(Date1,Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(gap, plot(Date1, Sub_metering_1, type = "n", xlab = "", 
               ylab = "Energy Sub Metering"))
with(gap, points(Date1, Sub_metering_1, col= "black", type = "l"))
with(gap, points(Date1, Sub_metering_2, col= "red", type = "l"))
with(gap, points(Date1, Sub_metering_3, col= "blue", type = "l"))
legend("topright", lty= 1, col = c("black", "red", "blue"), 
       legend = c("Submeterin_1", "Submetering_2", "Submetering_3"))

with(gap, plot(Date1,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()

