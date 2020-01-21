-- ROUND(DATA, 반올림자리)
SELECT ROUNG(123.321, 1);
SELECT SAL * 0.5, ROUND(SAL * 0.5, 0) FROM EMP;

-- SUBSTR(DATA, 시작위치(1 부터), 개수)
SELECT SUBSTR(HIREDATE, 1, 10) FROM EMP;

-- CONCAT
SELECT * FROM EMP
 WHERE ENAME LIKE '%A%'; #파이썬 등 다른 언어와 같이 쓰면 작동안함
SELECT * FROM EMP
 WHERE ENAME LIKE CONCAT('%', 'A', '%');
 
-- NOW(), DATE_FORMAT()
SELECT NOW();
SELECT DATE_FORMAT(NOW(), '%Y / %M / %D / %H:%I:%S');

-- CASE()
SELECT *,
IFNULL (COMM, 0),
CASE DEPTO
	WHEN 10 THEN '총무'
	WHEN 20 THEN '운영'
	ELSE '기타' END
FROM EMP;

-- 집계함수
SELECT * FROM 제품;
SELECT MAX(재고량) AS 최대재고량  FROM 제품;
SELECT MIN(재고량) AS 최소재고량 FROM 제품;

 # 이렇게 쓰면 재고량과 상관없는 이상한 제품명이 나옴.
 # 개별 데이터와 집계함수를 같이 SELECT 하면 안됨.
SELECT MIN(재고량), 제품명  FROM 제품;

 # 이렇게 써야 원하는 값이 나옴
SELECT * 
FROM 제품
WHERE 재고량 = (SELECT MAX(재고량) # 서브쿼리
						FROM 제품);
						
SELECT COUNT(나이) FROM 고객; #나이가 NULL 인 사람은 안 세어짐
 # 1번
 #모든 속성에 관해 COUNT 함, PRIMARY KEY는 NULL이 아니어서 무조건 COUNT 됨
SELECT COUNT(*) FROM 고객; 

 # 2번
SELECT 1 FROM 고객; # *보단 1이 메모리 덜 차지
SLECET COUNT(1) FROM 고객;

-- 연습문제
-- 4-1) 1번
SELECT COUNT(*) FROM EMP;

-- 4-1) 2번
SELECT COUNT(MGR) FROM EMP;

-- 4-1) 3번
SELECT SUM(SAL) 
FROM EMP
WHERE SAL <= 2000;

-- 4-1) 4번
SELECT COUNT(*) AS 사원수, AVG(SAL) AS 급여평균
FROM EMP
WHERE JOB = 'MANAGER';

-- 4-1) 5번
SELECT MIN(SAL) AS 최소급여
FROM EMP;

-- 4-1) 6번
SELECT MAX(SAL) AS 최대급여
FROM EMP
WHERE DEPTO = 30;

-- 4-1) 7번
SELECT COUNT(DISTINCT JOB)
FROM EMP;