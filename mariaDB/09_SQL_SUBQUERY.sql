SELECT * FROM EMP;



SELECT 제품명, 단가
FROM 제품
WHERE 제조업체 = (	SELECT 제조업체
						 FROM 제품
						 WHERE 제품명 = '달콤비스켓');

SELECT 제품명, 제조업체
FROM 제품
WHERE 제품번호 IN (SELECT 주문제품
						 FROM 주문
						 WHERE 주문고객 = 'banana');
						 
-- 연습문제
-- 6-1) 1번
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
				 FROM EMP
				 WHERE ENAME = 'ALLEN');
				 
-- 6-1) 2번
SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
				 FROM EMP
				 WHERE DEPTO = 10);
				 
-- 6-1) 3번
SELECT *
FROM EMP
WHERE DEPTO = (SELECT DEPTO
					FROM EMP
					WHERE MGR IS NULL);
					
-- 6-1) 4번
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(SAL)
				 FROM EMP
				 WHERE DEPTO = (SELECT DEPTO
									 FROM EMP
									 WHERE COMM = 0));








