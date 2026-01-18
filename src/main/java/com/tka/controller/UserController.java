package com.tka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tka.model.Users;
import com.tka.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/amz.com")
public class UserController {

    private final ShoppingController shoppingController;
	
	@Autowired
	UserService us;

    UserController(ShoppingController shoppingController) {
        this.shoppingController = shoppingController;
    }
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}
	
	@PostMapping("/registerUser")
	public String registerUser(@ModelAttribute Users user) {
		System.out.println(">> user controller - register user api ");
		boolean isRegister = us.registerUser(user);
		System.out.println("user registered *****");
		if(isRegister == true) {
			return "login";
		} 
		return "register";
	}
	
	@PostMapping("/verify-login")
	public String verifyLogin(@ModelAttribute Users user , Model model, HttpSession session) {
		
		Users loginUser = us.verifyLogin(user);
		
		
		 if(loginUser !=null ) {
			 model.addAttribute("msg", loginUser.getName()+" Login successfull !!!");
			 
			 session.setAttribute("loggedInUser", loginUser);
			 session.setAttribute("userId", loginUser.getUser_id());
			 
			 if(loginUser.getUsername().equalsIgnoreCase("ADMIN")) {
				 session.setAttribute("role", "ADMIN");
			 }else {
				 session.setAttribute("role", "USER");
			 }
			 
			 return "home";
		 }else {
			 model.addAttribute("msg", "Invalid username or password");
			 model.addAttribute("status", "error");
			 return "login";
		 }
	}
	
	@GetMapping("/allUsers")
	public String allUsers(Model model, HttpSession session) {
		
		String role =  (String) session.getAttribute("role");
		
		if(role != null && role.equalsIgnoreCase("ADMIN")) {
			List<Users>allUsers =  us.allUsers();
			model.addAttribute("usersList", allUsers);
			return "allUsers";
		}
		model.addAttribute("msg","Only admin can access users data");
		return "home";
	}
	
	@GetMapping("/user")
	public String getUser(HttpSession session, Model model) {
		
		
		Integer id=(Integer) session.getAttribute("userId");
		 if (id == null) {
		        return "login";
		    }
		
		Users user = us.getUserById(id);
		
		if(user == null) {
			session.invalidate();
			return "login";
		}
		
		model.addAttribute("user", user);
		
		return "viewProfile";
	}
	
	@GetMapping("/updateProfile/{id}")
	public String updateUserForm(@PathVariable int id,Model model) {
		Users user = us.getUserById(id);
		model.addAttribute("user", user);
		
		return "updateUser";
	}
	
	@PostMapping("/updateProfile")
	public String saveUpdate(@ModelAttribute Users user, Model model) {
		Users updatedUser = us.updateUser(user);
		
		if(updatedUser !=null) {
			System.out.println("user updated *****");
			model.addAttribute("msg", updatedUser.getName()+" Login successfull !!!");
			return "home";
		} 
		return "updateUser";
	}
	
	
	@GetMapping("/deleteProfile/{id}")
	public String deleteUser(@PathVariable int id, Model model) {
		
		us.deleteUser(id);
		
		return "login";
		
	}
	
	@GetMapping("/deleteProfileByAdmin/{id}")
	public String deleteUserByAdmin(@PathVariable int id, Model model) {
		
		us.deleteUser(id);
		
		List<Users>allUsers =  us.allUsers();
		model.addAttribute("usersList", allUsers);
		return "allUsers";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
}













