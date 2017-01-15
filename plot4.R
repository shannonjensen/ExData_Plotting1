plot4 <- function(thesource="household_power_consumption.txt") {
      #import and subset data
      df <- read.table(thesource,header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
      subdf <- subset(df,df[,"Date"]=="1/2/2007"|df[,"Date"]=="2/2/2007")
      #Function to streamline axes creation and border boxes
      drawBox <- function() {
            axis(1,at=c(1,nrow(subdf)/2,nrow(subdf)),labels = c("Thu","Fri","Sat"))
            axis(2)
            box()
      }
      #Set up canvas as 2x2
      png(filename = "plot4.png", width = 480, height = 480)
      par(mfrow=c(2,2))
      #Graph 1
      plot.ts(subdf[,"Global_active_power"],axes=FALSE,xlab=NULL,ylab='Global Active Power')
      drawBox()
      #Graph 2
      plot.ts(subdf[,"Voltage"],axes=FALSE,xlab='datetime',ylab='Voltage')
      drawBox()
      #Graph 3
      s1<-as.ts(subdf[,"Sub_metering_1"])
      s2<-as.ts(subdf[,"Sub_metering_2"])
      s3<-as.ts(subdf[,"Sub_metering_3"])
      ts.plot(s1,s2,s3,gpars=list(col=c("black","red","blue"),axes=FALSE,xlab=NULL,ylab='Energy sub metering'))
      drawBox()
      legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd = 1,bty="n")
      #Graph 4
      plot.ts(subdf[,"Global_reactive_power"],axes=FALSE,xlab='datetime',ylab='Global_reactive_power')
      drawBox()
      #Export
      dev.off()
}