data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character", na.strings="?")
# Subset the two dates we want to focus on
validDates <-  c("1/2/2007", "2/2/2007")
subset <- subset(data, data$fDate %in% validDates)
subset$datetime <- paste(subset$fDate, subset$Time)
# Convert the datetime string to Date
subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %T")
# Create the line plot
plot(subset$datetime, subset$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)",cex.axis= 0.7, cex.lab=0.7)
dev.copy(png, file="plot2.png") #copy the plot to a PNG file
dev.off() #Close the PNG device