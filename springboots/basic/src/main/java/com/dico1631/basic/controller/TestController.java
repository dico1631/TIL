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
