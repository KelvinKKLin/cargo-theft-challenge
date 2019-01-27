library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)


# Import dataset 
carthage <-  read.csv("ITM_20190121.csv")
carthage$tstamp <- as.POSIXct(strptime(carthage$CollectionTimestamp, '%Y-%M-%d %H:%M:%S'))
carthage <- carthage[,-11]
carthage <- carthage[!is.na(carthage$tstamp),]
carthage$Latitude <- as.numeric(as.character(carthage$Latitude))
carthage$Longitude <-  as.numeric(as.character(carthage$Longitude))
carthage <- carthage[!is.na(carthage$Latitude),]
carthage <- carthage[!is.na(carthage$Longitude),]

deviceIDs <- rownames(table(carthage$DeviceSerial))

# Creates data tables for Unit 1 - 11
count = 0 
for(deviceID in deviceIDs){
  count = count + 1 
  assign(
    paste("UNIT",as.character(count),sep = "_"),
    carthage[carthage$DeviceSerial == deviceID,]
          )
}


BeginTrack <- function(unit){
unit <- UNIT_1
unit <<- unit[order(unit$tstamp),]
unit_x <<- unit$Longitude
unit_y <<- unit$Latitude
#plot(unit_x,unit_y, type = "l")

time_diff <<- as.numeric(diff(unit$tstamp))

for(i in 1:length(unit_x)){
  
  lower = 1
  upper = i 
  
  plot(unit_x[lower:upper],unit_y[lower:upper], type = "l")
  
  if( time_diff[i] > 800 ){

    points(unit_x[i],unit_y[i],col = "red", pch = 20,cex = 3.5)
    Sys.sleep(0.25)
  }
  
  else{
    points(unit_x[i],unit_y[i],col = "green", pch = 20,cex = 3.5)
    Sys.sleep(0.25)
  }
}




unit <- UNIT_2
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude
#plot(unit_x,unit_y, type = "l")

time_diff <- as.numeric(diff(unit$tstamp))

for(i in 1:length(unit_x)){
  t1 = 0.08
  lower = 1
  upper = i 
  
  titleString <- paste(as.character(time_diff[i]),as.character(unit$tstamp[i]),sep = " ")
  
  plot(unit_x[lower:upper],unit_y[lower:upper], type = "l", main = titleString)
  
  if( time_diff[i] > 800 ){
    
    points(unit_x[i],unit_y[i],col = "red", pch = 20,cex = 3.5)
    Sys.sleep(t1)
  }
  
  else{
    points(unit_x[i],unit_y[i],col = "green", pch = 20,cex = 3.5)
    Sys.sleep(t1)
  }
}





