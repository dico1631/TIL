package com.dico1631.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	@GetMapping("/login") //response : html ȭ�� ���, ������ ��� = get�ۿ� �ȵȴ�.
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
			return "�α��� ����";
		}
		
		return "�α��� ����";
	}
}
