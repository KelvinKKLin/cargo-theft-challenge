
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

# Which ones are near each other 
BC_UNITS <-  list(UNIT_1, UNIT_5, UNIT_6, UNIT_7, UNIT_8)


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


unit <- UNIT_1
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(min(unit_y),max(unit_y)), 
     xlim = c(min(unit_x),max(unit_x)),
     cex = 1,
     col = "black",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Unit 1")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")



# =============================================================================================


unit <- UNIT_5
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(min(unit_y),max(unit_y)), 
     xlim = c(min(unit_x),max(unit_x)),
     cex = 1,
     col = "black",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Unit 5")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")



# =============================================================================================


unit <- UNIT_6
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(min(unit_y),max(unit_y)), 
     xlim = c(min(unit_x),max(unit_x)),
     cex = 1,
     col = "black",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Unit 6")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")




# =============================================================================================


unit <- UNIT_7
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(min(unit_y),max(unit_y)), 
     xlim = c(min(unit_x),max(unit_x)),
     cex = 1,
     col = "black",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Unit 7")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")



# =============================================================================================


unit <- UNIT_8
unit <- unit[order(unit$tstamp),]
unit_x <- unit$Longitude
unit_y <- unit$Latitude

time_diff <- as.numeric(diff(unit$tstamp))
plot(unit_x,unit_y,type = "l",
     ylim = c(min(unit_y),max(unit_y)), 
     xlim = c(min(unit_x),max(unit_x)),
     cex = 1,
     col = "black",
     xlab = "Longitude",
     ylab = "Latitude",
     main = "BC Unit 8")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")



