dataHPC <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataHPC$Date <- as.Date(dataHPC$Date, format="%d/%m/%Y")

dataChunk <- subset(dataHPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dataTimeDate <- as.POSIXct(paste(dataChunk$Date, dataChunk$Time), format = "%Y-%m-%d %H:%M:%S" )

par(mfrow=c(1,1))
plot(dataTimeDate, dataChunk$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="" )
lines(dataTimeDate, dataChunk$Sub_metering_2, col="red")
lines(dataTimeDate, dataChunk$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

dev.copy(png, 'Plot3.png', height=480, width=480)
dev.off()