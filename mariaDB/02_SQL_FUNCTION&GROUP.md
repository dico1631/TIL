# SQL 함수

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



### 2. 조건문 CASE

```sql
SELECT 고객아이디, 고객이름, 등급
 , CASE 등급
     WHEN 'silver' THEN '일반고객'
     WHEN 'gold' THEN '우수고객'
     WHEN 'vip' THEN '최우수고객' END
     -- 만일 그 외 나머지를 쓰려면 END 전에 ELSE 쓰면 됨.
FROM 고객;
```

```SQL
SELECT *,
IFNULL (COMM, 0),
CASE DEPTO
	WHEN 10 THEN '총무'
	WHEN 20 THEN '운영'
	ELSE '기타' END
FROM EMP;
```

