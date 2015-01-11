dataHPC <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataHPC$Date <- as.Date(dataHPC$Date, format="%d/%m/%Y")

dataChunk <- subset(dataHPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dataTimeDate <- as.POSIXct(paste(dataChunk$Date, dataChunk$Time), format = "%Y-%m-%d %H:%M:%S" )

par(mfrow=c(1,1))
plot(dataTimeDate, dataChunk$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )

dev.copy(png, 'Plot2.png', height=480, width=480)
dev.off()