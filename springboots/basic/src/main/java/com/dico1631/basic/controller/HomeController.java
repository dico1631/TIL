package com.dico1631.basic.controller;
//shift + ctrl + f : �ڵ�����
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class HomeController {
	//syso�� ��¸� �ǰ�, ���� ����. �׷� �� ����� �ƹ� �ϵ� ���ؼ� �� ������ ���Ͽ� �����Ϸ��� ���
	//�ð��� ���� log�� ���Ϸ� ������. syso���� ����
	Logger log = LoggerFactory.getLogger(this.getClass()); //org.slf4j ����, ����
	
	@RequestMapping("/")
	public String home() {
		//info���� �����°� default���̶� trace�� debug�� ��������� application.properties�� 
		//# log level
		//logging.level.com.dico1631.basic=trace �� �Է�
		log.trace("trace!");		
		log.debug("debug!");	//���ߴܰ� ���� Ȯ�ο�, ������� �ᵵ ��	
		log.info("info!");	//��� �� �ʿ��� ����, ����ڿ��� �� �ʿ��� ���븸
		log.warn("warn!");	//�޸� ���� �� ���, ������ ���� �� ���� ��
		log.error("error!");	//������ ������ �� ������ ���
		
		return "home";
	}
}