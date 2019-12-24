from flask import Flask, render_template, request
app = Flask(__name__)

@app.route("/ping2")
def ping2():
    return render_template("ping2.html")

@app.route("/pong2")
def pong2():
    data = request.args.get("keyword")
    return render_template("pong2.html", data = data)

@app.route("/naver2")
def naver2():
    return render_template("naver2.html")

if __name__ == "__main__":
    app.run(debug=True)