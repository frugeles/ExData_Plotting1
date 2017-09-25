#Load the data  from file
powerconsum <- read.delim("./household_power_consumption.txt", sep=";",
                          na.strings = '?',stringsAsFactors = FALSE)
powerconsum$Date <- as.Date(strptime(pwrCons$Date,format = "%d/%m/%Y"))

# Filter the data
date1 <- as.Date(strptime("2007-02-01",format = "%Y-%m-%d"))
date2 <- as.Date(strptime("2007-02-02",format = "%Y-%m-%d"))
indVal <- which(powerconsum$Date == date1 | powerconsum$Date == date2)
powerconsumDate <- powerconsum[indVal,]

#Open device (png)
png(filename = "plot2.png",width = 480, height = 480)

#Plot the chart without axis
plot(powerconsumDate$Global_active_power, type="l", ylim=range(powerconsumDate$Global_active_power),
     axes=F, ann=T, xlab=NA,ylab='Global Active Power (Kilowatts)')
#Add x axis with three ticks and three labels
axis(1, at=c(0,nrow(powerconsumDate)/2,nrow(powerconsumDate)),labels=c('Thu','Fri','Sat'))
#Add y axis
axis(2)
#Box it up
box()
#Close device
dev.off()
