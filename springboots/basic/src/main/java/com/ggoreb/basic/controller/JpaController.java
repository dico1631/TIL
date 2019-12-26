package com.ggoreb.basic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ggoreb.basic.model.Product;
import com.ggoreb.basic.repository.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class JpaController {
	@Autowired
	ProductRepository productRepository;
	
	@GetMapping("/jpa/product2")
	public List<Product> product2(String name) {
		List<Product> list = productRepository.findByName(name);
		return list;
	}

	@GetMapping("/jpa/product")
	public List<Product> product() {
		List<Product> list = productRepository.findAll();
		return list;
	}
	

	@PostMapping("/jpa/product")
	public String productPost(@ModelAttribute Product product) {
		Product pro = productRepository.save(product);
		log.error(pro.toString());
		return "redirect:/jpa/product";
	}
}