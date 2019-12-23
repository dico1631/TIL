# 단축키

- shift + ctrl + o : 한 번에 import



# spring boots 설치

https://spring.io/tools > download

다운받은 폴더  > 파일 > window powershell > java -jar sprint + tab

안되면 자바가 설치된 위치(ojdkbuild)\java 하기



lombok : 자동으로 setter, getter 만들어 주는 함수

[lombok-1.18.0.jar](https://projectlombok.org/downloads/lombok-1.18.0.jar) 다운

sptingboots.exe 파일 선택 > install



필요할 때 어디선가 찾아서 필요한 것을 가져와 설치해주는 방법 : python pip, java gradle or meven

- 매 실행시 이전 실행한 것을 종료하고 실행해야함. 안그러면 저장했어도 변경사항이 적용이 안됨



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
	Logger log = LoggerFactory.getLogger(this.getClass()); //org.slf4j 쓰기, 공식
	
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
2.  JSON - Map / DTO / List

