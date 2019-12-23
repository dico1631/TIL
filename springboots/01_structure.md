1. STS 설치 : java -jar sp[tab]

2. lombok 설치 : java -jar lombok

   

클라이언트 >>> 서버 : request

클라이언트 <<< 서버 : response



1. Controller

   request와 response 사이에서 request와 response가 잘 되도록 돕는 중간 단계

   @GetMapping / @RequestMapping 필수

   

2. response

   서버가 보낸 응답은? html, json 등

   @ResponseBody : json

   @Controller / @RestController : html



3. request

   서버로 요청할 때 정해야 하는 것은? request 방식 & request 때 같이 보낼 추가 정보 parameter

   1) request 방식 : get, post. push, delete

   2) parameter 보내고 받는 법 : requestParm, modelAttribute