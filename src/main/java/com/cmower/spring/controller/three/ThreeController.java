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

	@RequestMapping("offset")
	public String offset() {
		return "three/offset";
	}

	@RequestMapping("rowInrow")
	public String rowInrow() {
		return "three/row_in_row";
	}

	@RequestMapping("listUnstyled")
	public String listUnstyled() {
		return "three/list_unstyled";
	}

	@RequestMapping("tableResponsive")
	public String tableResponsive() {
		return "three/table_responsive";
	}

	@RequestMapping("formHorizontal")
	public String formHorizontal() {
		return "three/form_horizontal";
	}

	@RequestMapping("button")
	public String button() {
		return "three/button";
	}

	@RequestMapping("img")
	public String img() {
		return "three/img";
	}

	@RequestMapping("icon")
	public String icon() {
		return "three/icon";
	}
	
	@RequestMapping("nav")
	public String nav() {
		return "three/nav";
	}
	@RequestMapping("accordion")
	public String accordion() {
		return "three/accordion";
	}
	
	@RequestMapping("topNav")
	public String topNav() {
		return "three/top_nav";
	}

}
