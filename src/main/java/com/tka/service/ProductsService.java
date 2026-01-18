package com.tka.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.ProductsDao;
import com.tka.model.Products;

@Service
public class ProductsService {

	@Autowired
	ProductsDao pd;
	
	List<Products> cartProductsList;

	
	public List<Products> getAllProducts() {
		List<Products> allProducts = pd.findAll();
		return allProducts;
	}


	public Products addToCart(int id) {
		Products product = pd.getById(id);
		if(cartProductsList == null) {
			cartProductsList = new ArrayList<>();
		}
		
		cartProductsList.add(product);
		
		return product;
	}


	public List<Products> getCartProducts() {
		return cartProductsList;
	}


	public Products saveProduct(Products product) {
		Products product1 =  pd.save(product);
		return product1;
	}
	
	
}
