


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
     main = "Toronto Unit 2")

points(unit_x[time_diff > 800],unit_y[time_diff > 800], pch = 20, cex = 0.5, col ="red")



# Calculate driving start and end points 

Drive_SE <- function(x,dts ){

  starts <- c()
  ends <- c() 
  for(i in 1:length(x)) {
    if (i+4 == length(x)){
      break
    } 
    lower = i-4
    middle = i
    upper = i+4
    if(i >= 5){
     if(sum(x[lower:i]) == 4 & x[i+4] == FALSE){
       starts <- append(starts,dts[i])
     } 
     if(sum(x[i:upper]) == 4 & x[i-4] == FALSE){
       ends <- append(ends,dts[i])
     }
  
     }
  }
  list(starts = starts, ends = ends)
}


plot(y = sin((time_diff))[1:2000] + 1, x = unit$tstamp[-length(unit_x)][1:2000] ,type = "l")



cycles <- Drive_SE(time_diff > 800, unit$tstamp)
plot(as.numeric(cycles$ends - cycles$starts[-length(cycles$starts)]) / 60^2)

