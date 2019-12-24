package com.dico1631.basic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dico1631.basic.model.User;

@Controller
public class SessionController {
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	//HttpSession session를 함수의 인자에 쓰면 spring이 알아서 session을 만들어줌
	public String loginPost(User user, HttpSession se) {
		//현재 스프링 서버에만 있으면 어디서든지 HttpSession session을 사용 가능
		se.setAttribute("user", user);
		//redirect는 지정된 곳으로 일을 보낸다는 의미, main으로 일을 보냄 > 사용자는 main만 작동하는 것으로 보임
		return "redirect:/main"; 
	}

	@GetMapping("/main")
	public String main() {
		return "main";
	}
}