##Set working directory
setwd("C:/Users/S.Sagara/Documents/Data Science/coursera/R specialization/Explatory Analysis")

library(data.table)

fn <- file("household_power_consumption.txt")
df <- read.table(text = grep("^[1,2]/2/2007", readLines(fn), value = TRUE), col.names = c("Date", "Time", "Global_active_power", 
                                                                                          "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 sep = ";", header = TRUE, na.strings = "?")
#Plot 4
par(mfcol=c(2,2),mar = c(4,4,2,1), oma = c(0,0,1,0))
plot(df$Global_active_power ~ df$Datetime, type = "l",ylab = "Global Active Power", xlab = "")
with(df,{
        plot(Sub_metering_1 ~ Datetime, type = "l",
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = "red")
        lines(Sub_metering_3 ~ Datetime, col = "blue")
})
legend("topright", col = c("black","red","blue"), lty=1, lwd = 2, bty="n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df$Voltage ~ df$Datetime, type = "l",ylab = "Voltage", xlab = "datetime")
plot(df$Global_reactive_power ~ df$Datetime, type = "l",ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png,"Plot4.png",width=480, height=480)
dev.off()
