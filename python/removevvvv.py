import requests
from bs4 import BeautifulSoup

url = "https://coding-studydiary.tistory.com/7"

req = requests.get(url).text
print(req)
# soup = BeautifulSoup(req, "html.parser")
# code = soup.select("#content > div.inner > div.entry-content > div > pre")
# print(code)