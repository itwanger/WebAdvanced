package com.cmower.spring.controller.two;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("textVsHtmlGSetter")
	public String textVsHtmlSGetter() {
		return "two/text_html_gsetter";
	}

	@RequestMapping("dataGSetter")
	public String dataGSetter() {
		return "two/data_gsetter";
	}

	@RequestMapping("domOperation")
	public String domOperation() {
		return "two/dom_operation";
	}

	@RequestMapping("initAjaxNprogress")
	public String initAjaxNprogress() {
		return "two/ajax_nprogress";
	}

	// 中文响应乱码的解决方案1
//	 @RequestMapping(value="ajaxNprogress",produces="text/html;charset=UTF-8")
	@RequestMapping(value = "ajaxNprogress")
	@ResponseBody
	public String ajaxNprogress() {
		// NProgress 的显示效果，2秒后再响应
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
		}
		return "你好";
	}

	@RequestMapping("ajaxNprogress1")
	public void ajaxNprogress1(HttpServletResponse response) throws IOException {
		response.getWriter().write("你好");
	}

}
