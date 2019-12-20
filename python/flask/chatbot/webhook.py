#webhook을 이용해서 내 서버와 텔레그램 서버를 연결시킴
#텔레그램에 내용이 들어오면 나한테 보내줘
from decouple import config
import requests

token = config("TELEGRAM_BOT_TOKEN") #내 챗봇의 토큰
url = "https://api.telegram.org/bot"
ngrok_url = "https://29bcc43e.ngrok.io" #ngrok 주소

data = requests.get(f'{url}{token}/setwebhook?url={ngrok_url}/{token}').text
print(data)