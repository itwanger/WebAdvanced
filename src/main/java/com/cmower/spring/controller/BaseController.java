package com.cmower.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

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

}
