# EXERD

> DB 설계를 위한 다이어그램을 그리는 프로그램

### 설치방법

1. http://ko.exerd.com/ 에서

다운로드 > 아래로 쭉 내리면 '이클립스 플러그인으로 설치' > 주소(http://exerd.com/update/3.x/) 복사



2. 이클립스 실행 > help 메뉴 > Install New Software

3. Work with 칸에 주소(http://exerd.com/update/3.x/) 붙여넣기 + 엔터

4. Contact all update 체크 해제

5. 설치 진행 중 팝업 창의 항목 체크 후 Accept

6. New > Other > exerd 검색, exerd 항목이 나오면 성공

   

### 사용방법

![image](https://user-images.githubusercontent.com/58927491/72959131-bf57cd00-3dec-11ea-9670-f7fcd4bb3535.png)

1. 새 파일 만들기

   1) 새 Java project 만들기

   2) src에서 other > eXERD file 만들기

<img src="https://user-images.githubusercontent.com/58927491/72959535-f7abdb00-3ded-11ea-98dc-a7cc8ad4fd2d.png" alt="image" style="zoom: 150%;" />

2. 새 테이블 만들기

   1) 1번 버튼 > 논리/물리 동시편집

   2) 2번 버튼 > 새 테이블 만들기

   3) F4/F5로 논리, 물리 변경 : 논리가 제일 앞에 나와있는 상태에서 이름은 한글, 물리 상태는 영어로 table 명 쓰기.

   4) ctrl + enter로 attribute 추가

3. 각 attribute의 옵션 선택

   1) primary key

   ​	primary key로 할 attr에서 오른쪽 버튼 > pk 컬럼으로 지정

   2) foreign key

   ​	3번 버튼 클릭 > foreign key로 쓸 pk attr 클릭 > 연결할 테이블 클릭 > 연결할 테이블에 pk attr과 같은 이름의 attr이 없다면 자동으로 생성하면서 연결 / 있다면 덮어쓸지, 새로 만들지 옵션 선택창이 뜸.

### eclipse_EXERD 단축키

- table 선택 + space = table 속성창

- 관계 : 외래키 설정 변경 (cascade)
- 컬럼 : 기본키 설정 (auto increase)



## MySQL Connector/J 설치

> eXERD로 만든 DB 설계를 실제 DB로 실행하기 위해 필요한 프로그램 설치

1. https://mvnrepository.com/artifact/mysql/mysql-connector-java/5.1.48 에서  5.1.48 버전 다운

2. eclipse 파일에 넣기

3. window > preferences > exerd 검색 > 링크글씨: DBMS 연결 설정 클릭 > 새연결 > 왼쪽에서 mysql 선택 

   <설정내용>

   이름: sql, 

   파일선택: 설치한 파일 선택, 

   드라이버 클래서: com.mysql.jdbc.Driver, 

   호스트: localhost, 

   데이터베이스: 만들었던 DB 이름(mydb), 

   사용자: root, 

   비밀번호: 1234(설정했던 비번)

4. 설정 후 '연결 테스트' > 연결 성공 뜨면 성공

   

### MySQL Connector/J 사용

 1. 포워드 엔지니어링

    > eXERD에서 만든 그림을 DB로 만들기

    1) eXERD > 공통 : 이름앞에 스키마 표시 항목 비활성화 > next

    2) 테이블 > 내 스키마 에 만든 테이블들이 나옴, 이 중에 원하는 것만 선택 > next > next > 아까와 같이 내용 채워서 '연결 테스트' > 연결 성공하면 next

    

	2. 리버스 엔지니어링

    > DB를 eXERD 그림으로 만들기

    1) eXERD > 리워드 엔지니어링 > 기존에 사용하지 않은 이름 설정 > 설치때 사용한옵션들이 자동으로 써있음, 연결 테스트 > 연결 성공하면 finish

