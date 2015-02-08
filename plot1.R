
HPower <- read.table("data/household_power_consumption.txt", header=TRUE, sep = ';',
                     na.strings = "?")
HPower <-na.omit(HPower) # Delete NA
HPower <- HPower[HPower$Date %in% c("1/2/2007", "2/2/2007"),] # subset date
HPower$Date <- strptime(paste(HPower$Date,HPower$Time), "%d/%m/%Y %H:%M:%S")# convert date

#Plot Histogram 
hist(HPower$Global_active_power, 
     col ="orangered", 
     xlab= "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, file = "plot1.png",width = 480, height = 480,)  ## Copy plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
