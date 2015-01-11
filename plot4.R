## Defining the graphic device

        png(filename = "plot4.png",width = 480, height = 480,bg="transparent")

## Reading the completedata

        completedata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
        completedata$Date <- as.Date(completedata$Date,format="%d/%m/%Y")

## Subsetting the data set for the dates Feb 1-2, 2007

        rawdata <- subset(completedata,Date=="2007-02-01" | Date =="2007-02-02")

## Creating a new variable "time" in POSIXct format using strptime()

        rawdata$time <- apply( rawdata[ , c("Date","Time") ] , 1 , paste , collapse = "," )
        rawdata$time <- strptime(rawdata$time,"%Y-%m-%d,%H:%M:%S")

## Converting factor variables to numeric
        
        rawdata$Global_reactive_power <- as.numeric(as.character(rawdata$Global_reactive_power))      
        rawdata$Global_active_power <- as.numeric(as.character(rawdata$Global_active_power))
        rawdata$Sub_metering_1<-as.numeric(as.character(rawdata$Sub_metering_1))
        rawdata$Sub_metering_2<-as.numeric(as.character(rawdata$Sub_metering_2))
        rawdata$Sub_metering_3<-as.numeric(as.character(rawdata$Sub_metering_3))
        rawdata$Voltage <- as.numeric(as.character(rawdata$Voltage))

## Specifying the layout for graphing

                                  par(mfrow=c(2,2))

####################################   PLOT-1   ################################################

plot(rawdata$time,rawdata$Global_active_power,xlab="",ylab="Global Active Power",type="l",cex=0)

###################################    PLOT-2    ################################################

plot(rawdata$time,rawdata$Voltage,xlab="datetime",ylab="Voltage",type="l",lwd=0,cex=0)

####################################   PLOT-3   ################################################

plot(rawdata$time,rawdata$Sub_metering_1,yaxt="n",type="l",
     ylim=c(0,40),xlab="",ylab="Energy sub metering")
axis(2,at=c("0","10","20","30"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=1,col=c("grey40","red","blue"))
lines(rawdata$time,rawdata$Sub_metering_2,type="o",lwd=0.5,col="red",cex=0,ylim=c(0,35))
lines(rawdata$time,rawdata$Sub_metering_3,type="o",lwd=0.5,col="blue",cex=0,ylim=c(0,35))

####################################   PLOT-4   ################################################

plot(rawdata$time,rawdata$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="l",cex=0,lwd=0.5)

## Turning off the graphic device

dev.off()