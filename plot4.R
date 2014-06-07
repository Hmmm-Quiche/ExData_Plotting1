# read data from file
house_power_consumption <- read.table("../household_power_consumption.txt", sep=";",
                                      header=TRUE, na.strings="?", stringsAsFactors=FALSE)

# take only subset of 2 days in february 2007
house_power_consumption <- subset(house_power_consumption, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01")
                                  & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

house_power_consumption$DateTime <- strptime(paste(house_power_consumption$Date,
                                                   house_power_consumption$Time),
                                             "%d/%m/%Y %H:%M:%S")

#start new png file
png("plot4.png")

#draw plots in 2 rows and 2 cols
par(mfrow=c(2,2))

Sys.setlocale("LC_TIME", "C")


# topleft graph
plot(house_power_consumption$DateTime, house_power_consumption$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")


# topright graph
plot(house_power_consumption$DateTime, house_power_consumption$Voltage, type="l",
     xlab="datetime", ylab="Voltage")


# bottomleft graph
plot(house_power_consumption$DateTime, house_power_consumption$Sub_metering_1 , type="l",
     xlab="", ylab="Energy sub metering")

lines(house_power_consumption$DateTime, house_power_consumption$Sub_metering_2 , col="red")

lines(house_power_consumption$DateTime, house_power_consumption$Sub_metering_3 , col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")


# bottomright graph
plot(house_power_consumption$DateTime, house_power_consumption$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

# close png file
dev.off()