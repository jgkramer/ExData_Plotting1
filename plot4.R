
source("./loadData.R")

# note - call to re-used function to download and load data into data frame
DF <- loadData()

png(filename = "plot4.png", width = 480, height= 480, units = "px")

par(mfrow = c(2, 2))

#upper left (same as plot 2)
with(DF, 
     plot(Time, Global_active_power,
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))


#upper right
with(DF, 
     plot(Time, Voltage,
          type = "l", 
          xlab = "datetime", 
          ylab = "Voltage"))

#lower left (same as plot 3)
with(DF, 
     plot(Time, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(DF, lines(Time, Sub_metering_1, col = "black"))
with(DF, lines(Time, Sub_metering_2, col = "red"))
with(DF, lines(Time, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black", "red", "blue"), bty = "n")


#lower right
with(DF, 
     plot(Time, Global_reactive_power,
          type = "l", 
          xlab = "datetime", 
          ylab = "Global_reactive_power"))

dev.off()
