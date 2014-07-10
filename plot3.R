data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character", na.strings="?")
# Subset the two dates we want to focus on
validDates <-  c("1/2/2007", "2/2/2007")
subset <- subset(data, data$fDate %in% validDates)
subset$datetime <- paste(subset$fDate, subset$Time)
# Convert the datetime string to Date
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %T")
png(file="plot3.png") #Open PNG device

# Create the line plot
plot(subset$datetime, subset$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering",cex.axis= 0.7, cex.lab=0.7)
lines(subset$datetime, subset$Sub_metering_1)
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3, col="blue")
# Add Legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1, cex=0.5)
dev.off() #Close the PNG device