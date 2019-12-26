package com.ggoreb.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceController {

	@GetMapping("/kakao")
	public String kakao() {
		return "kakao";
	}
	
	@GetMapping("/naver")
	public String naver() {
		return "naver";
	}
}
