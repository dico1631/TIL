from flask import Flask, render_template, request
#(모듈명) (flask 안의 메소드)
from decouple import config
import requests

app = Flask(__name__)

token = config('TELEGRAM_VOT_TOKEN')
chat_id = config('CHAT_ID')

url = 'https://api.telegram.org/bot'

@app.route('/')
def hello():
    return "Hello Mirae"

# 메세지를 작성할 곳 
@app.route('/write')
def write():
    return render_template('write.html')

# 메세지 보낼 곳 
@app.route('/send')
def send():
    # write.html에서 받아온 정보를 가져온다 
    text = request.args.get("text")
    #주소로 요청을으로 바로 실행한다. requests이용 (sendMessage 메소드를 사용)
    requests.get(f'{url}{token}/sendMessage?chat_id={chat_id}&text={text}')
    return render_template('send.html')

@app.route(f'/{token}', methods=['POST']) #setwebhook은 get방식이지만 설치한 다음부터 data는 post로 옴
def telegram():
    #텔레그램은 응답할 때 200이 될 때 까지 계속 반복하는 구조 이므로(한번의 요청에 한번의 응답을 보낼 수 있다.)
    #(실제 페이지, 서버 상태에 따라 다르게 리턴하는게 대부분)
    return "ok", 200
    #다른 외부 id가 요청했을 때 그 사람에게 보내기  
    #updates 메소드 : 다른 사람의 정보가 쌓이게 되는 메소드 이용
    # chat_id = request.get_json.[][][]



if __name__=="__main__":
   app.run(debug=True)