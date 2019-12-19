# Flask

>파이썬을 이용해 웹 개발을 할 때 보조용으로 사용하기 위해 만들어진 클래스와 라이브러리 모음



## 1. 인터넷 창에 글자를 띄워보자

- https://www.palletsprojects.com/p/flask/

  ### 1. 설치와 hello world

  1. `pip install flask` 플라스크 설치

  2. 위 링크에 들어가기

  3. 사이트에 이 코드 복사하고 hello.py 파일 만들어서 붙여넣기

     ```python
     from flask import Flask, escape, request
     
     app = Flask(__name__)
     
     @app.route('/')
     def hello():
         name = request.args.get("name", "World")
         return f'Hello, {escape(name)}!'
     ```

  4. 사이트에 이 코드 복사하고 터미널에 붙여넣기

     gitbash 를 통해 위 코드를 실행하라는 뜻

     ```
     $ env FLASK_APP=hello.py flask run
      * Serving Flask app "hello"
      * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
     ```

  5. http 주소로 이동하면 Hello world가 뜸

     - 서버에서 나가려면 ctrl + c

  6. hello.py에 아래 코드를 추가한다.

     ```python
     if __name__ == "__main__":
         app.run(debug=True)
     ```

  7. 이번에는 터미널에 그냥 python hello.py 를 쓰면 아까와 같은 작동을 한다.

     #### 사용예제 

     ```python
     from flask import Flask, render_template
     import random
     
     app = Flask(__name__)
     
     @app.route('/hello')
     def hello():
         return "hello world"
     
     @app.route('/house')
     def house():
         time = 6
         return f"집에 가는 시간은 {time}시입니다."
         
     @app.route("/info")
     def info():
         name = "고민정"
         return render_template("info.html", name = name)
     
     @app.route("/math2/<int:num>/<int:cube>")
     def math2(num, cube):
         cube_num = num**cube
         return render_template("math2.html", num = num, cube_num = cube_num, cube = cube)
     
     @app.route("/drink")
     def drink():
         menu = ["아아", "믹스", "물", "뚱바", "카페쥬스"]
         pickdrink = random.choice(menu)
         menulist = {"아아":"https://www.mpps.co.kr/kfcs_api_img/KFCS/goods/DL_1444526_20191120095427842.png",
                     "믹스":"http://image.auction.co.kr/itemimage/17/f7/78/17f7786bc1.jpg",
                     "물":"https://image.ytn.co.kr/general/jpg/2018/0322/201803221750283662_t.jpg",
                     "뚱바":"https://pbs.twimg.com/profile_images/992443110352289792/BtqxbM4w_400x400.jpg",
                     "카페쥬스":"https://img6.yna.co.kr/mpic/YH/2018/11/08/MYH20181108004300704_P4.jpg"}
         img_drink = menulist[pickdrink]
         return render_template("drink.html", pickdrink = pickdrink, img_drink = img_drink)
     
     
     
     
     if __name__ == "__main__":
         app.run(debug=True)
     ```

     ```html
     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="X-UA-Compatible" content="ie=edge">
         <title>Document</title>
     </head>
     <body>
         <h1>나는 {{name}} 입니다.</h1>
     </body>
     </html>
     ```

     ```html
     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="X-UA-Compatible" content="ie=edge">
         <title>Document</title>
     </head>
     <body>
         {{num}}의 {{cube}}승은 {{cube_num}}입니다.
     </body>
     </html>
     ```

     ```html
     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="X-UA-Compatible" content="ie=edge">
         <title>Document</title>
     </head>
     <body>
         <h1>오늘 음료는</h1>
         <h3>{{pickdrink}}</h3>
         <img src="{{img_drink}}" alt="{{pickdrink}}">
         <h3>
             {% if pickdrink == "물": %}
             {% print("돈 쓰지 말아라!") %}
             {% endif %}
         </h3>
     </body>
     </html>
     ```

  

  - pip uninstall flask : 깔린 플라스크 지우기
  - pip install flask==1.0.0 : 구 버전 깔기

  

  

  원래 flask 실행하는 파일명은 app.py 로 정해져있음

  ```python
  from flack import Flack
  
  app = Flack(__name__)
  
  if __name__ == ('__main__'):
      app.run(debug==True)
      # debug==True 하면 개발자 모드라서 새로고침만 하면 서버 다시 껐다 키는 것 없이도 변화가 반영됨
  ```

  

  ### 2. Ping&Pong

  1. flask(python)

  ```python
  #pingpong : 정보를 주고 받는다.
  from flask import Flask, render_template, request
  app = Flask(__name__)
  
  @app.route('/ping')
  def ping():
      return render_template('ping.html')
  
  @app.route('/pong')
  def pong():
      #ping이 data 를 flask 서버로 보내면 그걸 처리해서 pong에 넘김
      #request.args.get('keyword')
      data = request.args.get('keyword')
      return render_template('pong.html', data = data)
  
  @app.route('/naver')
  def naver():
      return render_template('naver.html')
  
  @app.route('/google')
  def google():
      return render_template('google.html')
  
  
  
  
  
  if __name__ == ('__main__'):
      app.run(debug=True)
  ```

  2. Ping : 정보를 보내는 html

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Document</title>
  </head>
  <body>
      <h1>ping이다!</h1>
      <form action="/pong">
          <input type="text" name="keyword">
          <input type="submit">
      </form>
  </body>
  </html>
  ```

  3. Pong : 정보를 받는 html

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Document</title>
  </head>
  <body>
      <h1>여기는 pong입니다!</h1>
      {{data}}
  </body>
  </html>
  ```



### 3. 서버의 data 크롤링

1. flask 

```python
from flask import Flask, render_template, request
import requests
from bs4 import BeautifulSoup
app = Flask(__name__)

@app.route('/search')
def search():
    return render_template('search.html')

@app.route('/opgg')
def opgg():
    userName = request.args.get('userName')
    url = f"https://www.op.gg/summoner/userName={userName}"
    req = requests.get(url).text
    data = BeautifulSoup(req, 'html.parser')
    rank = data.select_one('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierRank').text
    win = data.select_one('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins').text
    win = win[:-1]
    return render_template('opgg.html', userName = userName, url = url, rank = rank, win = win)

if __name__ == ('__main__'):
    app.run(debug=True)
```

2. search html : 검색어를 입력하는 곳

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h3>opgg 검색</h3>
    <form action="/opgg">
        <input type="text" name="userName">
        <input type="submit" value="검색">
    </form>
</body>
</html>
```

3. opgg html : 크롤링 한 정보를 출력



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <ul>
        <li>유저 아이디 : {{userName}}</li>
        <li>랭크 : {{rank}}</li>
        <li>승수 : {{win}}</li>
    </ul>
</body>
</html>
```

