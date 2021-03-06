 -- GROUP BY
 -- GROUP BY 사용시 GROUP 할 속성 또는 집계함수만 출력 가능
 SELECT 제조업체, COUNT(제조업체) AS 제조업체수 
 FROM 제품
 GROUP BY 제조업체;
 
 -- HAVING
 SELECT 등급, COUNT(*) AS 등급별고객수 , AVG(적립금) AS 적립금
 FROM 고객
 GROUP BY 등급 HAVING AVG(적립금) >= 1000
 ORDER BY AVG(적립금) DESC;
 
 -- 연습문제
 -- 4-2) 1번
 SELECT DEPTO, COUNT(*)
 FROM EMP
 GROUP BY DEPTO;
 
 -- 4-2) 2번
 SELECT JOB, COUNT(*)
 FROM EMP
 GROUP BY JOB;
 
 -- 4-2) 3번
 SELECT JOB, AVG(SAL), DEPTO
 FROM EMP
 GROUP BY JOB; 

 -- 4-2) 4번
 SELECT DEPTO, SUM(SAL)
 FROM EMP
 GROUP BY DEPTO;
 
 -- 4-2) 5번
 SELECT DEPTO, JOB, COUNT(*)
 FROM EMP
 GROUP BY DEPTO, JOB;
 
 -- 4-2) 6번
 SELECT JOB, COUNT(*)
 FROM EMP
 GROUP BY JOB
 HAVING COUNT(*) >= 3;
 
 -- 4-2) 7번
 SELECT DEPTO, COUNT(*)
 FROM EMP
 GROUP BY DEPTO
 HAVING COUNT(*) <= 4;
 
 -- 4-2) 8번
 SELECT EMPNO, MGR, JOB, COUNT(*)
 FROM EMP
 WHERE JOB = 'MANAGER' AND MGR IS NOT NULL
 GROUP BY MGR
 HAVING COUNT(*) >= 1;