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
png(file='./../figure/plot1.png',width = 480,height = 480)
#Plot the histogram
hist(x=pwrCons$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
#Close device
dev.off()
