import requests

headers = {
    "Host": "dapi.kakao.com"
    "Authorization": "KakaoAK 6530bafd222eaff315c35e50bf8cfbd8"
}

address = input("주소를 입력하세요.")
getAddress = requests.get(f"https://dapi.kakao.com/v2/local/search/address.json?query={address}", headers = headers).text
print(getAddress)