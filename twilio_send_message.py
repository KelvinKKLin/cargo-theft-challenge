from twilio.rest import Client

account_sid = 
auth_token = 
client = Client(account_sid, auth_token)

def SendAlertMessage():
	message = client.messages.create(
		body = "This is an alert to indicate that a truck is potentially hijacked.",
		from_ = 
		to = 
	)
	return "SUCCESS"
