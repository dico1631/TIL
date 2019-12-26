```java
org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'jpaController': Unsatisfied dependency expressed through field 'productRepository'; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'productRepository': Invocation of init method failed; nested exception is java.lang.IllegalArgumentException: Failed to create query for method public abstract com.ggoreb.basic.model.Product com.ggoreb.basic.repository.ProductRepository.findbyName(java.lang.String)! No property findbyName found for type Product!
```

```java
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
	public Product product2(String name) {
		Product list = productRepository.findbyName(name);
		return list;
	}
}
```

```java
package com.ggoreb.basic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ggoreb.basic.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
	
	//이름으로 조회
	public Product findbyName(String name);
}
```

```java
package com.ggoreb.basic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BasicApplication {

	public static void main(String[] args) {
		SpringApplication.run(BasicApplication.class, args);
	}

}
```

 : findbyName 함수명의 by가 소문자여서 일어난 에러, By로 써야함