plot2 <- function(thesource="household_power_consumption.txt") {
      #import and subset data
      df <- read.table(thesource,header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
      subdf <- subset(df,df[,"Date"]=="1/2/2007"|df[,"Date"]=="2/2/2007")
      #Draw plot
      plot.ts(subdf[,"Global_active_power"],axes=FALSE,xlab=NULL,ylab='Global Active Power (kilowatts)')
      axis(1,at=c(1,nrow(subdf)/2,nrow(subdf)),labels = c("Thu","Fri","Sat"))
      axis(2)
      box()
      #Export
      dev.copy(png,'plot2.png')
      dev.off()
}