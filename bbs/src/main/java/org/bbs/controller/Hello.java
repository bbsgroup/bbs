package org.bbs.controller;

import org.base.exception.BusinessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hello {
	@RequestMapping("/hello")
	private String hello() throws BusinessException {
		if(true)
		throw new BusinessException("xx");
		return "hello";

	}

	@RequestMapping("/index")
	private String index() {
		System.out.println("hello");
		return "index-demo";

	}
	

	@RequestMapping("/admin/index")
	private String adminIndex() {
		return "admin/index";

	}

}
