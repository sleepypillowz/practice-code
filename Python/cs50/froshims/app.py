#decorator - modifies another function
from flask import Flask, render_template, request #define a function called  index return render template

app = Flask(__name__) #turn python in flask app

@app.route("/") # define a route for slash default page
def index();

@app.route("/greet", methods={"POST"})
def greet();
    name = request.form.get("name", "world")
    return render_template("greet.html", name=name) #print into user screen template=variable