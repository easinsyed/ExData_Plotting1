#first we read  the entire dataset and store it in pwdata, we are using sep=";" as data is seperated by ;
pwdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE)
#the data is cleaned a little by converting date character to date object
pwdata$Date <- as.Date(pwdata$Date, "%d/%m/20%y")
#the data is subsetted to the just the days we want to analyse
epwdata <- subset(pwdata, (pwdata$Date >= as.Date("2007-02-01")) &(pwdata$Date <= as.Date("2007-02-02")))
#date and time is joined together in the Time column so the entire column can be converted into a timestamp
epwdata$Time <- paste (epwdata$Date, epwdata$Time, sep = " ")
#conversion of the Time column to a date time object 
epwdata$Time <- strptime(epwdata$Time, "%Y-%m-%d %H:%M:%S")
#defining multiple plots and the png output
png(filename = "./Plot4.png", width=960, height=960)
par (mfrow= c(2,2))
par (mar= c(4,4,1,1))
#change the font size of the axis label
par (cex.lab = 1.5)
#plot function is used to create the grid, pch= " " is used as we want to generate line grapth without points in the next step
plot(epwdata$Time, epwdata$Global_active_power, pch=" ",ylab="Global active power")
#generating line graph for Global_active_power
lines(epwdata$Time, epwdata$Global_active_power)
#plot function is used to create the grid, pch= " " is used as we want to generate line grapth without points in the next step
plot(epwdata$Time, epwdata$Voltage, pch=" ", ylab="Voltage", xlab = "datetime")
#generating line graph for voltage
lines(epwdata$Time, epwdata$Voltage)
#plot function is used to create the grid, pch= " " is used as we want to generate line grapth without points in the next step
plot(epwdata$Time, epwdata$Sub_metering_1, pch=" ",ylab="Energy sub metering")
#generating line graph for Sub_metering_1 for above plot
lines(epwdata$Time, epwdata$Sub_metering_1, col= "black")
#generating line graph for Sub_metering_2 for above plot
lines(epwdata$Time, epwdata$Sub_metering_2, col= "red")
#generating line graph for Sub_metering_3 for above plot
lines(epwdata$Time, epwdata$Sub_metering_3, col= "blue")
#adding the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill=c("blue","red", "green"))
#plot function is used to create the grid, pch= " " is used as we want to generate line grapth without points in the next step
plot(epwdata$Time, epwdata$Global_reactive_power, pch=" ",ylab="Global reactive power", xlab= "datetime")
#generating line graph for Global_active_power
lines(epwdata$Time, epwdata$Global_reactive_power)
#housekeeping
dev.off()