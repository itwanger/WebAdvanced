package com.cmower.spring.controller.sitemesh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmower.database.entity.Users;
import com.cmower.spring.controller.BaseController;
import com.cmower.spring.service.UserService;

@Controller
@RequestMapping("sitemesh")
public class SitemeshController extends BaseController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("")
	public String index(@RequestParam(required = false, defaultValue = "index") String p, Model model) {
		if ("summernote".equals(p)) {
			Users user = this.userService.loadOne("wang");
			model.addAttribute("detail", user.getDetail());
		} else if ("query-form".equals(p)) {
			Users param = new Users();
			param.setRealname(getPara("realname"));
			List<Users> list = this.userService.selectList(param);
			model.addAttribute("list", list);
			model.addAttribute("param", param);
		}
		
		return "sitemesh/" + p;
	}
}
