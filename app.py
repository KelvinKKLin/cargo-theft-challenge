from flask import Flask, render_template, request
import detection_script
import twilio_send_message

app = Flask(__name__)

@app.route("/")
def home():
	return render_template("trackMap.html")

@app.route("/ishijackinprogress", methods=['GET', 'POST'])
def IsHijackInProgress():
	latitude = float(request.form["latitude"])
	longitude = float(request.form["longitude"])
	return detection_script.IsHijackInProgress(latitude, longitude)

@app.route("/sendphonealert", methods=['GET','POST'])
def SendPhoneAlert():
	twilio_send_message.SendAlertMessage()

if __name__ == "__main__":
	app.run(debug=True)