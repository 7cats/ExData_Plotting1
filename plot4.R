#####   plot4 code  #####

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

png("plot4.png")
par(mfrow=c(2,2))
# (1,1)
plot(x = dateTime, y = data$Global_active_power,type="n", ylab = "Global Active Power",xlab = "")
lines(x = dateTime, y = data$Global_active_power,type="l", col = "black")

# (1,2)
plot(x = dateTime, y = data$Voltage,type="n", ylab = "Voltage",xlab = "datetime")
lines(x = dateTime, y = data$Voltage,type="l", col = "black")

# (2,1)
plot(x = dateTime, y = data$Sub_metering_1,type="n", ylab = "Energy sub metering",xlab = "",
     ylim = c(min(data$Sub_metering_1), max(data$Sub_metering_1))
    )
lines(x = dateTime, y = data$Sub_metering_1, col = "black")
lines(x = dateTime, y = data$Sub_metering_2, col = "red")
lines(x = dateTime, y = data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,
       col = c("black","red","blue"),bty = "n")

# (2,2)
plot(x = dateTime, y = data$Global_reactive_power,type="n", ylab = "Voltage",xlab = "datetime",
     ylim = c(min(data$Global_reactive_power), max(data$Global_reactive_power))
              )
lines(x = dateTime, y = data$Global_reactive_power,type="l", col = "black")

#
dev.off()
