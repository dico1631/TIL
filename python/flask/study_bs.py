from flask import Flask, render_template
import requests
from bs4 import BeautifulSoup

app = Flask(__name__)

@app.route("/word")
def word():
    url = "https://www.naver.com/"
    req = requests.get(url).text

    soup = BeautifulSoup(req, "html.parser")
    menu = soup.select("#PM_ID_ct > div.header > div.section_navbar > div.area_navigation > ul:nth-child(1) > li > a > span.an_txt")
    
    return render_template("word.html", menu = menu)



if __name__ == "__main__":
    app.run(debug=True)