#####   plot2 code  #####

### Reading data
data <- read.table("household_power_consumption.txt",header = F, sep = ";" ,
                   skip = grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1,
                   nrows = grep("3/2/2007", readLines("household_power_consumption.txt"))[1] 
                   - grep("1/2/2007", readLines("household_power_consumption.txt"))[1],
                   na.strings = "?"
                   ) # only read lines with specific days
colnames(data) <- read.table("household_power_consumption.txt",header = F, sep = ";" ,nrow = 1) # setname

### plot the figure
dateTime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S" )

png("plot2.png")
plot(x = dateTime, y = data$Global_active_power,type="n", ylab = "Global Active Power(kilowatts)",xlab = "")
lines(x = dateTime, y = data$Global_active_power,type="l", col = "black")
dev.off()
