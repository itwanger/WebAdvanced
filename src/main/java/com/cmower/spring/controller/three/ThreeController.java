package com.cmower.spring.controller.three;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("three")
public class ThreeController {
	@RequestMapping("")
	public String index() {
		return "three/index";
	}
	
	@RequestMapping("css12")
	public String css12() {
		return "three/css12";
	}

}
