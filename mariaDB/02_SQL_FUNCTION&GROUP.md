# 데이터 베이스

### 1. 함수

	#### 1) 숫자

- ROUND(값, 반올림 지점) : 반올림 
- TRUNCATE(값, 버림 지점) : 버림 
- MOD(값-피제수, 나눌 값-제수) : 나누기



#### 2) 문자

- UPPER(문자열) / LOWER(문자열) : 대/소문자로 변환 

- LENGTH(문자열) : 문자열 길이 

- INSTR(대상 문자열, 찾을 문자열) : 문자열 위치 

- SUBSTR(대상 문자열, 시작 위치[, 추출 개수])) :문자열 추출

-  CONCAT(문자열1, 문자열2)) : 문자열 합치기 

  다른 언어와 같이 사용시 `LIKE '%A%'` 가 작동하지 않기에 대신 사용

- LPAD(출력 문자열, 출력 자리수, 채워넣을 문자) : 자리수 맞춰 문자 채워넣기 

- RPAD(출력 문자열, 출력 자리수, 채워넣을 문자) : 자리수 맞춰 문자 채워넣기



#### 3) 날짜

- SYSDATE(), NOW() : 현재 일시, 둘이 같음 
- DATE_FORMAT(날짜, 출력형식) : 날짜 형태의 데이터를 지정하는 형식에 맞춰서 출력
