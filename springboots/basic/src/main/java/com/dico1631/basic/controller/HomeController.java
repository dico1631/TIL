package com.dico1631.basic.controller;
//shift + ctrl + f : 자동정렬
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class HomeController {
	//syso는 출력만 되고, 끄면 날라감. 그럼 그 결과로 아무 일도 못해서 이 내용을 파일에 저장하려고 사용
	//시간에 따라 log를 파일로 저장함. syso보다 빠름
	Logger log = LoggerFactory.getLogger(this.getClass()); //org.slf4j 쓰기, 공식
	
	@RequestMapping("/")
	public String home() {
		//info부터 나오는게 default값이라 trace와 debug도 보고싶으면 application.properties에 
		//# log level
		//logging.level.com.dico1631.basic=trace 를 입력
		log.trace("trace!");		
		log.debug("debug!");	//개발단계 에서 확인용, 마음대로 써도 됨	
		log.info("info!");	//운용 상 필요한 정보, 사용자에게 꼭 필요한 내용만
		log.warn("warn!");	//메모리 문제 등 경고, 문제가 생길 것 같을 때
		log.error("error!");	//동작이 멈췄을 때 문제를 출력
		
		return "home";
	}
}