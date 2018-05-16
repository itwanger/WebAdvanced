package com.cmower.spring.controller.five;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("five")
public class FiveController {
	
	@RequestMapping(value = "login")
	public String login() {
		return "five/login";
	}
}
