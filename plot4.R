## jkuriger
## Exploratory Data Analysis
## Course PRoject 1, plot 4
## creates a figure showing four graphs displaying different variables over 
## the same 2-day period: (1) global active power. (2) voltage, (3) sub- 
## metering, and (4) global reactive power

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

# set the plot to be png formant
png("plot4.png")

# set parameters so that figure is a 2x2 display of the four graphs
par(mfrow=c(2,2))

#------------------ first quadrant ------------------------
# plot global active power against datetime using line graph 
plot(subset_data$datetime, subset_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

#------------------ second quadrant ------------------------
# plot voltage against datetime using line graph
plot(subset_data$datetime, subset_data$Voltage, type = "l", 
     xlab = "datetime", ylab ="Voltage")

#------------------ third quadrant ------------------------
# plot sub-metering1 against datetime using line graph 
plot(Sub_metering_1 ~ datetime, data = subset_data,   
     type = "l", ylab = "Energy sub metering", xlab = "")
# add red line for submetering2
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
# add blue line for submetering3
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
#add legend, use names of columns as legend names
legend("topright", col = c("black", "red", "blue"), lty = c("solid", "solid", 
      "solid"), bty = "n", legend = names(subset_data[,7:9])) 

#------------------ fourth quadrant ------------------------
# plot global reactive power against datetime using line graph
plot(subset_data$datetime, subset_data$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab ="Global_reactive_power")

# close the plot file
dev.off()
