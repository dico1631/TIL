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
