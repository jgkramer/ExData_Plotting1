
source("./loadData.R")

# note - call to re-used function to download and load data into data frame
DF <- loadData()

png(filename = "plot1.png", width = 480, height= 480, units = "px")
with(DF, 
     hist(Global_active_power, 
          col = "red", 
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)"))

dev.off()


