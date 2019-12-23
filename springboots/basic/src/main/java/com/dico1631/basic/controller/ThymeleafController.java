package com.dico1631.basic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThymeleafController {
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