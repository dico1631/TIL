from decouple import config
import requests
# APIKEY = config("APIKEY")
headers = {
    "Host": "kapi.kakao.com",
    "Authorization": "KakaoAK 6530bafd222eaff315c35e50bf8cfbd8" 
}

sentence = input("번역할 문장을 넣어주세요: ")
tlanslate_text = requests.get(f"https://kapi.kakao.com/v1/translation/translate?src_lang=kr&target_lang=en&query={sentence}", headers = headers)
# return_text = tlanslate_text.json()["translated_text"][0][0]
# print(return_text)
print(type(tlanslate_text))