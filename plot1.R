##read file
data.file<-"./household_power_consumption.txt"
data_power<-read.table(data.file,header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
data_subset<-data_power[data_power$Date %in% c("1/2/2007","2/2/2007") ,]

##plot
global_active_power<-as.numeric(data_subset$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(global_active_power,col="red",main="global active power",xlab="global active power(kilowatts)")
dev.off()