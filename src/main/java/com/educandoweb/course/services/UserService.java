package com.educandoweb.course.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.educandoweb.course.entities.User;
import com.educandoweb.course.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository reposity;
	
	public List<User> findAll(){
		return reposity.findAll();
	}
	
	public User findById(Long id) {
		Optional<User> obj = reposity.findById(id);
		return obj.get();
	}
	
	
	
}
