dt <- fread("household_power_consumption.txt", na.strings = "?")
dt[,DateTime := strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
mydata<-dt[dt$DateTime>= strptime("1/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")&DateTime < strptime("3/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")]
png(file='plot1.png',width = 480, height = 480)
hist(mydata$Global_active_power,col="red",xlab='Global Active Power(kilowatts)',main='Global Active Power',axes = F)
axis(2,at=seq(0,1200,200))
dev.off()