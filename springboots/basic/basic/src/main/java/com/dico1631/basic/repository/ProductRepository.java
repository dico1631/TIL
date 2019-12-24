package com.dico1631.basic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dico1631.basic.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}