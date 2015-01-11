## Defining the graphic device

      png(filename = "plot3.png",width = 480, height = 480,bg="transparent")

## Reading the completedata
      
      completedata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
      completedata$Date <- as.Date(completedata$Date,format="%d/%m/%Y")
     
## Subsetting the data set for the dates Feb 1-2, 2007
      
      rawdata <- subset(completedata,Date=="2007-02-01" | Date =="2007-02-02")
      rawdata$Global_active_power <- as.numeric(as.character(rawdata$Global_active_power))
      
## Creating a new variable "time" in POSIXct format using strptime()
      
      rawdata$time <- apply( rawdata[ , c("Date","Time") ] , 1 , paste , collapse = "," )
      rawdata$time <- strptime(rawdata$time,"%Y-%m-%d,%H:%M:%S")

## Converting factor variables to numeric
      
      rawdata$Sub_metering_1<-as.numeric(as.character(rawdata$Sub_metering_1))
      rawdata$Sub_metering_2<-as.numeric(as.character(rawdata$Sub_metering_2))
      rawdata$Sub_metering_3<-as.numeric(as.character(rawdata$Sub_metering_3))

## Plotting the scatter plot as required
      
      ## Step1: Plot scatter plot of 1st variable in gray with custom axis
      
              plot(rawdata$time,rawdata$Sub_metering_1,yaxt="n",type="l",col="gray40",
                    ylim=c(0,40),xlab="",ylab="Energy sub metering")
              axis(2,at=c("0","10","20","30"))
     
      ## Step2: Plot the next two variables as lines overlapping the plot
      
                lines(rawdata$time,rawdata$Sub_metering_2,type="o",
                      lwd=0.5,col="red",cex=0,ylim=c(0,35))
                lines(rawdata$time,rawdata$Sub_metering_3,type="o",
                      lwd=0.5,col="blue",cex=0,ylim=c(0,35))
      
      ## Step3: Add the corresponding Legeng
      
               legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                     ,lty=1,col=c("grey40","red","blue"))

## Turning off the graphic device
      
      dev.off()