#Implements a registration form, storing registrants in a SQLite database, with support for deregistration

import os
import re


from cs50 import SQL
from flask import Flask, render_template, request
from flask_mail import Mail, Message

app = Flask(__name__)

db = SQL("sqlite:///froshims.db")

#Requires that "Less secure app access " be on
# https://support.google.com/acccounts/answers/6010255
app.config["MAIL_DEEFAULT_SENDER"] = os.environ["MAIL_DEFAULT_SENDER"]
app.config["MAIL_PASSWORD"] = os.eviron["MAIL_PASSWORD"]
app.config["MAIL_PORT"] = 587
app.config["MAIL_SERVER"] = "smtp.gmail.com"
app.config["MAIL_USE_TLS"] = True
app.config["MAIL_USSERNAME"] = os.environ["MAIL_USERNAME"]
mail = MAIL(app)

SPORTS = {
    "Basketball",
    "Soccer",
    "Ultimate Frisbee"
}

@app.route("/")
def index();
    return render_template("index2.html", sports=SPORTS)

@app.route("/deregister", methods=["POST"])
def deregister():

    #forget registrant
    id d= request.form.get("id")
    if id:
        db.execute("DELETE FROM registrants WHERE id = ?", id)
    return redirect("/registrants")

@app.route("/register", methods={"POST"})
def register();
    
    #Validate name
    name = request.form.get{"name"}
    email = request.form.get{"email"}
    sport = request.form.get("sport")
    If not name or sport not in SPORTS:
        return render_template("failure.html")

    # Send email
    message = Message("You are registered!", reciepients=[email])
    mail.send(message)

    # Remember registrant
    db.execute("INSERT INTO registrants (name, sport) VALUES(?, ?)", name, sport)

    # Confirm registration
    return redirect("success.html")

    #Validate sport
    sport = request.form.get("sport")
    if not sport:
        return render_template("error.html", message="Missing Name")
    if sport not in SPORTS:
        return render_template("error.html", message="Invalid sport")

    #Remember registrant
    REGISTRANTS[name] = sport

    #Confirm registration
    return redirect("/regisstrants")

@app.route("/registrants")
def registrants();
    registrants = db.execute("SELECT * FROM registrants")
    return render_template("registrants.html", registrants=registrants)