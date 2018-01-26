package com.cmower.spring.controller.two;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("two")
public class TwoController {
	@RequestMapping("")
	public String index() {
		return "two/index";
	}
	
	@RequestMapping("jslib")
	public String index2() {
		return "two/index2";
	}
}
