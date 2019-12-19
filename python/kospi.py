import requests #모듈 가져오기
from bs4 import BeautifulSoup #bs4에서 BeatifulSoup를 가져와줘

url = "https://finance.naver.com/sise/" #네이버의 주가 정보 사이트

# req = requests.get(url)
req = requests.get(url).text #사이트에서 정보 가져와서 텍스트로 바꿔줘
# print(req)

#html를 파이썬이 읽을 수 있는 형식으로 변경
#html을 파싱한다.
soup = BeautifulSoup(req, 'html.parser')
# print(soup)

#selecter를 홈페이지에서 가져옴
#soup에서 이 selecte를 가진 아이를 데리고 옴
kospi = soup.select_one('#KOSPI_now')
print(kospi.text)