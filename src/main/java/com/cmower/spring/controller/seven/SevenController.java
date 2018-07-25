package com.cmower.spring.controller.seven;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.base.PathKit;
import com.cmower.common.upload.UploadFileManager;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.common.util.FileUtils;
import com.cmower.common.util.GeetestLib;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.Cities;
import com.cmower.database.entity.Provinces;
import com.cmower.database.entity.UploadFile;
import com.cmower.database.entity.Users;
import com.cmower.spring.controller.BaseController;
import com.cmower.spring.service.ProcityService;
import com.cmower.spring.service.UserService;
import com.google.code.kaptcha.Producer;

@Controller
@RequestMapping("seven")
public class SevenController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProcityService procityService;
	@Autowired
	private Producer captchaProducer;

	@RequestMapping("hello")
	@ResponseBody
	public String hello() {
		return "hello " + getPara("content");
	}

	@RequestMapping("login")
	public String login() {
		return "seven/login";
	}

	@RequestMapping("")
	public String index(@RequestParam(required = false, defaultValue = "index") String p) {
		return "seven/" + p;
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
		response.setForwardUrl(Variables.ctx + "/seven");
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
	public String geetest() {
		try {
			GeetestLib gtSdk = new GeetestLib(Constants.Geetest.ID, Constants.Geetest.KEY,
					Constants.Geetest.NEWFAILBACK);

			String resStr = "{}";

			// 自定义参数,可选择添加
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("client_type", "web"); // web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
			param.put("ip_address", "127.0.0.1"); // 传输用户请求验证时所携带的IP

			// 进行验证预处理
			int gtServerStatus = gtSdk.preProcess(param);

			// 将服务器状态设置到session中
			request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);

			resStr = gtSdk.getResponseStr();
			return resStr;

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			logger.error(e.getMessage());
			return null;
		}
	}

	@RequestMapping("checkGeetest")
	@ResponseBody
	public AjaxResponse checkGeetest() {
		logger.debug("用户准备登录");

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		String username = getPara("username");
		if (StringUtils.isEmpty(username)) {
			response.setField("username");
			response.setMessage("账号为空");
			return response;
		}

		String password = getPara("password");
		if (StringUtils.isEmpty(password)) {
			response.setField("password");
			response.setMessage("密码为空");
			return response;
		}

		GeetestLib gtSdk = new GeetestLib(Constants.Geetest.ID, Constants.Geetest.KEY, Constants.Geetest.NEWFAILBACK);

		String challenge = getPara(GeetestLib.fn_geetest_challenge);
		String validate = getPara(GeetestLib.fn_geetest_validate);
		String seccode = getPara(GeetestLib.fn_geetest_seccode);

		int gtResult = 0;

		// 从session中获取gt-server状态
		int gt_server_status = getSessionAttr(gtSdk.gtServerStatusSessionKey);
		if (gt_server_status == 1) {
			// gt-server正常，向gt-server进行二次验证

			// 自定义参数,可选择添加
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("client_type", "web"); // web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
			param.put("ip_address", "127.0.0.1"); // 传输用户请求验证时所携带的IP

			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
			logger.debug("gt-server二次验证结果{}", gtResult);

		} else {
			// gt-server非正常情况下，进行failback模式验证

			logger.warn("failback:use your own server captcha validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			logger.debug("failback模式验证验证结果{}", gtResult);

		}

		// 1表示验证成功0表示验证失败
		if (gtResult == 1) {
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
			response.setForwardUrl(Variables.ctx + "/seven");
			return response;
		} else {
			response.setMessage("验证失败，请稍后再试");
			return response;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("username/check")
	@ResponseBody
	public HashMap checkUsernameo() {
		HashMap result = new HashMap<>();
		String username = getPara("username");
		String email = getPara("email");
		logger.debug("用户名{}，邮箱{}", username, email);

		Users user = this.userService.loadOne(username);
		if (user != null) {
			result.put("valid", false);
			return result;
		}

		result.put("valid", true);
		return result;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("treeview/procity")
	@ResponseBody
	public List<HashMap> treeviewProcity() {
		logger.info("treeview获取省市级数据");

		List<HashMap> data = new ArrayList<>();
		List<Provinces> provinces = procityService.selectProvinces();
		for (Provinces province : provinces) {
			HashMap parent = new HashMap();

			// 树节点上要显示的文本
			parent.put("text", province.getProname());
			// 节点的唯一性
			parent.put("id", province.getId());
			// 省会编码
			parent.put("procode", province.getProcode());

			// 根据省会ID获取城市列表
			List<Cities> citys = procityService.getCitiesByProvinceId(province.getId());

			List<HashMap> children = new ArrayList<>();
			for (Cities city : citys) {
				HashMap child = new HashMap();
				child.put("text", city.getCname());
				child.put("id", city.getId());
				// 省会ID
				child.put("proid", city.getProid());
				// 城市编码
				child.put("code", city.getCode());

				children.add(child);
			}
			parent.put("nodes", children);

			data.add(parent);
		}

		return data;
	}

	@RequestMapping("treeview/submit")
	@ResponseBody
	public String treeviewSubmit() {
		logger.debug(getPara("ids"));
		return "数据已收到";
	}

	@RequestMapping("saveHeadimg")
	@ResponseBody
	public AjaxResponse saveHeadimg(HttpServletRequest request) {
		logger.debug("用户头像上传");

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		// 获取上上传文件的管理器类
		UploadFileManager fileManager = getFiles(request);

		// 获取上传文件
		UploadFile file = fileManager.getFile();

		// 判断是否为空，如果客户端没有上传文件，则返回错误消息
		if (file == null) {
			response.setField("headimg");
			response.setMessage("请上传头像");
			return response;
		}

		// 验证通过后对上传文件进行保存
		fileManager.save();

		// 将用户上传的头像路径保存到数据库中
		Users user = this.userService.loadOne("wang");
		Users update = new Users();
		update.setId(user.getId());
		update.setHeadimg(file.getCompleteName());
		this.userService.updateSelective(update);

		response = AjaxResponseUtils.getSuccessResponse();
		// 返回客户端可以访问的文件路径+文件名
		response.put("headimg", file.getCompleteName());
		return response;
	}

	@RequestMapping("saveDropifyImg")
	@ResponseBody
	public AjaxResponse saveDropifyImg(HttpServletRequest request) {
		logger.debug("使用Dropify上传图片");

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		// 获取上上传文件的管理器类
		UploadFileManager fileManager = getFiles(request);

		// 获取上传文件
		UploadFile file = fileManager.getFile();

		// 判断是否为空，如果客户端没有上传文件，则返回错误消息
		if (file == null) {
			response.setMessage("请选择图片");
			return response;
		}

		// 验证通过后对上传文件进行保存
		fileManager.save();

		response = AjaxResponseUtils.getSuccessResponse();
		// 返回客户端可以访问的文件路径+文件名
		response.put("imgUrl", file.getCompleteName());
		return response;
	}

	@RequestMapping("saveFile")
	@ResponseBody
	public AjaxResponse saveFile(HttpServletRequest request) {
		logger.debug("使用Bootstrap FileInput上传文件");

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		// 获取上上传文件的管理器类
		UploadFileManager fileManager = getFiles(request);

		// 获取上传文件
		UploadFile file = fileManager.getFile();

		// 判断是否为空，如果客户端没有上传文件，则返回错误消息
		if (file == null) {
			// throw new Exception("jsp后缀的文件不安全，禁止上传");
			response.setMessage("请选择文件");
			return response;
		}

		// 验证通过后对上传文件进行保存
		fileManager.save();

		response = AjaxResponseUtils.getSuccessResponse();
		// 返回客户端可以访问的文件路径+文件名
		response.put("fileUrl", file.getCompleteName());
		return response;
	}
	@RequestMapping("saveThumbFile")
	@ResponseBody
	public AjaxResponse saveThumbFile(HttpServletRequest request) {
		logger.debug("使用Bootstrap FileInput上传Thumb文件");
		
		AjaxResponse response = AjaxResponseUtils.getFailureResponse();
		
		// 获取上上传文件的管理器类
		UploadFileManager fileManager = getFiles(request);
		
		// 获取上传文件
		UploadFile file = fileManager.getFile();
		
		// 判断是否为空，如果客户端没有上传文件，则返回错误消息
		if (file == null) {
			// throw new Exception("jsp后缀的文件不安全，禁止上传");
			response.setMessage("请选择文件");
			return response;
		}
		
		// 验证通过后对上传文件进行保存
		fileManager.save();
		
		response = AjaxResponseUtils.getSuccessResponse();
		// 返回客户端可以访问的文件路径+文件名
		response.put("fileThumbUrl", file.getCompleteName());
		return response;
	}

	@RequestMapping("deleteFile")
	@ResponseBody
	public AjaxResponse deleteFile() {
		logger.debug("使用Bootstrap FileInput删除文件");

		AjaxResponse response = AjaxResponseUtils.getFailureResponse();

		// 获取要删除的文件名
		String fileName = getPara("fileName");
		String saveDirectory = PathKit.getWebRootPath() + File.separator + Constants.DEFAULT_UPLOAD + File.separator;
		FileUtils.deleteFile(saveDirectory + fileName);

		response = AjaxResponseUtils.getSuccessResponse();
		return response;
	}
}
