house <- read.csv("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE,dec=".")
two_data <- subset(house,(Date %in% c("1/2/2007","2/2/2007")))
s_act_1 <- as.numeric(two_data$Global_active_power)
merge_time <- paste(two_data$Date,two_data$Time)
strp_time <- strptime(merge_time,"%d/%m/%Y %H:%M:%S")
sub_1 <- as.numeric(two_data$Sub_metering_1)
sub_2 <- as.numeric(two_data$Sub_metering_2)
sub_3 <- as.numeric(two_data$Sub_metering_3)
react_pw <- as.numeric(two_data$Global_reactive_power)
volt <- as.numeric(two_data$Voltage)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
## first plot for Global Active power
plot(strp_time,s_act_1,type="l",xlab="",ylab="Global Active Power")
##  second plot for Voltage
plot(strp_time,volt,type="l",xlab="datetime",ylab="Voltage")
## third plot for Energy sub metering
plot(strp_time,sub_1,type="l",col="Black",xlab="",ylab="Energy sub metering" )
lines(strp_time,sub_2,type="l",col="Red")
lines(strp_time,sub_3,type="l",col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("Black","Red","Blue"))
## fourth plot for Global reactive power
plot(strp_time,react_pw,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
