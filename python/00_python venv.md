### 연산자 

- % : 나머지

- / : 나누기

- // : 몫

- ** : 제곱

# python 가상환경

> 어디서든 내 python 모듈들을 사용할 수 있도록 가상환경을 만들어서 거기에서 코딩을 한다.



## python 가상환경 모듈 설치

- `pip list` : 관리모듈 확인

- `python -m [venv : 가상환경 모듈명] [venv : 가상환경 모듈명]`

   : venv는 가상환경의 이름, 관례적으로 이렇게 사용

- `source venv/scripts/activate` : (윈도우) 가상환경 활성화 

  ```shell
  (venv)
  student@M15035 MINGW64 ~/TIL/python (master)
  ```

  - (venv) 이 생김

- `source venv/bin/activate` : (맥) 가상환경 활성화

  - (venv) 이 사라짐

- `deactivate` : 가상환경 끄기

- 잘못 관리모듈을 만들었을 때는 `deactivate` 후에 `rm -rf venv/`해서 venv 폴더 삭제

- 본인 컴퓨터가 아니면 홈 dir이 아니라 폴더를 하나 만들어서 모듈 설치.



## pip

매번 모듈들을 새로 깔기는 귀찮으니까 이걸 한 번에 관리해주는 `pip`를 사용한다.

- `pip freeze > requirements.txt ` : 설치한 모듈들의 내용을 담아둘 txt 장소 만들기
- `pip install -r requirements.txt`  : 모듈을 설치할 때 사용, requirements.txt 를 읽어서( -r )  설치해라.



## pip에 사용할 모듈 설치

- `pip install requests` : requests 라는 모듈 설치

  requests는 url에서 정보를 가져오는 모듈

- `pip install beautifulsoup4` : BeautifulSoup의 버전 4를 설치

  BeautifulSoup는 가져온 정보를 파이썬이 읽을 수 있는 정보로 변환해주는 모듈



#### 사용예제 1

```python
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
```



#### 사용예제 2

```python
import requests
from bs4 import BeautifulSoup

url = "https://finance.naver.com/marketindex/"

req = requests.get(url).text
# print(req)

soup = BeautifulSoup(req, "html.parser")

exchange = soup.select_one('#exchangeList > li.on > a.head.usd > div > span.value')
print(exchange.text)
```



#### 사용예제 3

```python
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
```

