## jkuriger
## Exploratory Data Analysis
## Course PRoject 1, plot 1
## creates a histogram showing the global active power

## NOTE  ##
## "Individual household electric power consumption Data Set" data file 
## mentioned in the README must be downloaded and the text file 
## "household_power_consumption.txt" must be in working directory


# read in data into data frame, changing ? to na
power_data <- read.table("household_power_consumption.txt", sep = ";", 
      header = TRUE, na.strings = "?", stringsAsFactors = F)

# create a subset of data that only contains the Feb 1-2, 2007
subset_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

# set the plot to be png formant
png("plot1.png")

# create histogram of global active power, making the bar color red.
hist(subset_data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

# close the plot file
dev.off() 
