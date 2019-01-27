from twilio.rest import Client

account_sid = 'AC88993972ed26ee52f5b10c76c2d117c2'
auth_token = '3af60e10d33c439cc52cc9608bc4e7ea'
client = Client(account_sid, auth_token)

def SendDriveMessage(id, lat, long):
	message = client.messages.create(
		body = "This is an alert to indicate that truck ID " + str(id) + " is potentially hijacked at latitude: " + str(lat) + " and longitude: " + str(long) + " .",
		from_ = "16475608688",
		to = "6479816914"	
	)
	return "SUCCESS"
	
def SendFobMessage(id):
	message = client.messages.create(
		body = "This is an alert to indicate that truck ID " + str(id) + " is being accessed without proper fob.",
		from_ = "16475608688",
		to = "6479816914"
	)
	return "SUCCESS"