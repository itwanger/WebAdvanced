package com.cmower.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public abstract class BaseController {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e, HttpServletRequest request) {
		request.setAttribute("exception", e);

		ModelAndView mav = new ModelAndView("error");
		mav.addObject("statusCode", 300);
		mav.addObject("message", e.getMessage());

		return mav;
	}

}
