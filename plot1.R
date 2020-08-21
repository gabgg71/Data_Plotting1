setwd("/house") 
datica <- read.table("household_power_consumption.txt", header = TRUE, sep =";",stringsAsFactors = FALSE,dec = ".")

datica <- datica[c(grep("1/2/2007", datica$Date), grep("2/2/2007", datica$Date)),]
datica$Date <- as.Date(datica$Date,"%d/%m/%Y")
datica <- datica[c(grep("2007-02-01", datica$Date), grep("2007-02-02", datica$Date)),]

datica$Global_active_power <- as.numeric(datica$Global_active_power)

png("plot1.png", width=480, height=480)
hist(datica$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()


