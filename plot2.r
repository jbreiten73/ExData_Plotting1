
## Reading table PowerConsumption from text file ##
## household_power_consumption.txt ##

PowerConsumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

## converting the variable PowerConsumption$Date ##
## into a date variable ##

PowerConsumption$Date<-as.Date(PowerConsumption$Date,"%d/%m/%Y")

## Subsetting PowerConsumption selecting only those ##
## observations with date 2007-02-01 and 2007-02-02 ##

PowerConsumption<-subset(PowerConsumption,PowerConsumption$Date=="2007-02-01" |PowerConsumption$Date=="2007-02-02")

## 'Combining' the Date and Time variable by creating ##
## one Datetime variable ##

PowerConsumption$DateTime<-strptime(
      paste(
            PowerConsumption$Date,
            PowerConsumption$Time
           ),
   format="%Y-%m-%d %H:%M:%S"
  )

## Opening the 'png'-device ##

png("plot2.png")

## the plot command ##
plot(PowerConsumption$DateTime,
     PowerConsumption$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)"
      )
## closing of device ##
dev.off()
