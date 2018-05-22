package com.cmower.spring.controller.six;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmower.spring.controller.BaseController;

@Controller
@RequestMapping("six")
public class SixController extends BaseController {

	@RequestMapping("login")
	public String login() {
		return "six/login";
	}

	@RequestMapping("")
	public String index(@RequestParam(required = false, defaultValue = "index") String p) {
		return "six/" + p;
	}

	@RequestMapping("test")
	public String test(Model model) {
		model.addAttribute("name", "shiro test");
		return "six/test";
	}

	@RequestMapping("checkLogin")
	public String checkLogin(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) {
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);

		Subject currentUser = SecurityUtils.getSubject();
		currentUser.login(token);

		return "six/index";
	}

}
