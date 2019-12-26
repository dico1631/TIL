package com.example.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.board.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	public User findByEmailAndPwd(String email, String pwd);
}