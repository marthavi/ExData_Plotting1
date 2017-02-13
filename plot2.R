library(lubridate)

# Read data 
GAP <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# Tidying data

GAP$Date1 <- paste0(GAP$Date, GAP$Time)
GAP$Date1 <- dmy_hms(GAP$Date1)
GAP$Date <- dmy(GAP$Date)
gap <- GAP[GAP$Date >= "2007-02-01" & GAP$Date <= "2007-02-02", ]
gap$Global_active_power <- as.numeric(gap$Global_active_power)/1000*2



# Plotting

png("plot2.png", width = 480, height = 480)
with(gap, plot(Date1, Global_active_power, type = "l", ylab= "Global Active Power (Kilowatts)", xlab = ""))
dev.off()
