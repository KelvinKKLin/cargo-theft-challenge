
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


TORONTO_UNITS <- list(UNIT_2,UNIT_3, UNIT_4, UNIT_9, UNIT_10,UNIT_11)


# =============================================================================================

# TORONTO UNIT 2

unit <- UNIT_2
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
     main = "Toronto Unit 2")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")

# =============================================================================================

# TORONTO UNIT 3


unit <- UNIT_3
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
     main = "Toronto Unit 3")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")


# =============================================================================================

unit <- UNIT_4
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
     main = "Toronto Unit 4")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")

# =============================================================================================

unit <- UNIT_9
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
     main = "Toronto Unit 9")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")


# =============================================================================================

unit <- UNIT_10
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
     main = "Toronto Unit 10")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")


# =============================================================================================

unit <- UNIT_11
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
     main = "Toronto Unit 11")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")


