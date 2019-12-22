import requests, json

headers = {
    "Host": "dapi.kakao.com",
    "Authorization": "KakaoAK 6530bafd222eaff315c35e50bf8cfbd8"
}

address = input("주소를 입력하세요.")
req = requests.get(f"https://dapi.kakao.com/v2/local/search/address.json?query={address}", headers = headers).text
req = json.loads(req)
getAddress = req["documents"][0]["road_address"]
roadAddress = getAddress["address_name"]
print(f"도로명 주소 : {roadAddress}")