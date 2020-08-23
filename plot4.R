##read file
data.file<-"./household_power_consumption.txt"
data_power<-read.table(data.file,header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
data_subset<-data_power[data_power$Date %in% c("1/2/2007","2/2/2007") ,]

##plot
data_time<-strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(data_subset$Global_active_power)
global_reactive_power <- as.numeric(data_subset$Global_reactive_power)
voltage <- as.numeric(data_subset$Voltage)
subMetering_1 <- as.numeric(data_subset$Sub_metering_1)
subMetering_2 <- as.numeric(data_subset$Sub_metering_2)
subMetering_3 <- as.numeric(data_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data_time, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_time, subMetering_2, type="l", col="red")
lines(data_time, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()