package com.dico1631.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//controller : Ŭ���̾�Ʈ�� ������ ��û�� ������ �����ؼ� Ŭ���̾�Ʈ���� �˷��ִ� �߰� �ܰ�
//html ������ ���� ����� �ҷ��ͼ� return �Ѵ�.
@Controller
public class Test2Controller {
	@GetMapping("/test2")
	public String test2() {
		//html ���� return
		return "hello";
	}
}
