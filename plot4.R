#setwd("C:/Users/yolimaa/Desktop/git/dataset/house")
#datica <- read.table("household_power_consumption.txt", header = TRUE, sep =";",stringsAsFactors = FALSE,dec = ".")
#datica <- datica[c(grep("1/2/2007", datica$Date), grep("2/2/2007", datica$Date)),]
#datica$Date <- as.Date(datica$Date,"%d/%m/%Y")
#datica <- datica[c(grep("2007-02-01", datica$Date), grep("2007-02-02", datica$Date)),]
#fechas <- paste(datica$Date, datica$Time)
#dateFormat <- strptime(fechas,format='%Y-%m-%d %H:%M:%S')
datica$Sub_metering_1 <- as.numeric(datica$Sub_metering_1)
datica$Sub_metering_2 <- as.numeric(datica$Sub_metering_2)
datica$Sub_metering_3 <- as.numeric(datica$Sub_metering_3)
datica$Global_active_power <- as.numeric(datica$Global_active_power)

par(mfrow= c(2,2))

png("plot4.png", width=480, height=480)
with(datica, plot(dateFormat, Global_active_power, type ="l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
with(datica, plot(dateFormat, Voltage, type ="l", xlab = "datetime", ylab = "Voltage"))
plot(dateFormat, datica$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateFormat, datica$Sub_metering_2, type="l", col="red")
lines(dateFormat, datica$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
with(datica, plot(dateFormat, Global_reactive_power, type ="l", xlab = "datetime"))
dev.off()