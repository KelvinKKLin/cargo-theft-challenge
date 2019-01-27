from flask import Flask, render_template, request
import detection_script
import twilio_send_message
import json

app = Flask(__name__)
fobnumber = float('inf')

@app.route("/")
def home():
	return render_template("trackMap.html")

@app.route("/ishijackinprogress", methods=['GET', 'POST'])
def IsHijackInProgress():
	id = str(request.form["id"])
	latitude = float(request.form["latitude"])
	longitude = float(request.form["longitude"])
	if detection_script.IsHijackInProgress(latitude, longitude) == "DANGEROUS":
		twilio_send_message.SendDriveMessage(id, latitude, longitude)
		return "DANGEROUS"
	return "SAFE"


@app.route("/generaterandomnumber", methods=['GET','POST'])
def GenerateRandomNumber():
	global fobnumber
	fobnumber = detection_script.GenerateRandomNumber()
	return fobnumber

@app.route("/verifyfob", methods=['GET','POST'])
def VerifyFob():
	global fobnumber
	id = str(request.form["id"])
	submitnumber = int(request.form["fobnumber"])
	fobnumber = int(fobnumber)
	if not detection_script.CompareNumbers(submitnumber, fobnumber):
		twilio_send_message.SendFobMessage(id)
		return "DANGEROUS"
	return "SUCCESS"
	
@app.route("/sendphonealert", methods=['GET','POST'])
def SendPhoneAlert():
	id = str(request.form["id"])
	twilio_send_message.SendFobMessage(id)
	return "DANGEROUS"
	
@app.route("/showdangeroustrucks", methods=['GET','POST'])
def ShowDangerousTrucks():
	data = detection_script.GetDangerousData()
	return json.dumps(data)
	
if __name__ == "__main__":
	app.run(debug=True)
	
	