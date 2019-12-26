package com.ggoreb.basic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ggoreb.basic.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
	
	//�̸����� ��ȸ
	public List<Product> findByName(String name);
}