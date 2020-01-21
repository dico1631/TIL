# JOIN

- 서로 다른 테이블을 합치는 것

1. 카티션 곱( CROSS JOIN )

```sql
SELECT * 
FROM EMP, DEPT;
```

2. EQUI JOIN(primary키와 foreign key 필요)

```SQL
SELECT * 
FROM EMP, DEPT
WHERE EMP.DEPTO = DEPT.DEPTO;
```

```sql
SELECT * 
FROM EMP
JOIN DEPT
ON EMP.DEPTO = DEPT.DEPTO;
```

3. NON-EQUI JOIN

   - POINT에 따라 등급을 나누는 경우

     고객 테이블과 등급구분 테이블을 JOIN 하는데

     등급구분 테이블의 등급은 정확한 값이 아닌 범위이다.

     그래서 이 범위에 들어가는지 아닌지를 판단해서 등급값을 찍어야하므로 = 이 아닌 <>/BETWEEN을 써야한다.

     

4. SELF JOIN

   - 나의 속성1과 속성2를 비교한 정보가 필요할 때

   ```sql
   SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGR
   FROM EMP E1
   JOIN EMP E2
   ON E1.MGR = E2.EMPNO;
   ```

5. OUTER JOIN

   - 1 : 다 관계일 때 필수

   - 일반 JOIN으로는 ROW의 존재자체가 없는 경우엔 JOIN이 불가능

     EX) 학생 - 수강신청된 수업

     : 휴학해서 수강신청을 안한 학생은 이 두 테이블을 일반 JOIN할 경우 이 학생은 아예 사라져버린다. 이건 올바른 현 수강신청 행태를 보여주지 못한다. 따라서 이런  1 : 다 관계의 경우 OUTER JOIN을 한다.

   - 존재가 없는 경우엔 해당 값이 모두 NULL로 채워진다.

   ```sql
   SELECT * 
   FROM 제품
   LEFT JOIN 주문
   ON 제품.`제품번호` = 주문.`주문제품`;
   ```

   ```sql
   SELECT * 
   FROM 주문
   RIGHT JOIN 제품
   ON 제품.`제품번호` = 주문.`주문제품`;
   ```

   

# 서브쿼리

- 어느 절에든 쓸 수 있다.