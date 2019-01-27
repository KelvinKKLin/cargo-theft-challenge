


carth <- read.csv("ITM_20190121_Up1.csv")
new_c <- carth[!is.null(carth),]

tele <- data.frame(new_c$Latitude,new_c$Longitude,new_c$ReceivedTimestamp)
tele$

new_c$Longitude <- as.numeric(as.character(new_c$Longitude))
new_c$Latitude <- as.numeric(as.character(new_c$Latitude))