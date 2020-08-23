##read file
data.file<-"./household_power_consumption.txt"
data_power<-read.table(data.file,header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
data_subset<-data_power[data_power$Date %in% c("1/2/2007","2/2/2007") ,]

##plot
data_time<-strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(data_subset$Global_active_power)
subMetering_1 <- as.numeric(data_subset$Sub_metering_1)
subMetering_2 <- as.numeric(data_subset$Sub_metering_2)
subMetering_3 <- as.numeric(data_subset$Sub_metering_3)
png("plot3.png",width = 480,height = 480)
plot(data_time, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_time, subMetering_2, type="l", col="red")
lines(data_time, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()