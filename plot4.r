
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

png("plot4.png")

## Determining 'frame' for the four graphics ##
par(mfrow=c(2,2))

## first plot ##
plot(PowerConsumption$DateTime,
     PowerConsumption$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power"
       )

## second plot ##
plot(PowerConsumption$DateTime,
       PowerConsumption$Voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage"
       )

## third plot ##

plot(PowerConsumption$DateTime,
     PowerConsumption$Sub_metering_1,
     type = "l",
     xlab = " ",
     ylab = "Energy sub metering"
    )
lines(PowerConsumption$DateTime,
      PowerConsumption$Sub_metering_2,
      type = "l",
      col = "red"
     )
lines(PowerConsumption$DateTime,
      PowerConsumption$Sub_metering_3,
      type = "l",
      col = "blue"
      )
legend("topright",
        col=c("black", "red", "blue"),
        bty="n",
        lty=c(1,1,1),
        legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"))

## fourth plot ##

plot(PowerConsumption$DateTime,
     PowerConsumption$Global_reactive_power,
     type = "l",
     xlab="datetime",
     ylab="Global_reactive_power"
    )

## closing of device ##
dev.off()
