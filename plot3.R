dt <- fread("household_power_consumption.txt", na.strings = "?")
dt[,DateTime := strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
mydata<-dt[dt$DateTime>= strptime("1/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")&DateTime < strptime("3/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")]
png(file='plot3.png',width = 480, height = 480)
with(mydata,plot(DateTime,Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering"))
with(mydata,lines(DateTime,Sub_metering_2,type='l',col="red"))
with(mydata,lines(DateTime,Sub_metering_3,type='l',col="blue"))
legend('topright',lty=c(1,1),col=c('black','red','blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()