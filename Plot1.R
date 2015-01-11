dataHPC <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataHPC$Date <- as.Date(dataHPC$Date, format="%d/%m/%Y")

dataChunk <- subset(dataHPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

hist(dataChunk$Global_active_power, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)", col="Red")

par(mfrow=c(1,1))
dev.copy(png, 'Plot1.png', height=480, width=480)
dev.off()
