start <- grep("1/2/2007",readLines("household_power_consumption.txt"))-1

nr <- grep("3/2/2007",readLines("household_power_consumption.txt"))-grep("1/2/2007",readLines("household_power_consumption.txt"))

power <- read.table("household_power_consumption.txt",skip = start,nrows = nr, header = F, sep = ";")
colnames(power) <- as.matrix(read.table("household_power_consumption.txt",nrows = 1, header = F, sep = ";"))

library(lubridate)
plot(dmy_hms(paste(power$Date,power$Time)),power$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "plot2.png")
dev.off()
edv.off()
