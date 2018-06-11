package com.cmower.spring.controller.sitemesh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmower.spring.controller.BaseController;

@Controller
@RequestMapping("sitemesh")
public class SitemeshController extends BaseController {

	@RequestMapping("")
	public String index(@RequestParam(required = false, defaultValue = "index") String p) {
		return "sitemesh/" + p;
	}


}
