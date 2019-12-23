1. STS 설치 : java -jar sp[tab]

2. lombok 설치 : java -jar lombok

   

클라이언트 >>> 서버 : request

클라이언트 <<< 서버 : response



1. Controller

   request와 response 사이에서 request와 response가 잘 되도록 돕는 중간 단계

   @GetMapping (=@RequestMapping ) 필수 : 사이트 주소

   ```java
   @Controller //return만 하고 html 없으면 RestController
   public class 클래스{
   	
       @GettMapping("사이트 주소")
   	public {return_type} 함수(){
   		return "html 파일" //같은 이름의 html 파일 만들기
   	}
   
   }
   ```

   

   

2. response ( View / ViewResolver)

   서버가 보낸 응답은? html, json 등으로 response 됨

   - HTML / JSON / XML / Excel / PDF / Image / File (zip, exe 등) 

   - HTML - String / void / Map / Model / ModelAndView / DTO 

   - JSON - Map / DTO / List

   @ResponseBody 붙이면 json으로 됨



3. request

   서버로 요청할 때 정해야 하는 것은? request 방식 & request 때 같이 보낼 추가 정보 parameter

   1) request 방식 : get, post. push, delete

   2) parameter 보내고 받는 법 : requestParm, modelAttribute



4. log

   코드 실행 결과를 확인하는 방법

   syso는 출력만 되고 결과를 따로 저장하거나 남겨둘 수 없다.

   eclipse를 끄면 지워지기 때문.

   그래서 이를 파일로 보관하고 관리할 수 있게 만든 것.

   <2가지 방법>

    1. Logger

       

   	2. Lombok 이용

       

       

5. 사용한 method들

- lombok : setter, getter와 toString 등 객체 생성에 필요한 메소드를 자동으로 제공한다.
- Spring Data JPA : 데이터베이스 템플릿
- H2 Database : 데이터베이스
- Thymeleaf : sptingboots에서 권장하는 html의 Template, 뷰 템플릿
- Spring web : 
- devTools : 서버 재기동없이 수정사항 적용