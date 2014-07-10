data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character", na.strings="?")
# Subset the two dates we want to focus on
validDates <-  c("1/2/2007", "2/2/2007")
subset <- subset(data, data$fDate %in% validDates)
hist(as.numeric(subset$Global_active_power), col="red",main = "Global Active Power",xlab ="Global Active Power(Kilowatts)" )
dev.copy(png, file="plot1.png") #copy the plot to a PNG file
dev.off() #Close the PNG device
