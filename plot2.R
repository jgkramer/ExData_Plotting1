
source("./loadData.R")

# note - call to re-used function to download and load data into data frame
DF <- loadData()

png(filename = "plot2.png", width = 480, height= 480, units = "px")

with(DF, 
     plot(Time, Global_active_power,
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))

dev.off()
