package com.cmower.spring.controller.six;

import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmower.common.Variables;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.Users;
import com.cmower.spring.controller.BaseController;
import com.cmower.spring.service.UserService;

@Controller
@RequestMapping("six")
public class SixController extends BaseController {
	@Autowired
	private UserService userService;

	@RequestMapping("login")
	public String login() {
		return "six/login";
	}

	@RequestMapping("")
	public String index(@RequestParam(required = false, defaultValue = "index") String p) {
		return "six/" + p;
	}

	@RequestMapping("checkLogin")
	@ResponseBody
	public AjaxResponse checkLogin(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) {
		logger.debug("用户{}准备登录", username);

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		if (StringUtils.isEmpty(username)) {
			response.setField("username");
			response.setMessage("账号为空");
			return response;
		}

		if (StringUtils.isEmpty(password)) {
			response.setField("password");
			response.setMessage("密码为空");
			return response;
		}

		Users user = this.userService.loadOne(username);
		if (user == null) {
			response.setField("username");
			response.setMessage("账号不存在");
			return response;
		}

		if (!CipherUtils.generatePassword(password).equals(user.getPassword())) {
			response.setField("password");
			response.setMessage("密码不正确");
			return response;
		}

		response = AjaxResponseUtils.getSuccessResponse();
		response.setForwardUrl(Variables.ctx + "/six");
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("check")
	@ResponseBody
	public HashMap check(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "param", required = false) String param) {
		logger.debug("检查属性{}的值{}是否存在", name, param);

		HashMap result = new HashMap();
		if (StringUtils.isEmpty(param)) {
			result.put("status", "n");
			result.put("info", "请输入账号");
			return result;
		}
		
		Users user = this.userService.loadOne(param);
		if (user != null) {
			result.put("status", "n");
			result.put("info", "账号已存在");
			return result;
		}
		
		result.put("status", "y");
		result.put("info", "账号可以使用");
		return result;
	}
}
