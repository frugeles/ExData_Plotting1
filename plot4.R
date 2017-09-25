#Load the data  from file
powerconsum <- read.delim("./household_power_consumption.txt", sep=";",
                          na.strings = '?',stringsAsFactors = FALSE)
powerconsum$Date <- as.Date(strptime(powerconsum$Date,format = "%d/%m/%Y"))

# Filter the data
date1 <- as.Date(strptime("2007-02-01",format = "%Y-%m-%d"))
date2 <- as.Date(strptime("2007-02-02",format = "%Y-%m-%d"))
indVal <- which(powerconsum$Date == date1 | powerconsum$Date == date2)
powerconsumDate <- powerconsum[indVal,]

#Open device (png)
png(filename = "plot4.png",width = 480, height = 480)

#Define two rows and two columns with adjusted margins for better reading
par(mfrow=c(2,2),mar=c(4,4,1,1))

#Chart 1
plot(powerconsumDate$Global_active_power, type="l", ylim=range(powerconsumDate$Global_active_power),
     axes=F, ann=T, xlab=NA,ylab='Global Active Power')
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Chart 2
plot(powerconsumDate$Voltage, type="l", ylim=range(powerconsumDate$Voltage), axes=F, ann=T,
     xlab='datetime',ylab='Voltage')
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Chart 3
plot(powerconsumDate$Global_active_power, type="n", ylim=range(l_min,l_max), axes=F, ann=T, xlab=NA,
     ylab='Energy sub metering')
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
axis(2)
box()
lines(powerconsumDate$Sub_metering_1)
lines(powerconsumDate$Sub_metering_2,col='Red')
lines(powerconsumDate$Sub_metering_3,col='Blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c('Black','Red','Blue'),lty=c(1,1,1),cex=0.7)

#Chart 4
plot(powerconsumDate$Global_reactive_power, type="l", ylim=range(powerconsumDate$Global_reactive_power),
     axes=F, ann=T, xlab='datetime',ylab='Global_reactive_power')
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Close device
dev.off()
