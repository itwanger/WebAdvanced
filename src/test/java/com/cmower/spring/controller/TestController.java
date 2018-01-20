package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="test")
public class TestController {
	@RequestMapping("hello")
	public String hello() {
		return "index";
	}
}
