setwd("C:/Users/yolimaa/Desktop/git/dataset/house")
datica <- read.table("household_power_consumption.txt", header = TRUE, sep =";",stringsAsFactors = FALSE,dec = ".")

datica <- datica[c(grep("1/2/2007", datica$Date), grep("2/2/2007", datica$Date)),]
datica$Date <- as.Date(datica$Date,"%d/%m/%Y")
datica <- datica[c(grep("2007-02-01", datica$Date), grep("2007-02-02", datica$Date)),]

fechas <- paste(datica$Date, datica$Time)
dateFormat <- strptime(fechas,format='%Y-%m-%d %H:%M:%S')

png("plot2.png", width=480, height=480)
with(datica, plot(dateFormat, Global_active_power, type ="l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()