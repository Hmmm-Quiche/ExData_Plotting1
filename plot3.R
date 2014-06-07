# read data from file
house_power_consumption <- read.table("../household_power_consumption.txt", sep=";",
                                      header=TRUE, na.strings="?", stringsAsFactors=FALSE)

# take only subset of 2 days in february 2007
house_power_consumption <- subset(house_power_consumption, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01")
                                  & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

house_power_consumption$DateTime <- strptime(paste(house_power_consumption$Date,
                                                   house_power_consumption$Time),
                                             "%d/%m/%Y %H:%M:%S")

#house_power_consumption <- subset(house_power_consumption, as.Date(DateTime) >= as.Date("2007-02-01")
#                                  & as.Date(DateTime) <= as.Date("2007-02-02"))

#start new png file
png("plot3.png")

Sys.setlocale("LC_TIME", "C")

#draw graph
plot(house_power_consumption$DateTime, house_power_consumption$Sub_metering_1 , type="l",
     xlab="", ylab="Energy sub metering")

lines(house_power_consumption$DateTime, house_power_consumption$Sub_metering_2 , col="red")

lines(house_power_consumption$DateTime, house_power_consumption$Sub_metering_3 , col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))

# close png file
dev.off()