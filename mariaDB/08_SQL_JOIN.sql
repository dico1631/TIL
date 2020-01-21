--join
SELECT *
FROM 사원, 부서
WHERE 사원.`소속부서` = 부서.`부서번호`;

SELECT * 
FROM EMP, DEPT
WHERE EMP.DEPTO = DEPT.DEPTO;

SELECT * 
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO;

SELECT *
FROM 주문
JOIN 제품
ON 주문.`주문제품` = 제품.`제품번호`
WHERE 주문.`주문고객` = 'banana';

SELECT 주문.주문일자
FROM 고객
JOIN 주문
ON 고객.`고객아이디` = 주문.`주문고객`
WHERE 고객.`나이` >= 30;

SELECT P.`제품명`
FROM 고객 C
JOIN 주문 O
ON C.`고객아이디` = O.`주문고객`
JOIN 제품 P
ON O.`주문제품` = P.`제품번호`
WHERE C.`고객이름` = '고명석';

SELECT P.`제품명`, O.`수량`, O.`주문일자`
FROM 주문 O
JOIN 고객 C
ON O.`주문고객` = C.`고객아이디`
JOIN 제품 P
ON P.`제품번호` = O.`주문제품`
WHERE O.`배송지` = '서울시 마포구';


-- 문제풀이
-- 5-1) 1번
SELECT EMP.ENAME, EMP.DEPTO, DEPT.DNAME
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO;

-- 5-1) 2번
SELECT *
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO;

-- 5-1) 3번
SELECT EMP.COMM, EMP.SAL, DEPT.LOC
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO
WHERE EMP.COMM IS NOT NULL;


-- 5-1) 4번
SELECT DNAME, SUM(EMP.SAL)
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO
WHERE DEPT.LOC = 'NEW YORK' OR DEPT.LOC = 'DALLAS'
GROUP BY EMP.DEPTO;

-- SELF JOIN
SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGR
FROM EMP E1
JOIN EMP E2
ON E1.MGR = E2.EMPNO;

-- OUTER JOIN
SELECT * FROM 제품;
SELECT * FROM 주문;

SELECT * 
FROM 제품
JOIN 주문
ON 제품.`제품번호` = 주문.`주문제품`;   # 주문 내역이 없는 제품은 나오지 않음

SELECT * 
FROM 제품
LEFT JOIN 주문
ON 제품.`제품번호` = 주문.`주문제품`;   # 주문 내역이 없는 제품도 NULL로 채워져서 나옴

#위랑 같은 것
SELECT * 
FROM 주문
RIGHT JOIN 제품
ON 제품.`제품번호` = 주문.`주문제품`;