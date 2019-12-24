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
	//HttpSession session�� �Լ��� ���ڿ� ���� spring�� �˾Ƽ� session�� �������
	public String loginPost(User user, HttpSession se) {
		//���� ������ �������� ������ ��𼭵��� HttpSession session�� ��� ����
		se.setAttribute("user", user);
		//redirect�� ������ ������ ���� �����ٴ� �ǹ�, main���� ���� ���� > ����ڴ� main�� �۵��ϴ� ������ ����
		return "redirect:/main"; 
	}

	@GetMapping("/main")
	public String main() {
		return "main";
	}
}