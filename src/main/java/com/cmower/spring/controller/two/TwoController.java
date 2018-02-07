package com.cmower.spring.controller.two;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("two")
public class TwoController {
	@RequestMapping("")
	public String index() {
		return "two/index";
	}
	
	@RequestMapping("jslib")
	public String jslib() {
		return "two/index2";
	}
	
	@RequestMapping("jslib/{id}")
	public String jslib(@PathVariable String id) {
		return "two/index2";
	}
	
	@RequestMapping("attrVsPropGetter")
	public String attrVsPropGetter() {
		return "two/attr_prop_getter";
	}
	
	@RequestMapping("attrVsPropSetter")
	public String attrVsPropSetter() {
		return "two/attr_prop_setter";
	}
	
	@RequestMapping("attrSetter")
	public String attrSetter() {
		return "two/attr_setter";
	}
	
	@RequestMapping("valGetter")
	public String valGetter() {
		return "two/val_getter";
	}
	
	@RequestMapping("valSetter")
	public String valSetter() {
		return "two/val_setter";
	}
}
