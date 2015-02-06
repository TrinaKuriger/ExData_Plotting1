## jkuriger
## Exploratory Data Analysis
## Course PRoject 1, plot 3
## creates a plot of energy sub-metering over timecourse of 2 days

## NOTES  ##
## "Individual household electric power consumption Data Set" data file 
## mentioned in the README must be downloaded and the text file 
## "household_power_consumption.txt" must be in working directory

## must have lubridate package installed


# use lubridate package to convert dates and times
library(lubridate)

# read in data into data frame, changing ? to na
power_data <- read.table("household_power_consumption.txt", sep = ";", 
      header = TRUE, na.strings = "?", stringsAsFactors = F)

# create a subset of data that only contains the Feb 1-2, 2007
subset_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

# add an additional column, datetime, containing combined date and time 
#     information to the subsetted dataframe 
subset_data$datetime <- dmy(subset_data$Date) + hms(subset_data$Time)

# set the plot to be a png file
png("plot3.png")

# plot sub-metering1 against datetime using line graph 
plot(Sub_metering_1 ~ datetime, data = subset_data,   
     type = "l", ylab = "Energy sub metering", xlab = "")
# add red line for submetering2
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
# add blue line for submetering3
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
#add legend, use names of columns as legend names
legend("topright", col = c("black", "red", "blue"), lty = c("solid", "solid", 
      "solid"), legend = names(subset_data[,7:9]))     

# close the plot file
dev.off()


