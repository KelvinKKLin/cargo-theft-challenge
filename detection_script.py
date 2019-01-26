from datetime import datetime, time
import random

# Wrapper class for the data.
class DataPoint():
	def __init__(self, date, latitude, longitude):
		self.date = date
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
processed_data = open("processed_data.csv", "r")
for line in processed_data.readlines()[1:]:
	line = line.split(",")
	if("NULL" not in line):
		data = DataPoint(datetime.strptime(line[0], "%M:%S.%f").time(), float(line[1]), float(line[2]))
		data_set.append(data)
processed_data.close()

# Generaate the random number.
def generateRandomNumber():
	return random.randint(100000000000, 9999999999999)

# Check if 2 numbers are the same.
def checkNumber(num1, num2):
	return num1 == num2