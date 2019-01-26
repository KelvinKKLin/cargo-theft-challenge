from datetime import datetime
import random

# Wrapper class for the data.
class DataPoint():
	def __init__(self, date, latitude, longitude):
		self.date = date
		self.latitude = latitude
		self.longitude = longitude

		
# Variables.
data_set = []
latitude_tolerance = [10, 10, 10, 10, 10, 10, 10]
longitude_tolerance = [10, 10, 10, 10, 10, 10, 10]

# Load the data.	
processed_data = open("processed_data.csv", "r")
for line in processed_data.readlines()[1:]:
	line = line.split(",")
	if "NULL" not in line:
		datetime_string = line[0]+ " " + line[1]
		data = DataPoint(datetime.strptime(datetime_string, "%Y-%m-%d %I:%M:%S %p"), float(line[2]), float(line[3]))
		data_set.append(data)
processed_data.close()

def IsHijackInProgress(latitude, longitude):
	# Get the current date and day of the week.
	current_date = datetime.today()
	current_weekday = 3 #current_date.weekday()
	
	# Get parameters based on day of the week.
	lat_tol = latitude_tolerance[current_weekday]
	long_tol = longitude_tolerance[current_weekday]
		
	# Get all datapoints captured on the same date.
	for datapoint in data_set:
		if datapoint.date.weekday() == current_weekday:
			# Calcualte tolerance ranges.
			latitude_high = datapoint.latitude + lat_tol
			latitude_low = datapoint.latitude - lat_tol
			longitude_high = datapoint.longitude + long_tol
			longitude_low = datapoint.longitude - long_tol
			
			print(latitude, longitude)
			print(latitude_high, latitude_low)
			print(longitude_high, longitude_low)
			
			# Determine if current coordinates are within range.
			if (latitude < latitude_high) and (latitude > latitude_low) and (longitude < longitude_high) and (longitude > longitude_low):
				return False
	
	# Return if hijack is in progress
	return True