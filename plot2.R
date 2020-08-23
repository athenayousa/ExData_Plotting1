##read file
data.file<-"./household_power_consumption.txt"
data_power<-read.table(data.file,header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
data_subset<-data_power[data_power$Date %in% c("1/2/2007","2/2/2007") ,]

##plot
data_time<-strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(data_subset$Global_active_power)
png("plot2.png",width = 480,height = 480)
plot(data_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

