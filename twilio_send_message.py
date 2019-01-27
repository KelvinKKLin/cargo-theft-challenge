from twilio.rest import Client

account_sid =
auth_token = 
client = Client(account_sid, auth_token)

def SendDriveMessage(id, lat, long):
	message = client.messages.create(
		body = "This is an alert to indicate that truck ID " + str(id) + " is potentially hijacked at latitude: " + str(lat) + " and longitude: " + str(long) + " .",
		from_ = 
		to =
	)
	return "SUCCESS"
	
def SendFobMessage(id):
	message = client.messages.create(
		body = "This is an alert to indicate that truck ID " + str(id) + " is being accessed without proper fob.",
		from_ = 
		to = 
	)
	return "SUCCESS"