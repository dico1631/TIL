import requests
from bs4 import BeautifulSoup

url = "https://www.naver.com/"

req = requests.get(url).text
# print(req)

soup = BeautifulSoup(req, "html.parser")
# print(soup)

#select_one : 한 개만 / select : 해당 하는 것 전부
naver = soup.select("#PM_ID_ct > div.header > div.section_navbar > div.area_hotkeyword.PM_CL_realtimeKeyword_base > div.ah_roll.PM_CL_realtimeKeyword_rolling_base > div > ul > li > a > span.ah_k")
# print(naver)

for item in naver:
    print(item.text)
