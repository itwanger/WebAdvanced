package com.cmower.spring.controller.five;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cmower.database.entity.Users;
import com.cmower.spring.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("test")
	public String test(Model model) {
		Users user = this.userService.load(1L);
		model.addAttribute("name", user.getUsername());
		return "five/test";
	}
}
