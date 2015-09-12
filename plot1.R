dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- dataset[dataset$Date == as.Date("2007-02-01", format="%Y-%m-%d") | dataset$Date == as.Date("2007-02-02", format="%Y-%m-%d"),]
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
png("plot1.png")
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

