##Set working directory
setwd("C:/Users/S.Sagara/Documents/Data Science/coursera/R specialization/Explatory Analysis")

library(data.table)

fn <- file("household_power_consumption.txt")
df <- read.table(text = grep("^[1,2]/2/2007", readLines(fn), value = TRUE), col.names = c("Date", "Time", "Global_active_power", 
                                                                                          "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 sep = ";", header = TRUE, na.strings = "?")
#Plot 3
with(df,{
        plot(Sub_metering_1 ~ Datetime, type = "l",
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = "red")
        lines(Sub_metering_3 ~ Datetime, col = "blue")
})
legend("topright", col = c("black","red","blue"), lty=1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"Plot3.png",width=480, height=480)
dev.off()
