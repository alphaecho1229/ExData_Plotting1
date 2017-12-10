plot4 <- function() {
  file <- "household_power_consumption.txt"
  
  col_names <- c("Date", "Time", "Global_active_power", 
                 "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")
  
  #Data for 2-day interval starts at row 66638
  data <- read.table(file, sep = ";", col.names = col_names, 
                     skip = 66637, nrows = 2880)
  
  date_time <- paste(data$Date, data$Time)
  date_time <- strptime(date_time, 
                        format = "%d/%m/%Y %H:%M:%S")
  data <- cbind(data, date_time)
  
  ## Insert graph generation here
  png("plot4.png", 480, 480)
  
  par(mfcol = c(2,2))
  
  with(data, plot(date_time, Global_active_power, type = "l", 
                  xlab = "", ylab = "Global Active Power (kilowatts)", 
                  cex.lab = 0.8))  
  with(data, plot(date_time, Sub_metering_1, 
                  type = "l", xlab = "", 
                  ylab = "Energy sub metering", 
                  cex.lab = 0.8))
  with(data, lines(date_time, Sub_metering_2, col = "red"))
  with(data, lines(date_time, Sub_metering_3, col = "blue"))
  with(data, legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                    lty = 1, col = c("black", "red", "blue"),
                    cex = 0.5))
  
  with(data, plot(date_time, Voltage, 
                  type = "l", cex.lab = 0.8))
  with(data, plot(date_time, Global_reactive_power,
                  type = "l", cex.lab = 0.8))

  
  dev.off()
}

