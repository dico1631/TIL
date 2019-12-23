package com.dico1631.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dico1631.basic.model.Member;

@RestController
public class RequestController {
	// ��Ű�� ��� "http://localhost:8080/req/param1?key1=key1&key2=key2" ������ ��
	@GetMapping("req/param1")
	public String param1(@RequestParam("key1") String key1, @RequestParam("key2") String key2) {
		return key1 + ", " + key2;
	}

	// �ƹ��ų� �־ �� ���� "http://localhost:8080/req/param2?a=a&b=b&c=c"
	@GetMapping("req/param2")
	public String param2(@RequestParam Map<String, Object> map) {
		return map.toString();
	}

	@GetMapping("req/http")
	public String http(HttpServletRequest request) {
		String name = request.getParameter("name");
		String pageNum = request.getParameter("pageNum");
		return name + ", " + pageNum;
	}

	@GetMapping("req/model")
	public String model(@ModelAttribute Member member) {
		return member.toString();
	}
}
