package com.cmower.spring.controller.six;

import java.awt.image.BufferedImage;
import java.util.HashMap;

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
import com.cmower.common.util.GeetestLib;
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

	@RequestMapping("geetest")
	@ResponseBody
	public String geetest(@RequestParam(value = "username", required = false) String username,
			HttpServletResponse response) {
		try {
			GeetestLib gtSdk = new GeetestLib(Constants.Geetest.ID, Constants.Geetest.KEY,
					Constants.Geetest.NEWFAILBACK);

			String resStr = "{}";

			// 自定义参数,可选择添加
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("user_id", username); // 网站用户id
			param.put("client_type", "web"); // web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
			param.put("ip_address", "127.0.0.1"); // 传输用户请求验证时所携带的IP

			// 进行验证预处理
			int gtServerStatus = gtSdk.preProcess(param);

			// 将服务器状态设置到session中
			request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
			// 将userid设置到session中
			request.getSession().setAttribute("userid", username);

			resStr = gtSdk.getResponseStr();
			return resStr;

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			logger.error(e.getMessage());
			return null;
		}

	}

}
