data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character", na.strings="?")
# Subset the two dates we want to focus on
validDates <-  c("1/2/2007", "2/2/2007")
subset <- subset(data, data$fDate %in% validDates)
subset$datetime <- paste(subset$fDate, subset$Time)
# Convert the datetime string to Date
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %T")
png(file="plot4.png") #Open PNG device
par(mfrow = c(2, 2))
plot(subset$datetime, subset$Global_active_power, type="l",xlab="",ylab="Global Active Power",cex.axis= 0.7, cex.lab=0.7)
plot(subset$datetime, subset$Voltage, type="l",xlab="Datetime", ylab="Voltage", cex.axis= 0.7, cex.lab=0.7)
plot(subset$datetime, subset$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering", cex.axis= 0.7, cex.lab=0.7)
lines(subset$datetime, subset$Sub_metering_1)
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3, col="blue")
# Add Legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1, cex=0.5)
plot(subset$datetime, subset$Global_reactive_power, type="l",xlab="Datetime",ylab="Global_reactive_power",cex.axis= 0.7, cex.lab=0.7)
dev.off() #Close the PNG device