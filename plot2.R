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
png("plot2.png")

Sys.setlocale("LC_TIME", "C")

#draw graph
plot(house_power_consumption$DateTime, house_power_consumption$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# close png file
dev.off()