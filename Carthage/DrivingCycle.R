


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
# Plots Delayed time Sequence. 
unit <- UNIT_5
unit <<- unit[order(unit$tstamp),]
unit_x <<- unit$Longitude
unit_y <<- unit$Latitude
time_diff <<- as.numeric(diff(unit$tstamp))
collectWork <- c(0,0)
collectTimes <- c(0,0)
for(i in 1:length(unit_x)){
  
  lower = 1
  upper = i 
  cycles <- Drive_SE(time_diff[1:i] > 800, unit[1:i,]$tstamp)
  Time_Worked <- unit$tstamp[i] - cycles$starts[length(cycles$starts)]
  collectWork <- c(collectWork,Time_Worked)
  collectTimes <- c(collectTimes,unit$tstamp[i])
  
  #Time_Since_Last <-  cycles$starts[length(cycles$starts)] - cycles$ends[length(cycles$ends)]
  #cycles <- Drive_SE(time_diff[1:i])
  #print(cycles)
  
 #if(length(cycles$starts) != 0) {browser()}
  #print(as.numeric(TimeWorked))
  #if(as.numeric(Time_Worked) > ) 
  #plot(unit_x[lower:upper],unit_y[lower:upper], type = "l")
  
  if( time_diff[i] > 800 ){
    
  #  points(unit_x[i],unit_y[i],col = "red", pch = 20,cex = 3.5)
    #Sys.sleep(0.25)
  }
  
  #else{
    #points(unit_x[i],unit_y[i],col = "green", pch = 20,cex = 3.5)
    #Sys.sleep(0.25)
  #}
 
}

#save(collectTimes, file = "cTimes.Rdata")
#save(collectWork, file = "wTimes.Rdata")
load(file = "c")


truncTimes <- collectTimes[1:length(collectWork)]
plot(collectWork, type = "l")
# =============================================================================================


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


lower = length(length(unit_x)) - 10
upper = length(length(unit_x)) - 1
plot(y = sin((time_diff))[lower:upper] + 1, x = unit$tstamp[-length(unit_x)][lower:upper] ,type = "l")

cycles <- Drive_SE(time_diff > 800, unit$tstamp)
hist(as.numeric(cycles$ends - cycles$starts[-length(cycles$starts)]) / 60^2,breaks = 14)







