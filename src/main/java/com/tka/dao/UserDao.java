package com.tka.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tka.model.Users;

@Repository
public interface UserDao extends JpaRepository<Users, Integer>{

	;
}
