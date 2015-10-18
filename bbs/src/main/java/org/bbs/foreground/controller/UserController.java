package org.bbs.foreground.controller;

import java.util.Date;

import org.bbs.entity.Group;
import org.bbs.entity.User;
import org.bbs.entity.UserInfo;
import org.bbs.service.UserInfoService;
import org.bbs.service.GroupService;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	UserInfoService userInfoService;
	
	@Autowired
	GroupService groupService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, User user, UserInfo userInfo) {
		User u = userService.findByUsername(user.getUsername());
		if (u != null) {
			model.addAttribute("user", user);
			model.addAttribute("error", "用户已存在");
			return "/register";
		}
		try {
			u = userService.findByEmail(user.getEmail());
		} catch (Exception e) {
			model.addAttribute("user", user);
			model.addAttribute("error", "邮箱已被占用");
			return "register";
		}
		
			Group group = groupService.get(1);
			user.setGroup(group);
			user.setCreateDate(new Date());
			userService.createUser(user);
			userInfo.setUser(user);
			userInfoService.addUserInfo(userInfo);
			model.addAttribute("user", user);
		return "registerSuccess";
	}

	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "test/register";
	}
}
