plot1 <- function(thesource="household_power_consumption.txt") {
      #import and subset data
      df <- read.table(thesource,header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
      subdf <- subset(df,df[,"Date"]=="1/2/2007"|df[,"Date"]=="2/2/2007")
      #Draw plot
      hist(subdf[,"Global_active_power"],xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
      #Export plot
      dev.copy(png,'plot1.png')
      dev.off()
}