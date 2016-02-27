
## Reading table PowerConsumption from text file ##
## household_power_consumption.txt ##

PowerConsumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

## converting the variable PowerConsumption$Date ##
## into a date variable ##

PowerConsumption$Date<-as.Date(PowerConsumption$Date,"%d/%m/%Y")

## Subsetting PowerConsumption selecting only those ##
## observations with date 2007-02-01 and 2007-02-02 ##

PowerConsumption<-subset(PowerConsumption,PowerConsumption$Date=="2007-02-01" |PowerConsumption$Date=="2007-02-02")

## Plotting a histogram ##
## Opening the 'png'-device ##

png("plot1.png")

## Generating the histogram ##
hist(PowerConsumption$Global_active_power,
     col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
        )
## Closing of device ##
 dev.off()
