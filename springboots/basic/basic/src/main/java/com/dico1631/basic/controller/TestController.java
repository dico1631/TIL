package com.dico1631.basic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


//���� return�� ��Ÿ�� html�� ����.
@RestController  //�ʼ�
public class TestController {
	@GetMapping("/test") //@~ = Annotation : ��ǻ�Ͱ� ���� ���� �ּ�, �Լ� ���� �����, �ʼ�
	public String test() {
		//���⿡ html �ᵵ ������, ���� ����ϱ� Html ������ ���� ����� �װ� �ҷ���
		return "<h1>Hello</h1>";
	}
}
