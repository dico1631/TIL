from datetime import datetime

now = datetime.now()
lefthour = 18 - now.hour
leftmin = 60 - now.minute
leftsec = 60 - now.second
print(f"{lefthour}시 {leftmin}분 {leftsec}초 남았습니다.")