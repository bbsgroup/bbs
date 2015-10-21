package org.bbs.foreground.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.bbs.entity.Group;
import org.bbs.entity.User;
import org.bbs.entity.UserInfo;
import org.bbs.service.GroupService;
import org.bbs.service.UserInfoService;
import org.bbs.service.UserService;
import org.common.util.IpUtil;
import org.common.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller("foregroudUserController")
@RequestMapping(value = "/forum/user")
@SessionAttributes("currentUser")
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
			return "test/register";
		}
		try {
			u = userService.findByEmail(user.getEmail());
		} catch (Exception e) {
			model.addAttribute("user", user);
			model.addAttribute("error", "邮箱已被占用");
			return "test/register";
		}
		
			Group group = groupService.get(new Long(1));
			user.setGroup(group);
			user.setCreateDate(new Date());
			userService.createUser(user);
			userInfo.setUser(user);
			userInfoService.addUserInfo(userInfo);
			model.addAttribute("user", user);
		return "test/registerSuccess";
	}

	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "test/register";
	}
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "test/login";
	}
	
	/*
	 * 用户登录功能
	 * 在用户登录的时候更新登录信息，登录ip,上次登录ＩＰ,登录时间，上次登录时间
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, User user,HttpServletRequest request) {
		User currentUser  = userService.findByUsername(user.getUsername());
		if(currentUser==null)
		{
			model.addAttribute("user", user);
			model.addAttribute("error", "用户不存在");
			return "test/login";
		}
		try {
			String pwd = SecurityUtil.md5(user.getPassword()+currentUser.getSalt());
			if(!pwd.equals(currentUser.getPassword())){
				model.addAttribute("user", user);
				model.addAttribute("error", "用户密码错误");
				return "test/login";
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("currentUser", currentUser);
		UserInfo currentUserInfo = userInfoService.findByUserId(currentUser.getId());
		String ip = IpUtil.getIpAddr(request);
		currentUserInfo.setLastIp(currentUserInfo.getIp());
		currentUserInfo.setIp(ip);
		currentUserInfo.setLastLoginTime(currentUserInfo.getLoginTime());
		currentUserInfo.setLoginTime(new Date());
		userInfoService.update(currentUserInfo);
		model.addAttribute("userInfo", currentUserInfo);
		return "test/loginSuccess";
	}
	/*
	 * 用户注销功能
	 */
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "test/login";
	}
	
}
