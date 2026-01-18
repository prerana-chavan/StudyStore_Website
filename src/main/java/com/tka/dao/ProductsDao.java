package com.tka.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tka.model.Products;
import com.tka.model.Users;

@Repository
public interface ProductsDao extends JpaRepository<Products, Integer> {

	
}
