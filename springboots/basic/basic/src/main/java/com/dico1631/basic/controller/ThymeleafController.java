package com.dico1631.basic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ThymeleafController {
	// ModelAttribute면 name 안쓰면 안받음, RequestParam라서 안쓰면 그냥 없음을 보여줌
	@GetMapping("linkUrl")
	public String linkUrl(
//			@RequestParam int start,
//			@RequestParam int end,
			@RequestParam (defaultValue = "1") int now_page,
			Model model) {
		int start = (now_page-1) / 10 * 10 + 1;
		int end = start + 9;
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("now_page", now_page);
		
		return "linkUrl";
	}
	
	
	
	
	@GetMapping("mode")
	public String mode(Model model, @RequestParam Map<String, Object> map) {
		model.addAttribute("name", map.get("name"));
		model.addAttribute("auth", map.get("auth"));
		model.addAttribute("category", map.get("category"));
		return "mode";
	}

	@GetMapping("pagination")
	public String pagination(Model model, @RequestParam(defaultValue = "1") int page) {
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		return "pagination";
	}

	@GetMapping("user")
	public String user(Model model) {
		Map<String, Object> user = null;
		user = new HashMap<>();
		user.put("userId", "z");
		user.put("userName", "zoo");
		user.put("userAge", 25);
		model.addAttribute("user", user);
		return "user";
	}

	@GetMapping("userList")
	public String userList(Model model) {
		List<Map<String, Object>> userList = new ArrayList<>();
		Map<String, Object> user = null;
		user = new HashMap<>();
		user.put("userId", "a");
		user.put("userName", "apple");
		user.put("userAge", 21);
		userList.add(user);
		user = new HashMap<>();
		user.put("userId", "b");
		user.put("userName", "banana");
		user.put("userAge", 22);
		userList.add(user);
		user = new HashMap<>();
		user.put("userId", "c");
		user.put("userName", "carrot");
		user.put("userAge", 23);
		userList.add(user);
		model.addAttribute("userList", userList);
		return "userList";
	}
}