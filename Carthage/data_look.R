
# Import dataset 
carthage <-  read.csv("ITM_20190121.csv")
carthage$tstamp <- as.POSIXct(strptime(carthage$CollectionTimestamp, '%Y-%M-%d %H:%M:%S'))
carthage <- carthage[,-11]
carthage <- carthage[!is.na(carthage$tstamp),]
carthage$Latitude <- as.numeric(as.character(carthage$Latitude))
carthage$Longitude <-  as.numeric(as.character(carthage$Longitude))
carthage <- carthage[!is.na(carthage$Latitude),]
carthage <- carthage[!is.na(carthage$Longitude),]

# =============================================================================================
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



# =============================================================================================
# Plots Delayed time Sequence. 
unit <- UNIT_1
unit <<- unit[order(unit$tstamp),]
unit_x <<- unit$Longitude
unit_y <<- unit$Latitude
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


# =============================================================================================
# Plots fully Time sequence 
unit <- UNIT_1
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l")
points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 1, col ="red")
points(unit_x[1],unit_y[1],pch = 20, cex = 4, col = "purple")
points(unit_x[length(unit_x)],unit_y[length(unit_x)],pch = 20, cex = 2, col = "yellow")


# =============================================================================================

# Which ones are near each other 
BC_UNITS <-  list(UNIT_1, UNIT_5, UNIT_6, UNIT_7, UNIT_8)
TORONTO_UNITS <- list(UNIT_2,UNIT_3, UNIT_4, UNIT_9, UNIT_10,UNIT_11)

# =============================================================================================

# PLOT TORONTO UNITS
# -77, -81 Long
#  45, 42

par(bg = 'grey')
unit <- UNIT_2
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(42.5,44.5), 
     xlim = c(-81,-78.75),
     cex = 1,
     col = "red",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "Toronto Truck Units")

#points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")
#points(unit_x[1],unit_y[1],pch = 20, cex = 0.5, col = "purple")
#points(unit_x[length(unit_x)],unit_y[length(unit_x)],pch = 20, cex = 0.5, col = "yellow")

count = 2
for( T_UNIT in TORONTO_UNITS){
unit <- T_UNIT[order(T_UNIT$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

  
time_diff <- as.numeric(diff(unit$tstamp))
lines(unit_x,unit_y,type = "l", col = count)
count = count + 1
}

legend("bottomleft", inset=.02, title="Truck Unit",
       c("2","3","4","9","10","11"), fill=c(1,2,3,4,5,6) + 1, horiz=TRUE, cex=0.8)

#points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 1, col ="red")
#points(unit_x[1],unit_y[1],pch = 20, cex = 2, col = "purple")
#points(unit_x[length(unit_x)],unit_y[length(unit_x)],pch = 20, cex = 2, col = "yellow")


# =============================================================================================

# PLOT BC UNITS
# -124, -121 Long
#  47.50, 49.5 Lat

unit <- UNIT_1
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(47.00,49.5), 
     xlim = c(-121,-124),
     cex = 1,
     col = "red",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Truck Units")

count = 2
for( BC_UNIT in BC_UNITS){
  unit <- BC_UNIT[order(BC_UNIT$tstamp),]
  unit_x <- unit$Longitude
  unit_y <- unit$Latitude
  
  
  time_diff <- as.numeric(diff(unit$tstamp))
  lines(unit_x,unit_y,type = "l", col = count)
  count = count + 1
}


legend("bottomright", inset=.02, title="Truck Unit",
       c("1","5","6","7","8"), fill=c(1,2,3,4,5) + 1, horiz=TRUE, cex=0.8)


# =============================================================================================

# IDENTIFIED UNIT 5 and UNIT 9 
unit <- UNIT_5
unit <- data.frame(unit$Longitude, unit$Latitude,unit$ReceivedTimestamp)
colnames(unit) <- c("Longitude","Latitude","Timestamp")
unit <- unit[order(unit$Timestamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude
#plot(unit_x,unit_y, type = "l")

time_diff <- as.numeric(diff(unit$tstamp))

for(i in 1:length(unit_x)){
  t1 = 0.06
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





# Delayed time point aside
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



