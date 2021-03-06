house <- read.csv("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE,dec=".")
two_data <- subset(house,(Date %in% c("1/2/2007","2/2/2007")))
s_act_1 <- as.numeric(two_data$Global_active_power)
merge_time <- paste(two_data$Date,two_data$Time)
strp_time <- strptime(merge_time,"%d/%m/%Y %H:%M:%S")
sub_1 <- as.numeric(two_data$Sub_metering_1)
sub_2 <- as.numeric(two_data$Sub_metering_2)
sub_3 <- as.numeric(two_data$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(strp_time,sub_1,type="l",col="Black",xlab="",ylab="Energy sub metering" )
lines(strp_time,sub_2,type="l",col="Red")
lines(strp_time,sub_3,type="l",col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("Black","Red","Blue"))
dev.off()
