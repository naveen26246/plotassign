## defining the graphic device 

    png(filename = "plot2.png",width = 480, height = 480,bg="transparent")

## Subsetting the data set for the dates Feb 1-2, 2007
        completedata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
        completedata$Date <- as.Date(completedata$Date,format="%d/%m/%Y")

## Subsetting the data set for the dates Feb 1-2, 2007
        rawdata <- subset(completedata,Date=="2007-02-01" | Date =="2007-02-02")
        rawdata$Global_active_power <- as.numeric(as.character(rawdata$Global_active_power))

## Creating a new variable "time" in POSIXct format using strptime()
        rawdata$time <- apply( rawdata[ , c("Date","Time") ] , 1 , paste , collapse = "," )
        rawdata$time <- strptime(rawdata$time,"%Y-%m-%d,%H:%M:%S")

## Scatterplot with line type
        plot(rawdata$time,rawdata$Global_active_power,type="l",
             xlab="",ylab="Global Active Power (kilowatts)")

## Switching off the graphic device
dev.off()