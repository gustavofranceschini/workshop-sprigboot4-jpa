package com.educandoweb.course.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.educandoweb.course.entities.User;
import com.educandoweb.course.repositories.UserRepository;
import com.educandoweb.course.services.exceptions.ResourceNotFoundException;

@Service
public class UserService {
	
	@Autowired
	private UserRepository reposity;
	
	public List<User> findAll(){
		return reposity.findAll();
	}
	
	public User findById(Long id) {
		Optional<User> obj = reposity.findById(id);
		return obj.orElseThrow(() -> new ResourceNotFoundException(id));
	}
	
	public User insert(User obj) {
		return reposity.save(obj);
	}
	
	public void delete(Long id) {		
		reposity.deleteById(id);
	}
	
	public User update(Long id, User obj) {
		User entity = reposity.getReferenceById(id);
		updateData(entity, obj);
		return reposity.save(entity);
	}

	private void updateData(User entity, User obj) {
		entity.setName(obj.getName());
		entity.setEmail(obj.getEmail());
		entity.setPhone(obj.getPhone());		
	}
}