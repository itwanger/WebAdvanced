package com.cmower.spring.controller.six;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.Users;
import com.cmower.spring.controller.BaseController;
import com.cmower.spring.service.UserService;
import com.google.code.kaptcha.Producer;

@Controller
@RequestMapping("six")
public class SixController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private Producer captchaProducer;

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
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "kaptchaCode", required = false) String kaptchaCode) {
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

		if (StringUtils.isEmpty(kaptchaCode)) {
			response.setField("kaptchaCode");
			response.setMessage("验证码为空");
			return response;
		}

		String sesssionKaptchaCode = getSessionAttr(Constants.SESSION_KAPTCHA_CODE);
		if (!sesssionKaptchaCode.equalsIgnoreCase(kaptchaCode)) {
			response.setField("kaptchaCode");
			response.setMessage("验证码不正确");
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

	@RequestMapping("kaptcha")
	public void kaptcha(HttpServletResponse response) {
		try {
			response.setContentType("image/png");

			String code = captchaProducer.createText();
			setSessionAttr(Constants.SESSION_KAPTCHA_CODE, code);

			BufferedImage image = captchaProducer.createImage(code);

			ServletOutputStream out = response.getOutputStream();
			ImageIO.write(image, "jpg", out);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			logger.error(e.getMessage());
		}
	}

}
