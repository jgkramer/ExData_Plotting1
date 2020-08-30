
source("./loadData.R")

# note - call to re-used function to download and load data into data frame
DF <- loadData()

png(filename = "plot3.png", width = 480, height= 480, units = "px")

with(DF, 
     plot(Time, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(DF, lines(Time, Sub_metering_1, col = "black"))
with(DF, lines(Time, Sub_metering_2, col = "red"))
with(DF, lines(Time, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black", "red", "blue"))


dev.off()
