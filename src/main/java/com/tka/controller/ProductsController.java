package com.tka.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tka.model.Products;
import com.tka.model.Users;
import com.tka.service.ProductsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/amz.com")
public class ProductsController {

	private final ShoppingController shoppingController;

	@Autowired
	ProductsService ps;

	ProductsController(ShoppingController shoppingController) {
		this.shoppingController = shoppingController;
	}

	@GetMapping("/allProducts")
	public String getAllProducts(Model model) {
		List<Products> allProducts = ps.getAllProducts();
		model.addAttribute("products", allProducts);
		return "products";
	}

	@PostMapping("/addToCart/{id}")
	public String addToCart(@PathVariable int id, Model model, HttpSession session) {

		Users user = (Users) session.getAttribute("loggedInUser");
		if (user == null) {
			return "login";
		}

		Products product = ps.addToCart(id);

		model.addAttribute("msg", product.getProduct_name() + "added to cart");

		List<Products> allProducts = ps.getAllProducts();
		model.addAttribute("products", allProducts);

		return "products";
	}

	@GetMapping("/cart")
	public String getAllCartProducts(Model model) {
		List<Products> cartProducts = ps.getCartProducts();
		model.addAttribute("products", cartProducts);
		return "cart";
	}

	@PostMapping("/buyNow")
	public String buyNow(Model model, HttpSession session) {

		Users user = (Users) session.getAttribute("loggedInUser");

		List<Products> cartProducts = ps.getCartProducts();

		model.addAttribute("products", cartProducts);
		// or getName()
		model.addAttribute("username", user.getUsername());
		model.addAttribute("orderId", "ORD" + System.currentTimeMillis());
		model.addAttribute("orderDate", java.time.LocalDate.now());
		return "bill";
	}

	@GetMapping("/addProduct")
	public String addProductPage(HttpSession session, Model model) {
		String role = (String) session.getAttribute("role");

		if (role != null && role.equalsIgnoreCase("ADMIN")) {
			
			return "addProduct";
		}
		model.addAttribute("msg", "Only admin can add products");
		return "home";
	}

	@PostMapping("/saveProduct")
	public String saveProduct(@ModelAttribute Products product,
	                          @RequestParam("productImage") MultipartFile file,
	                          Model model) {

	    String fileName = file.getOriginalFilename();

	    try {
	        String uploadPath = "E:/product-images/";   // external folder
	        File dir = new File(uploadPath);
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        file.transferTo(new File(uploadPath + fileName));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    product.setImgUrl(fileName);   // image name DB madhe
	    ps.saveProduct(product);

	    model.addAttribute("products", ps.getAllProducts());
	    return "products";
	}
	
	


}
