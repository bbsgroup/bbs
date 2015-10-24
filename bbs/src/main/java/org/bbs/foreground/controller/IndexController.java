package org.bbs.foreground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("foregroudIndexController")
@RequestMapping(value = "/forum")
public class IndexController {

	@RequestMapping(value="/index",method=RequestMethod.GET)
  public String Index(){
		
		return "test/index";
  }
}
