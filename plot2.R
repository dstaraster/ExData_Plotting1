dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- dataset[dataset$Date == as.Date("2007-02-01", format="%Y-%m-%d") | dataset$Date == as.Date("2007-02-02", format="%Y-%m-%d"),]
dataset$Time <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
png("plot2.png")
with(dataset, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()