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
png(filename = "plot3.png",width = 480, height = 480)

#List min and max of sub metering variables to define proper range
l_min<-c(min(powerconsumDate$Sub_metering_1),min(powerconsumDate$Sub_metering_2),min(powerconsumDate$Sub_metering_3))
l_max<-c(max(powerconsumDate$Sub_metering_1),max(powerconsumDate$Sub_metering_2),max(powerconsumDate$Sub_metering_3))

#Plot the chart without axis
plot(powerconsumDate$Global_active_power, type="n", ylim=range(l_min,l_max), axes=F, ann=T,
     xlab=NA,ylab='Energy sub metering')
#Add x axis with three ticks and three labels
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
#Add y axis
axis(2)
#Box it up
box()

#Add lines for each sub metering variable
lines(powerconsumDate$Sub_metering_1)
lines(powerconsumDate$Sub_metering_2,col='Red')
lines(powerconsumDate$Sub_metering_3,col='Blue')

#Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c('Black','Red','Blue'),lty=c(1,1,1))

#Close device
dev.off()

