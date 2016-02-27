
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

png("plot3.png")

## First step: Plotting DateTime vs Sub_metering_1 (black lines) ##

plot(PowerConsumption$DateTime,
     PowerConsumption$Sub_metering_1,
     type = "l",
     xlab = " ",
     ylab = "Energy sub metering"
     )

## Second step : Adding DateTime vs Sub_metering_2 (red lines) ##

lines(PowerConsumption$DateTime,
      PowerConsumption$Sub_metering_2,
      type = "l",
      col = "red"
      )

## Third step : Adding DateTime vs Sub_metering_3 (blue lines) ##

lines(PowerConsumption$DateTime,
      PowerConsumption$Sub_metering_3,
      type = "l",
      col = "blue"
)

## Adding legend: ##

legend("topright",
        lty=c(1,1,1),
        col=c("black", "red", "blue"),
        legend=c("Metering 1" , "Metering 2", "Metering 3"))

## Closing device ##
dev.off()
