plot1 <- function() {
  file <- "household_power_consumption.txt"
  
  col_names <- c("Date", "Time", "Global_active_power", 
               "Global_reactive_power", "Voltage", 
               "Global_intensity", "Sub_metering_1", 
               "Sub_metering_2", "Sub_metering_3")
  
  #Data for 2-day interval starts at row 66638
  data <- read.table(file, sep = ";", col.names = col_names, 
                     skip = 66637, nrows = 2880)
  
  png("plot1.png", 480, 480)
  
  hist(data$Global_active_power, col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency", cex.axis = 0.8, cex.lab = 0.8)

  dev.off()
}



### Plot works, need to modify program to write the plot to PNG
### Check Lesson 3 videos for more on writing to file