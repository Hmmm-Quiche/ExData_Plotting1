# read data from file
house_power_consumption <- read.table("../household_power_consumption.txt", sep=";",
                                  header=TRUE, na.strings="?", stringsAsFactors=FALSE)

# take only subset of 2 days in february 2007
house_power_consumption <- subset(house_power_consumption, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01")
                                                            & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

#start new png file
png("plot1.png")

# draw histogram of Global active power
hist(house_power_consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# close png file
dev.off()