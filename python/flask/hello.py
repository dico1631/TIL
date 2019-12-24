from flask import Flask, escape, request, render_template
import random

app = Flask(__name__)

#/ 앞에는 서버의 주소인 http://127.0.0.1:5000 이 생략되어 있음.
@app.route('/')
def hello():
    name = request.args.get("name", "World")
    #외국의 경우 I'm 때 ' 때문에 문자열이 끊겨서 이를 방지하려고 [#%27 > ']로 바꿔주는 함수 excape를 쓴다.
    return f'Hello, {escape(name)}!'

@app.route('/fstring')
def fstring():
    fstring = "고민정"
    #"제 이름은 " + fstring + " 입니다." ==
    #"제 이름은 {} 입니다.".format(fstring) ==
    return f"제 이름은 {fstring} 입니다."


@app.route('/')
def hihi():
    return '<h1>반갑습니다.<h1>'

#서버의 사이트에 html을 띄우는 방법
#파이썬 변수인 name을 html로 보내는 방법, html_name은 html에서 사용할 변수명
@app.route('/hi')
def hi():
    name = "고민정"
    return render_template('hi.html', html_name = name)

@app.route('/greeting/<string:name>/')
def greeting(name):
    def_name = name
    return render_template('greeting.html', html_name = def_name)

@app.route('/math/<int:number>/')
def math(number):
    math_number = number ** 3
    return render_template('math.html', math_number = math_number, number = number)

@app.route('/dinner')
def dinner():
    menu = ['새우구이', '대게', '마라탕', '소고기', '랍스타']
    dinner = random.choice(menu)
    menu_img = {'새우구이':'http://recipe1.ezmember.co.kr/cache/recipe/2019/04/27/9343712a062a0fa8e58590400808f9011.jpg',
                '대게':'https://img2.quasarzone.co.kr/img/data/editor/1807/174b480b9e86f086377f04d68ec4e7bc_1531441937_2082.jpg', 
                '마라탕':'https://t1.daumcdn.net/cfile/tistory/9990F0395BBD84EA01', 
                '소고기':'https://t1.daumcdn.net/cfile/tistory/99AE51455C1B985108', 
                '랍스타':'https://steemitimages.com/DQmP62awCybiC46jLfNZwC1x5x1JVoGn2EoQynztsN1kKY7/20180309_211505.png'}
    img_url = menu_img[dinner]
    return render_template('dinner.html', dinner = dinner, img_url = img_url)

@app.route('/movies')
def movies():
    movies = ['조커', '겨울왕국2', '터미네이터', '어벤져스']
    return render_template("movies.html", movies = movies)


if __name__ == "__main__":
    app.run(debug=True)

