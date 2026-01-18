package com.tka.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.UserDao;
import com.tka.model.Users;

@Service
public class UserService {

	@Autowired
	UserDao ud;

	public boolean registerUser(Users user) {
		Users registerUser = ud.save(user);
		if (registerUser != null) {
			return true;
		}
		return false;
	}

	public Users verifyLogin(Users user) {
		List<Users> allUser = ud.findAll();
		for (Users u : allUser) {
			if (u.getUsername().equals(user.getUsername())) {
				if (u.getPassword().equals(user.getPassword())) {
					return u;
				}
			}
		}
		return null;

	}

	public List<Users> allUsers() {
		List<Users> allUsers = ud.findAll();
		return allUsers;

	}

	public Users getUserById(int id) {
		Users user = ud.findById(id).orElseThrow(() -> new RuntimeException("User not exist"));
		return user;
	}

	public Users updateUser(Users user) {
	Users user1=	ud.save(user);
		if(user1 !=null) {
			return user1;
		}
		return null;
		
	}

	public void deleteUser(int id) {
		ud.deleteById(id);
	}

	


}
