package com.cmower.spring.controller.four;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("four")
public class FourController {
	@RequestMapping("")
	public String index() {
		return "four/index";
	}
	@RequestMapping("lazyload1")
	public String lazyload1() {
		return "four/lazyload1";
	}
	@RequestMapping("lazyload2")
	public String lazyload2() {
		return "four/lazyload2";
	}
}
