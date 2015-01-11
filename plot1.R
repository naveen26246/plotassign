## defining the graphic device 
 
     png(filename = "plot1.png",width = 480, height = 480,bg="transparent")

## reading the Household power consumption dataset
  
     completedata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
     completedata$Date <- as.Date(completedata$Date,format="%d/%m/%Y")

## Subsetting the data set for the dates Feb 1-2, 2007
     
      rawdata <- subset(completedata,Date=="2007-02-01" | Date =="2007-02-02")
      rawdata$Global_active_power <- as.numeric(as.character(rawdata$Global_active_power))
  
## Plotting the histogram 
     
      hist(rawdata$Global_active_power,col="red",
           main="Global Active Power",xlab="Global Active Power (kilowatts)")
  
## Switching off the graphic device  
     
      dev.off()


