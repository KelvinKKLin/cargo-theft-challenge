from datetime import datetime, time
import random

# Wrapper class for the data.
class DataPoint():
	def __init__(self, date, latitude, longitude):
		self.date = date
		self.time = time
		self.latitude = latitude
		self.longitude = longitude

		
# Variables.
data_set = []
last_latitude = 0
last_longitude = 0
latitude_tolerance = [10, 10, 10, 10, 10, 10, 10]
longitude_tolerance = [10, 10, 10, 10, 10, 10, 10]
time_tolerance = [10, 10, 10, 10, 10, 10, 10]

# Load the data.	
processed_data = open("processed_data2.csv", "r")
for line in processed_data.readlines()[1:]:
	line = line.split(",")
	if "NULL" not in line:
		datetime_string = line[0]+ " " + line[1]
		data = DataPoint(datetime.strptime(datetime_string, "%Y-%m-%d %I:%M:%S %p"), float(line[2]), float(line[3]))
		data_set.append(data)
processed_data.close()