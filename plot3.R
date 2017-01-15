plot3 <- function(thesource="household_power_consumption.txt") {
      #import and subset data
      df <- read.table(thesource,header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
      subdf <- subset(df,df[,"Date"]=="1/2/2007"|df[,"Date"]=="2/2/2007")
      #create time series objects
      s1<-as.ts(subdf[,"Sub_metering_1"])
      s2<-as.ts(subdf[,"Sub_metering_2"])
      s3<-as.ts(subdf[,"Sub_metering_3"])
      #Draw Plot
      ts.plot(s1,s2,s3,gpars=list(col=c("black","red","blue"),axes=FALSE,xlab=NULL,ylab='Energy sub metering'))
      axis(1,at=c(1,nrow(subdf)/2,nrow(subdf)),labels = c("Thu","Fri","Sat"))
      axis(2)
      box()
      legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd = 1)
      #Export
      dev.copy(png,'plot3.png')
      dev.off()
}