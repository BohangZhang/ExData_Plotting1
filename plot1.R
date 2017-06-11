start <- grep("1/2/2007",readLines("household_power_consumption.txt"))-1

nr <- grep("3/2/2007",readLines("household_power_consumption.txt"))-grep("1/2/2007",readLines("household_power_consumption.txt"))

power <- read.table("household_power_consumption.txt",skip = start,nrows = nr, header = F, sep = ";")
colnames(power) <- as.matrix(read.table("household_power_consumption.txt",nrows = 1, header = F, sep = ";"))

hist(power$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200))


dev.copy(png, "plot1.png")
dev.off()
dev.off()
