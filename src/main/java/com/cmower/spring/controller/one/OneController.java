package com.cmower.spring.controller.one;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("one")
public class OneController {
	@RequestMapping("")
	public String index() {
		return "one/index";
	}
}
