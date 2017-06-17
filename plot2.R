dt <- fread("household_power_consumption.txt", na.strings = "?")
dt[,DateTime := strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
mydata<-dt[dt$DateTime>= strptime("1/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")&DateTime < strptime("3/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")]
png(file='plot2.png',width = 480, height = 480)
plot(mydata$DateTime,mydata$Global_active_power,type = 'l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off()