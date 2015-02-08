HPower <- read.table("data/household_power_consumption.txt", header=TRUE, sep = ';',
                     colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                     na.strings = "?",
                     nrow = 10)

HPower <- read.table("data/household_power_consumption.txt", header=TRUE, sep = ';',
                     na.strings = "?")
HPower <-na.omit(HPower)

# subset date
HPower <- HPower[HPower$Date %in% c("1/2/2007", "2/2/2007"),]

# convert date
HPower$Date <- strptime(paste(HPower$Date,HPower$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png",width = 480, height = 480)  ##plot to a PNG file

par(mfrow = c(2, 2),mar = c(4, 4, 1, 1))
plot( HPower$Date ,HPower$Global_active_power, 
      type="l", xlab="", ylab="Global Active Power")

plot( HPower$Date ,HPower$Voltage, 
      type="l", xlab="datetime", ylab="Voltage")

plot( HPower$Date ,HPower$Sub_metering_1, 
      type="l", xlab="", ylab="Energy Sub Metering")
lines(HPower$Date ,HPower$Sub_metering_2, col = "red")
lines(HPower$Date ,HPower$Sub_metering_3, col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot( HPower$Date ,HPower$Global_reactive_power, 
      type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()  ## close the PNG device!