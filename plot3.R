start <- grep("1/2/2007",readLines("household_power_consumption.txt"))-1

nr <- grep("3/2/2007",readLines("household_power_consumption.txt"))-grep("1/2/2007",readLines("household_power_consumption.txt"))

power <- read.table("household_power_consumption.txt",skip = start,nrows = nr, header = F, sep = ";")
colnames(power) <- as.matrix(read.table("household_power_consumption.txt",nrows = 1, header = F, sep = ";"))

library(lubridate)
plot(dmy_hms(paste(power$Date,power$Time)),power$Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = "")
points(dmy_hms(paste(power$Date,power$Time)),power$Sub_metering_2,type = "l",col = "red")
points(dmy_hms(paste(power$Date,power$Time)),power$Sub_metering_3,type = "l",col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c(1,2,3),cex =0.8, lty = 1)

dev.copy(png, "plot3.png")
dev.off()
dev.off()
