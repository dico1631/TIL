# 데이터베이스

### 1. key의 종류

- 슈퍼키 (super key) : 유일성을 만족하는 속성 또는 속성의 집합
- 후보키 (candidate key) : 유일성과 최소성을 만족하는 속성 또는 속성의 집합 
- 기본키 (primary key) : 후보키 중에서 기본적으로 사용하기 위해 선택한 키 
- 대체키 (alternate key) : 기본키로 선택되지 못한 후보키 
- 외래키 (foreign key) : 다른 릴레이션의 기본키를 참조하는 속성 또는 속성의 집합



### 2.  무결성 제약조건 (integrity constraint)

- 참조 무결성 제약조건 : foreign key는 반드시 각 row가 고유값을 가지고 있어야 하고, null이면 안됨. 따라서 primary key를 foreign key로 사용.
- 개체 무결성 제약조건 : 기본키를 구성하는 모든 속성은 NULL 값을 가질 수 없음



### 3. SQL문 - DDL

1. CREATE TABEL

   ```sql
   CREATE TABLE 테이블명 (
       속성명 데이터타입 [NOT NULL] [DEFAULT 기본값]
       [PRIMARY KEY (속성 리스트)]
       [UNIQUE (속성 리스트)]
       [CONSTRAINT 제약조건명]
       [FOREIGN KEY (속성 리스트) REFERENCES 테이블명 (속성 리스트)]
       [ON DELETE 옵션] [ON UPDATE 옵션]
   );
   ```

   - 데이터타입 : INT, VARCHAR(글자수)

- foreign key
  - [CONSTRAINT 제약조건명] : 

  - [ON DELETE 옵션] [ON UPDATE 옵션] : primary key 가 변하면 그 pk을 쓰는 foreing key들도 같이 변하게 한다.

  - 1 : 1 관계 > 어느쪽이 primary key고 어느쪽이 foreign key인지 상관 없음

  - 1: 다 관계 > 1 쪽이 primary key, 다 쪽이 foreign key

  - 다 : 다 관계 > 양쪽의 primary key를 가지고 있는 새로운 table 만듬

    

2. ALTER TABLE

   - 속성 추가

   ```sql
   ALTER TABLE 테이블명
    ADD 속성명 데이터타입 [NOT NULL] [DEFAULT 기본값];
   ```

   - 속성 변경

   ```sql
   ALTER TABLE 테이블명
    MODIFY (속성명 데이터타입);
   ```

   - 속성 삭제

   ```sql
   ALTER TABLE 테이블명
    DROP 속성명 [CASCADE | RESTRICT];
   ```

   - 외래키 추가

   ```sql
   ALTER TABLE 테이블명
   ADD
   [CONSTRAINT 제약조건명]
   FOREIGN KEY(속성명) REFERENCES 참조테이블명(참조속성명);
   ```

   - 외래키 삭제

   ```sql
   ALTER TABLE 테이블명
    DROP FOREIGN KEY 제약조건명
   ```

   - 제약조건 확인

   ```sql
   SELECT *
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   WHERE TABLE_NAME = 테이블명;
   ```



### 4. SQL문 - DML



1.  INSERT절 : 데이터 삽입

   ```SQL
   INSERT INTO 테이블명
    [(속성 리스트)]
    VALUES
    (속성의 값 리스트);
   ```

   ```sql
    -- 이름 리스트가 있으면 리스트에만 맞으면 됨. (권장)
   INSERT INTO 부서 (부서번호, 부서이름)
   	VALUES (1, '인사부');
   INSERT INTO 부서 (부서번호, 부서이름)
   	VALUES (2, '연구부');
   INSERT INTO 부서 (부서번호, 부서이름)
   	VALUES (3, '홍보부');
   	
    -- 이름 리스트가 없으면 DB에 있는 순서대로 넣어야 함.
   INSERT INTO 부서
   	VALUES (3, '홍보부');
   ```

   

2. SELECT 절: 원하는 데이터 뽑아내기

   ```SQL
   SELECT [DISTINCT] 속성 리스트
   FROM 테이블 리스트
   ```

   ```sql
   	--  1번 
   SELECT 고객아이디, 고객이름, 등급
   FROM 고객;
   
   	--  2번
   SELECT *
   FROM 고객;
   
   -- 1번과 같이 하나씩 지정하는 걸 추천.
   ```

   ```sql
   SELECT DNAME AS '부서명', LOC AS '부서위치' FROM DEPT;
   SELECT 제품명, 단가, 단가+ 500 AS 조정단가 FROM 제품;
   ```

   ```sql
   SELECT DISTINCT JOB, DEPTO FROM EMP;
   ```

3. WHERE절 : 조건

   ```sql
   SELECT [DISTINCT] 속성 리스트
   FROM 테이블 리스트
   [WHERE 조건];
   ```

   - AND / OR

   ```sql
   SELECT 주문제품, 수량, 주문일자
   FROM 주문
   WHERE 주문고객 = 'apple' AND 수량 >= 15;
   
   SELECT 주문제품, 수량, 주문일자
   FROM 주문
   WHERE 주문고객 = 'apple' OR 수량 >= 15;
   ```

   - BETWEEN

   ```sql
   SELECT 제품명, 단가, 제조업체
   FROM 제품
   WHERE 단가 BETWEEN 2000 AND 3000;
   --WHERE 단가 >= 2000 AND 단가 <= 3000;
   ```

   - LIKE

   ```sql
   SELECT 속성 리스트
   FROM 테이블
   WHERE 속성명 LIKE '검색 데이터';
   ```

   ​	* % : 0개 이상의 문자 (문자 내용과 개수 상관없이 모두 검색)

   ​	* _ : 개수 만큼의 문자 (문자 내용과 상관없이 모두 검색)

   ```sql
   -- 직업이 3글자이고 고객아이디에 a가 들어가는 고객의 정보 전부
   SELECT * FROM 고객
   WHERE 직업 LIKE '___' AND 고객아이디 LIKE '%A%'
   ```

   ```sql
   -- 보너스가 NULL이 아니고 입사일자가 1981년 2월인 사원의 모든 속성 검색
   SELECT *
   FROM EMP
   WHERE COMM IS NOT NULL AND HIREDATE LIKE '1981-02%';
   ```

   

   - NULL값 처리

   ```sql
   SELECT * FROM 고객WHERE 나이 = NULL; --NO
   SELECT * FROM 고객WHERE 나이 IS NULL;
   SELECT * FROM 고객WHERE 나이 != NULL; --NO
   SELECT * FROM 고객WHERE 나이 IS NOT NULL;
   ```



4. ORDER BY절

   ```sql
   SELECT [DISTINCT] 속성 리스트
   FROM 테이블
   [WHERE 조건]
   [ORDER BY 속성 리스트 [ASC | DESC]];
   ```

   ```sql
   --  '주문' 테이블에서 수량이 10개 이상인 주문의 주문고객, 수량, 주문일자를 검색
   -- 단, 주문제품을 기준으로 오름차순 정렬하고 주문제품이 같은 경우 
   SELECT 주문고객, 주문제품, 수량, 주문일자
   FROM 주문
   WHERE 수량 >= 10
   ORDER BY 주문제품 ASC, 수량 DESC;
   ```

   
   1. LIMIT : 한번에 보여주는 개수, paging 하는 방법

   ```sql
   -- INDEX 0부터 5개 출력
   SELECT * FROM EMP
   LIMIT 0, 5;
   ```

   ```sql
   -- 개수가 부족해도 오류가 나지 않고 그냥 해당되는 것만 출력
   SELECT * FROM EMP
   ORDER BY SAL DESC
   LIMIT 0, 5;
   ```

   ```sql
   -- 30번 부서의 근로자를 급여가 높은 순으로 정렬하고 5건 씩 출력
   SELECT * FROM EMP
   WHERE DEPTO = 30
   ORDER BY SAL DESC
   LIMIT 0, 5;
   ```

   