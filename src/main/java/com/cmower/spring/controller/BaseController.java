package com.cmower.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.cmower.common.exception.OrderException;
import com.cmower.common.upload.MultipartRequest;
import com.cmower.common.upload.UploadFileManager;

public abstract class BaseController {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected HttpServletRequest request;

	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e, HttpServletRequest request) {
		request.setAttribute("exception", e);

		ModelAndView mav = new ModelAndView("error");
		mav.addObject("statusCode", 300);
		mav.addObject("message", e.getMessage());

		return mav;
	}

	/**
	 * Remove Object in session.
	 * 
	 * @param key
	 *            a String specifying the key of the Object stored in session
	 */
	public BaseController removeSessionAttr(String key) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.removeAttribute(key);
		return this;
	}

	/**
	 * Store Object to session.
	 * 
	 * @param key
	 *            a String specifying the key of the Object stored in session
	 * @param value
	 *            a Object specifying the value stored in session
	 */
	public BaseController setSessionAttr(String key, Object value) {
		request.getSession().setAttribute(key, value);
		return this;
	}

	@SuppressWarnings("unchecked")
	public <T> T getSessionAttr(String key) {
		HttpSession session = request.getSession(false);
		return session != null ? (T) session.getAttribute(key) : null;
	}

	/**
	 * Returns the value of a request parameter as a String, or null if the
	 * parameter does not exist.
	 * <p>
	 * You should only use this method when you are sure the parameter has only
	 * one value. If the parameter might have more than one value, use
	 * getParaValues(java.lang.String).
	 * <p>
	 * If you use this method with a multivalued parameter, the value returned
	 * is equal to the first value in the array returned by getParameterValues.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return a String representing the single value of the parameter
	 */
	public String getPara(String name) {
		return request.getParameter(name);
	}

	/**
	 * Returns the value of a request parameter as a String, or default value if
	 * the parameter does not exist.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @param defaultValue
	 *            a String value be returned when the value of parameter is null
	 * @return a String representing the single value of the parameter
	 */
	public String getPara(String name, String defaultValue) {
		String result = request.getParameter(name);
		return result != null && !"".equals(result) ? result : defaultValue;
	}

	/**
	 * Returns the value of a request parameter and convert to Integer.
	 * 
	 * when value == on,return 1
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return a Integer representing the single value of the parameter
	 */
	public Integer getParaToInt(String name) {
		return toInt(request.getParameter(name), null);
	}

	private Integer toInt(String value, Integer defaultValue) {
		try {
			if (value == null || "".equals(value.trim()))
				return defaultValue;
			value = value.trim();
			if (value.startsWith("N") || value.startsWith("n"))
				return -Integer.parseInt(value.substring(1));
			if (value.equals("on")) {
				return 1;
			}
			return Integer.parseInt(value);
		} catch (Exception e) {
			throw new OrderException("Can not parse the parameter \"" + value + "\" to Integer value.");
		}
	}

	/**
	 * Returns the value of a request parameter and convert to Integer with a
	 * default value if it is null.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return a Integer representing the single value of the parameter
	 */
	public Integer getParaToInt(String name, Integer defaultValue) {
		return toInt(request.getParameter(name), defaultValue);
	}

	private Long toLong(String value, Long defaultValue) {
		try {
			if (value == null || "".equals(value.trim()))
				return defaultValue;
			value = value.trim();
			if (value.startsWith("N") || value.startsWith("n"))
				return -Long.parseLong(value.substring(1));
			return Long.parseLong(value);
		} catch (Exception e) {
			throw new OrderException("Can not parse the parameter \"" + value + "\" to Long value.");
		}
	}

	/**
	 * Returns the value of a request parameter and convert to Long.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return a Integer representing the single value of the parameter
	 */
	public Long getParaToLong(String name) {
		return toLong(request.getParameter(name), null);
	}

	/**
	 * Returns the value of a request parameter and convert to Long with a
	 * default value if it is null.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return a Integer representing the single value of the parameter
	 */
	public Long getParaToLong(String name, Long defaultValue) {
		return toLong(request.getParameter(name), defaultValue);
	}

	private Boolean toBoolean(String value, Boolean defaultValue) {
		if (value == null || "".equals(value.trim()))
			return defaultValue;
		value = value.trim().toLowerCase();
		if ("1".equals(value) || "true".equals(value))
			return Boolean.TRUE;
		else if ("0".equals(value) || "false".equals(value))
			return Boolean.FALSE;
		throw new OrderException("Can not parse the parameter \"" + value + "\" to Boolean value.");
	}

	/**
	 * Returns the value of a request parameter and convert to Boolean.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return true if the value of the parameter is "true" or "1", false if it
	 *         is "false" or "0", null if parameter is not exists
	 */
	public Boolean getParaToBoolean(String name) {
		return toBoolean(request.getParameter(name), null);
	}

	/**
	 * Returns the value of a request parameter and convert to Boolean with a
	 * default value if it is null.
	 * 
	 * @param name
	 *            a String specifying the name of the parameter
	 * @return true if the value of the parameter is "true" or "1", false if it
	 *         is "false" or "0", default value if it is null
	 */
	public Boolean getParaToBoolean(String name, Boolean defaultValue) {
		return toBoolean(request.getParameter(name), defaultValue);
	}

	public UploadFileManager getFiles(HttpServletRequest request) {
		// 当前request不能覆盖this.request，否则下一步request就取不到内容
		if (request instanceof MultipartRequest == false)
			request = new MultipartRequest(request);
		return ((MultipartRequest) request).getFileManager();
	}
}
