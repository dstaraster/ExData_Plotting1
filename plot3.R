dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- dataset[dataset$Date == as.Date("2007-02-01", format="%Y-%m-%d") | dataset$Date == as.Date("2007-02-02", format="%Y-%m-%d"),]
dataset$Time <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3 <- as.numeric(as.character(dataset$Sub_metering_3))
png("plot3.png")
par(mar=c(3,4,2,2))
with(dataset, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(dataset, lines(Time, Sub_metering_2, col="red", type="l"))
with(dataset, lines(Time, Sub_metering_3, col="blue", type="l"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()