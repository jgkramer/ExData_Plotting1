
library(dplyr)
library(hms)

# this function: 
# 1. downloads data (if necessary), 
# 2. reads the text file into a data frame
# 3. formats date and time columns and filters for two desired days
# 4. returns the resulting data frame

loadData <- function() {
  if(!file.exists("./data"))
    dir.create("./data")
  
  if(!file.exists("./data/household_power_consumption.txt")){
    URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(URL, destfile = "./data/power.zip")
    unzip("./data/power.zip", exdir = "./data")
  }
  
  DF <- read.table(file = "./data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
  
  DF <- DF %>% 
    mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
    filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) %>%
    mutate(Time = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))
  
  DF
}



