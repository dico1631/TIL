# 단축키

- shift + ctrl + o : 한 번에 import



# spring boots 설치

https://spring.io/tools > download

다운받은 폴더  > 파일 > window powershell > java -jar sprint + tab

안되면 자바가 설치된 위치(ojdkbuild)\java 하기



lombok : 자동으로 setter, getter 만들어 주는 함수

[1.18.10 [Current Version\]](https://projectlombok.org/downloads/lombok.jar) 다운

sptingboots.exe 파일 선택 > install



필요할 때 어디선가 찾아서 필요한 것을 가져와 설치해주는 방법 : python pip, java gradle or meven

- 매 실행시 이전 실행한 것을 종료하고 실행해야함. 안그러면 저장했어도 변경사항이 적용이 안됨





# <요청한 자료를 받는 방법>



# Controller

### 방법 1.

```java
package com.dico1631.basic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


//직접 return에 나타날 html을 쓴다.
@RestController  //필수
public class TestController {
	@GetMapping("/test") //@~ = Annotation : 컴퓨터가 보기 위한 주석, 함수 위에 써야함, 필수
	public String test() {
		//여기에 html 써도 되지만, 보기 힘드니까 Html 파일을 따로 만들고 그걸 불러옴
		return "<h1>Hello</h1>";
	}
}
```

### 방법 2.

```java
package com.dico1631.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//controller : 클라이언트가 서버에 요청한 내용을 정리해서 클라이언트에게 알려주는 중간 단계
//html 파일을 따로 만들고 불러와서 return 한다.
@Controller
public class Test2Controller {
	@GetMapping("/test2")
	public String test2() {
		//html 파일 return
		return "hello";
	}
}
```

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>헬로우!</h1>
</body>
</html>
```



- 인터넷에 `localhost:8080/GetMapping에 쓴 것 ("/test")` 으로 실행

- 한글 깨지는 것 해결 : window > preferences > 'encoding' 검색 > 전부 'utf-8' 로 변경



# **log

> syso는 출력만 되고, 끄면 날라감. 그럼 그 결과로 아무 일도 못해서 이 내용을 파일에 저장하려고 사용. 시간에 따라 log를 파일로 저장함. 
>
> 1. syso보다 출력 속도가 빠름
> 2. 파일 등을 이용하여 관리가 용이함



### 1. 직접 찾기

```java
package com.dico1631.basic.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

//shift + ctrl + f : 자동정렬
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	//syso는 출력만 되고, 끄면 날라감. 그럼 그 결과로 아무 일도 못해서 이 내용을 파일에 저장하려고 사용
	//시간에 따라 log를 파일로 저장함. syso보다 빠름
	Logger logger = LoggerFactory.getLogger(this.getClass()); //org.slf4j 쓰기, 공식
	
	@RequestMapping("/")
	public String home() {
		//info부터 나오는게 default값이라 trace와 debug도 보고싶으면 application.properties에 
		//# log level
		//logging.level.com.dico1631.basic=trace 를 입력
		logger.trace("trace!");		
		logger.debug("debug!");	//개발단계 에서 확인용, 마음대로 써도 됨	
		logger.info("info!");	//운용 상 필요한 정보, 사용자에게 꼭 필요한 내용만
		logger.warn("warn!");	//메모리 문제 등 경고, 문제가 생길 것 같을 때
		logger.error("error!");	//동작이 멈췄을 때 문제를 출력
		
		return "home";
	}
}
```

<application.properties>

```
# log level
logging.level.com.dico1631.basic=trace
```

- 코드 실행만 한다고 로그가 나오는 게 아님. 코드 실행하면 누군가 불렀을 때 작동 될 준비를 하고 기다리고 있는 것. 코드 실행 후 인터넷으로 불러야만 그제야 작동
-  http://logback.qos.ch/manual/ : 로그에 대한 설명, ch 6까지만 보면 됨

### 2. Lombok

```java
package com.dico1631.basic.controller;
//shift + ctrl + f : 자동정렬
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class HomeController {
	//syso는 출력만 되고, 끄면 날라감. 그럼 그 결과로 아무 일도 못해서 이 내용을 파일에 저장하려고 사용
	//시간에 따라 log를 파일로 저장함. syso보다 빠름
	//Logger log = LoggerFactory.getLogger(this.getClass()); //org.slf4j 쓰기, 공식
	//>lombok 안 쓰면 이거 쓰고 log 대신 logger, lombok 쓰면 이거 안 쓰고 log로 만들기
	@RequestMapping("/")
	public String home() {
		//info부터 나오는게 default값이라 trace와 debug도 보고싶으면 application.properties에 
		//# log level
		//logging.level.com.dico1631.basic=trace 를 입력
		log.trace("trace!");		
		log.debug("debug!");	//개발단계 에서 확인용, 마음대로 써도 됨	
		log.info("info!");	//운용 상 필요한 정보, 사용자에게 꼭 필요한 내용만
		log.warn("warn!");	//메모리 문제 등 경고, 문제가 생길 것 같을 때
		log.error("error!");	//동작이 멈췄을 때 문제를 출력
		
		return "home";
	}
}
```



#### <저장하면 이전 것을 끄지 않아도 자동 반영되게 하는 함수>

1. build.gradle 파일의 `dependencies {}` 안에`implementation "org.springframework.boot:spring-boot-devtools"` 복붙

2. 마우스 오른쪽 > gradle > gradle refresh~
3. java 파일 실행 후 변경한 다음 저장하면 자동으로 반영됨



## response

> 클라이언트의 요청에 대한 응답의 종류
>
> puclic {response} 함수명(){
>
> ​	return {response 타입의 결과}
>
> }

##### 1. 종류

-  HTML / JSON / XML / Excel / PDF / Image / File (zip, exe 등)



##### 2. 각 종류 살펴보기

1. HTML - "String" / void / Map / Model / ModelAndView / DTO (주로 String을 사용)

   - html 응답
     1. src/main/resources/templates 에 html 패키지 생성
     2. html 패키지 안에 각 html 파일 만들기

   ```java
   //String은 return이 있지만 다른 것은 없다.
   //없는 경우에는 @GetMapping("html/map")의 " " 안에 이름에 따라 해당하는 파일을 연다.
   
   package com.dico1631.basic.controller;
   
   import java.util.HashMap;
   import java.util.Map;
   import org.springframework.stereotype.Controller;
   import org.springframework.ui.Model;
   import org.springframework.web.bind.annotation.GetMapping;
   import org.springframework.web.servlet.ModelAndView;
   import com.dico1631.basic.model.Member;
   
   @Controller
   public class HtmlController {
   	@GetMapping("html/string")
   	public String html() {
   		return "html/string";
   	}
   
   	@GetMapping("html/void")
   	public void htmlVoid() {
   	}
   
   	@GetMapping("html/map")
   	public Map<String, Object> htmlMap(Map<String, Object> map) {
   		Map<String, Object> map2 = new HashMap<String, Object>();
   		return map2;
   	}
   
   	@GetMapping("html/model")
   	public Model htmlModel(Model model) {
   		return model;
   	}
   
   	@GetMapping("html/model_and_view")
   	public ModelAndView htmlModel() {
   		ModelAndView mav = new ModelAndView();
   		mav.setViewName("html/model_and_view");
   		return mav;
   	}
   
   	@GetMapping("html/object")
   	public Member htmlObject() {
   		Member member = new Member();
   		member.setName("kim");
   		return member;
   	}
   }
   ```

   <html.object>

   ```html
   <!DOCTYPE html>
   <html xmlns:th="http://www.thymeleaf.org">
   <head>
   </head>
   <body>
       //내용이 없는 틀만 만들어 둠
   	<h1>HTML object</h1>
   	[[${member}]]
   	<hr>
   	[[${member.name}]]
   </body>
   </html>
   ```

   <menber 객체>

   ```java
   package com.dico1631.basic.model;
   
   public class Member {
   	private String name;
   	private String userId;
   	private String userPassword;
   	public String getName() {
   		return name;
   	}
   	//Lombok을 쓰면 아래 getter,setter은 안 써도 됨
   	public void setName(String name) {
   		this.name = name;
   	}
   	public String getUserId() {
   		return userId;
   	}
   	public void setUserId(String userId) {
   		this.userId = userId;
   	}
   	public String getUserPassword() {
   		return userPassword;
   	}
   	public void setUserPassword(String userPassword) {
   		this.userPassword = userPassword;
   	}
       @Override
   	public String toString() {
   		return "Member [name=" + name + ", userId=" + userId + ", userPassword=" + 		userPassword + "]";
   	}
   }
   
   ```

   ```java
   //lombok 사용코드
   package com.dico1631.basic.model;
   
   import lombok.Data;
   
   @Data
   public class Member {
   	private String name;
   	private String userId;
   	private String userPassword;
   	public String getName() {
   		return name;
   	}
   	@Override
   	public String toString() {
   		return "Member [name=" + name + ", userId=" + userId + ", userPassword=" + userPassword + "]";
   	}
   }
   ```

   

2.  JSON - Map / DTO / List

   - json은 정보전달을 할 경우에만 사용 가능함

     ​	string : 정보 전달이 아니라 파일 열기라서 json 안됨

     ​	void : 정보 전달하는 return이 없어서 json이 안됨

```java
package com.dico1631.basic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dico1631.basic.model.Member;

@Controller
public class JsonController {
    //출력하면 json으로 안 나옴. string으로 나옴
	@GetMapping("json/string")
	@ResponseBody
	public String json() {
		return "json/string";
	}
    
    //객체를 저장할 수 있는 아래 사례들과 같은 경우에 json 사용 가능
	@GetMapping("json/map")
	@ResponseBody
	public Map<String, Object> jsonMap(Map<String, Object> map) {
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("key1", "value");
		map2.put("key2", 2324);
		map2.put("key3", true);
		return map2;
	}

	@GetMapping("json/object")
	@ResponseBody
	public Member jsonObject() {
		Member member = new Member();
		member.setName("kim");
		return member;
	}

	@GetMapping("json/list")
	@ResponseBody
	public List<String> jsonList() {
		List<String> list = new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("3");
		return list;
	}
}
```



- CSS를 써서 디자인까지 해야하는 경우 : getMapping만 해서 html 파일 따로 만듬
- 정보를 주고 받기만 하면 되는 경우 : responseBody 써서 json 정보를 받음. > APT Server



# <요청을 처리할 때>



# http method - rest방식

- post / get / put / method
- 이걸 연습하려면 restlet client 라는 크롬 확장프로그램이 필요
- json formatter : json을 잘 보이게 만들어주는 크롬 확장프로그램

- 오류 메세지 > 200,404,500은 알고있기!
  1. Success 200 : 요청에 대해 정상 응답 
  2. Bad request 400 : 파라미터 등 요구 조건 미충족
  3. Forbidden 403 : 접근 거부 
  4. Not Found 404 : 잘못되었거나 존재하지 않는 주소 
  5. Method Not Allowed 405 : 사용 불가 메소드 사용 
  6. Internal Server Error 500 : 서버의 프로그램 오류 발생



#### get vs post

get : ? 뒤에 파라미터들이 써있다.

post : 인터넷 주소창에 아무런 파라미터도 없다. 깨끗

> 네이버 주소창에 한글자씩 입력하면서 개발자 도구의 network를 봐보면 추천검색어 항목을 위해 비동기 통신하는 것을 볼 수 있음!

```java
package com.dico1631.basic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MethodController {
	//get은 되는데 post는 안됨
	//브라우저에 호출하는 건 무조건 get 방식
	//그래서 post로 해야할때 테스트를 위해 restlet client 필요
	
	@GetMapping("req/get")
	@RequestMapping(value = "req/get", method = RequestMethod.GET)
	public String get() {
		return "GET";
	}

	@PostMapping("req/post")
	@RequestMapping(value = "req/post", method = RequestMethod.POST)
	public String post() {
		return "POST";
	}
}
```

 위는 연습용이고, 실제로는 get/post 둘 다 주소는 같게 하고 방식만 다르게 함
경우의 수를 줄여서 보기 좋고 편리하게 만든 것

```java
@GetMapping("req/login")
@RequestMapping(value = "req/get", method = RequestMethod.GET)
public String get() {
	return "GET";
}

@PostMapping("req/login")
@RequestMapping(value = "req/post", method = RequestMethod.POST)
public String post() {
	return "POST";
}

// 잘된 예 : https://okky.kr/article/663225  :짧은 주소
// 안좋은 예 : https://tacademy.skplanet.com/front/tacademy/courseinfo/campus.action?classIndex=1618  :긴 주소
```
 Request 쓰거나 아니면 put/delete 쓰거나 둘 중 하나 선택

```java
//@PutMapping("req/put")
@RequestMapping(value = "req/put", method = RequestMethod.PUT)
public String put() {
	return "PUT";
}

//@DeleteMapping("req/delete")
@RequestMapping(value = "req/delete", method = RequestMethod.DELETE)
public String delete() {
	return "DELETE";
}
```




## 1. RequestParam

정해진 규칙이 없음. 다 받음 > 개인 프로젝트 때 주로 사용



## 2. ModelAttribute

정해진 규칙을 정확하게 따라야함. > 회사가 쓰는 방식



```java
package com.dico1631.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	@GetMapping("/login")
	public String Getlogin() {
		return "login";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String Postlogin(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw) {
		
		String dbId = "boot";
		String dbPw = "1234";
		
		if(dbId.equals(id) && dbPw.equals(pw)) {
			return "로그인 성공";
		}
		
		return "로그인 실패";
	}
}
```



# Thymeleaf

```java
package com.dico1631.basic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThymeleafController {
	@GetMapping("user")
	public String user(Model model) {
		Map<String, Object> user = null;
		user = new HashMap<>();
		user.put("userId", "z");
		user.put("userName", "zoo");
		user.put("userAge", 25);
		model.addAttribute("user", user);
		return "user";
	}
}
```

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디:
	<span>[[${user.userId}]]</span>
	<br> 이름:
	<span>[[${user.userName}]]</span>
	<br> 나이:
	<span>[[${user.userAge}]]</span>
	<br>
	<hr>
    
    <--가장 권장하는 방식-->
	아이디:
	<span th:text="${user.userId}"></span>
	<br> 이름:
	<span th:text="${user.userName}"></span>
	<br> 나이:
	<span th:text="${user.userAge}"></span>
	<br>
	<hr>
	아이디:
	<span data-th-text="${user.userId}"></span>
	<br> 이름:
	<span data-th-text="${user.userName}"></span>
	<br> 나이:
	<span data-th-text="${user.userAge}"></span>
	<br>
</body>
</html>
```

