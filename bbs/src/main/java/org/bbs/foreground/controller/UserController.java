package org.bbs.foreground.controller;

import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.base.entity.Page;
import org.base.entity.SystemContext;
import org.bbs.entity.Group;
import org.bbs.entity.User;
import org.bbs.entity.UserInfo;
import org.bbs.service.GroupService;
import org.bbs.service.ReplyService;
import org.bbs.service.TopicService;
import org.bbs.service.UserInfoService;
import org.bbs.service.UserService;
import org.common.util.IpUtil;
import org.common.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("foregroudUserController")
@RequestMapping(value = "/forum/user")
@SessionAttributes(value = "currentUser")
public class UserController {
	@Autowired
	UserService userService;

	@Autowired
	UserInfoService userInfoService;

	@Autowired
	GroupService groupService;

	@Autowired
	ReplyService replyService;

	@Autowired
	TopicService topicService;

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, User user, UserInfo userInfo,
			HttpSession session, String code) {

		if (!code.equalsIgnoreCase((String) session.getAttribute("code"))) {
			model.addAttribute("error", "验证码错误");
			return "redirect:registerPage";
		}

		User u = userService.findByUsername(user.getUsername());
		if (u != null) {
			model.addAttribute("user", user);
			model.addAttribute("error", "用户已存在");
			return "redirect:registerPage";
		}
		try {
			u = userService.findByEmail(user.getEmail());
		} catch (Exception e) {
			model.addAttribute("user", user);
			model.addAttribute("error", "邮箱已被占用");
			return "redirect:registerPage";
		}

		Group group = groupService.get(new Long(1));
		user.setGroup(group);
		user.setCreateDate(new Date());
		userService.createUser(user);
		userInfo.setUser(user);
		userInfoService.addUserInfo(userInfo);
		model.addAttribute("user", user);
		return "redirect:/index";
	}

	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "bbs/registerPage";
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(Model error) {

		return "bbs/loginPage";
	}

	/*
	 * 用户登录功能 在用户登录的时候更新登录信息，登录ip,上次登录ＩＰ,登录时间，上次登录时间
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, User user, RedirectAttributes attr,
			HttpServletRequest request, String cookietime,
			HttpServletResponse response) {

		User currentUser = userService
				.findByUsername(user.getUsername().trim());
		if (currentUser == null) {
			attr.addFlashAttribute("usernameError", "用户不存在");
			return "redirect:loginPage";
		}

		try {
			String pwd = SecurityUtil.md5(user.getPassword().trim()
					+ currentUser.getSalt());
			if (!pwd.equals(currentUser.getPassword())) {
				attr.addFlashAttribute("passwordError", "用户密码错误");
				return "redirect:loginPage";
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 为何没有在session中有currentUser
		model.addAttribute("currentUser", currentUser);
		request.getSession().setAttribute("currentUser", currentUser);
		System.out.println(((User) request.getSession().getAttribute(
				"currentUser")).getUsername());
		System.out.println(request.getSession().getId());
		UserInfo currentUserInfo = userInfoService.findByUserId(currentUser
				.getId());
		String ip = IpUtil.getIpAddr(request);
		currentUserInfo.setLastIp(currentUserInfo.getIp());
		currentUserInfo.setIp(ip);
		currentUserInfo.setLastLoginTime(currentUserInfo.getLoginTime());
		currentUserInfo.setLoginTime(new Date());
		userInfoService.update(currentUserInfo);
		model.addAttribute("userInfo", currentUserInfo);
		// 这里要添加cookie
		// 要设置session 拦截器要更新
		Integer cookieTime = Integer.parseInt(cookietime);
		if (cookieTime == 0) {
			return "redirect:/index";
		} else {
			// 新写一个cookie
			Cookie cookie = new Cookie("userCookie", user.getUsername().trim()
					+ "," + currentUser.getPassword());
			cookie.setMaxAge(cookieTime);// 保存cookie的时间
			cookie.setPath("/");// 设置同一服务器下其他服务也能获取
			response.addCookie(cookie);
		}
		return "redirect:/index";
	}

	/*
	 * 用户注销功能　(通过测试)
	 */
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(SessionStatus sessionStatus, HttpServletRequest request,
			HttpServletResponse response) {
		sessionStatus.setComplete();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("userCookie".equals(cookie.getName())) {
					// 后面的参数是cookie的值
					Cookie cookie2 = new Cookie("userCookie", null); // 用新建一个同名cookie，覆盖原来的cookie
					cookie2.setMaxAge(0);
					cookie2.setPath("/");
					response.addCookie(cookie2);
					break;
				}
			}
		}
		return "redirect:/index";
	}

	/**
	 * 用户修改论坛个人信息与论坛设置功能跳转页面(通过测试)
	 * 
	 * @param model
	 * @param currentUser
	 * @return
	 */

	@RequestMapping(value = "/my_userInfo", method = RequestMethod.GET)
	public String myUserInfo(Model model,
			@ModelAttribute("currentUser") User currentUser,
			HttpSession session, String action) {
		// 判断是否要跳转
		if (action != null) {
			return "bbs/my_userInfo_" + action;
		}

		UserInfo currentuserInfo = userInfoService.findByUserId(currentUser
				.getId());
		if (currentuserInfo == null) {
			model.addAttribute("message", "非法操作");
			return "bbs/msg";
		}
		model.addAttribute("userInfo", currentuserInfo);
		return "bbs/userInfo";
	}

	@RequestMapping(value = "/my_msg", method = RequestMethod.GET)
	public String my_msg(Model model, HttpSession session, String action) {
		if (action != null) {
			return "bbs/my_msg_" + action;
		}
		return "bbs/my_msg";
	}

	@RequestMapping(value = "/my_topics", method = RequestMethod.GET)
	public String my_topics(Model model, HttpSession session, String act,
			@ModelAttribute("currentUser") User currentUser) {
		if (act != null) {
			if (act.equals("replied")) {
				model.addAttribute("page", replyService.findPage());
				return "bbs/my_topics" + "_" + act;
			} else if (act.equals("reply")) {
				model.addAttribute("page", replyService.findReplyByUserId(currentUser.getId()));
				return "bbs/my_topics" + "_" + act;
			}

		}
		model.addAttribute("page",
				topicService.findTopicByUserId(currentUser.getId()));
		return "bbs/my_topics";
	}

	@RequestMapping(value = "/my_favors", method = RequestMethod.GET)
	public String my_favors(Model model, HttpSession session) {
		return "bbs/my_favors";
	}

	@RequestMapping(value = "/my_friends", method = RequestMethod.GET)
	public String my_friends(Model model, HttpSession session, String action) {
		if (action != null) {
			return "bbs/my_friends_" + action;
		}
		return "bbs/my_friends";
	}

	@RequestMapping(value = "/my_rights", method = RequestMethod.GET)
	public String my_rights(Model model, HttpSession session, String gid) {
		if (gid != null) {
			return "bbs/my_rights_" + gid;
		}
		return "bbs/my_rights";
	}

	/**
	 * 用户修改论坛个人信息与论坛设置功能(通过测试)
	 * 
	 * @param request
	 * @param model
	 * @param currentUser
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value = "/editUserInfo", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request, Model model,
			HttpSession session, UserInfo userInfo,
			@ModelAttribute("currentUser") User currentUser, String email,
			String nickname) {
		UserInfo currentUserInfo = userInfoService.findByUserId(currentUser
				.getId());
		currentUserInfo.setSex(userInfo.getSex());
		currentUserInfo.setBirthday(userInfo.getBirthday());
		currentUserInfo.setNativePlace(userInfo.getNativePlace());
		// currentUserInfo.setPersonSign(userInfo.getPersonSign());
		// currentUserInfo.setShowHead(userInfo.isShowHead());
		userInfoService.update(currentUserInfo);
		User user = userService.get(currentUser.getId());
		user.setEmail(email);
		user.setNickname(nickname);
		userService.update(user);
		model.addAttribute("userInfo", currentUserInfo);
		model.addAttribute("currentUser", currentUser);
		return "redirect:my_userInfo";

	}

	@RequestMapping(value = "/editUserInfoPersonal", method = RequestMethod.POST)
	public String editUserInfoPersonal(HttpServletRequest request, Model model,
			HttpSession session, UserInfo userInfo,
			@ModelAttribute("currentUser") User currentUser) {
		UserInfo currentUserInfo = userInfoService.findByUserId(currentUser
				.getId());
		currentUserInfo.setShowHead(userInfo.isShowHead());
		currentUserInfo.setHeanImage(userInfo.getHeanImage());
		System.out.println(userInfo.isShowHead());
		System.out.println(userInfo.isShowSign());
		currentUserInfo.setShowSign(userInfo.isShowSign());
		currentUserInfo.setPersonSign(userInfo.getPersonSign());
		userInfoService.update(currentUserInfo);
		model.addAttribute("userInfo", currentUserInfo);
		return "redirect:my_userInfo";
	}

	/**
	 * (通过测试) 列出简单的用户信息
	 * 
	 * @param model
	 * @param currentUser
	 * @return
	 */
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(Model model, String sort, String order) {

		Page<UserInfo> page = null;
		page = userInfoService.findPage();
		SystemContext.removeOrder();
		SystemContext.removeSort();
		model.addAttribute("page", page);
		return "bbs/user_list";
	}

	/**
	 * 我要找到一个方法能避免每一次都校验是否登录 从页面传来userInfo的id查询到相应的userInfo来跳转到相应的用户页面(通过测试）
	 * 
	 * @param userInfoId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/some_userInfo", method = RequestMethod.GET)
	public String some_userInfo(String userInfoId, Model model, Long id,
			HttpSession session,String act) {
		UserInfo currentuserInfo = null;
		if (id != null) {
			currentuserInfo = userInfoService.findByUserId(id);
		} else if (userInfoId != null) {
			currentuserInfo = userInfoService.get(Long.parseLong(userInfoId));
		}
		if (currentuserInfo == null) {
			model.addAttribute("error", "您查询了不存在的用户信息");
			return "bbs/msg";
		}
		if(act!=null&&act.equals("reply")){
			model.addAttribute("flag", act);
			model.addAttribute("replyPage", replyService.findReplyByUserId(currentuserInfo.getUser().getId()));
		}else {
			model.addAttribute("flag", "topic");
			model.addAttribute("topicPage", topicService.findTopicByUserId(currentuserInfo.getUser().getId()));
		}
	
		model.addAttribute("userInfo", currentuserInfo);
		return "bbs/userInfo";
	}

	/**
	 * 用来校验用户名是否被使用了(待测试)
	 * 
	 * @param username
	 * @param out
	 */
	@RequestMapping(value = "/checkusername", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkuserNameExit(String username) {
		if (userService.findByUsername(username) != null) {
			return false;
		} else {
			return true;
		}

	}

	/**
	 * 根据用户名修改 还没想好，还没有写好密码修改的jsp页面
	 * 
	 * @param model
	 * @param currentUser
	 * @return
	 */
	@RequestMapping(value = "/forget_password", method = RequestMethod.GET)
	public String forgetPasswordPage(Model model, HttpSession session,
			String username) {
		if (!this.isLogin(session, "currentUser")) {
			model.addAttribute("message", "您已经登录了喔，怎么会忘记密码呢");
			return "bbs/msg";
		}
		return "bbs/forget_password";

	}

	/**
	 * desc 校验用户忘记密码答案是否正确　如果正确就跳转到重设密码页面
	 * 
	 * @param model
	 * @param currentUser
	 * @param username
	 * @param passwordAnswer
	 * @return
	 */
	@RequestMapping(value = "/checkpasswordAnswer", method = RequestMethod.POST)
	public String checkpasswordAnswer(Model model,
			@ModelAttribute("currentUser") User currentUser, String username,
			String passwordAnswer) {

		return "test/resetPasswordPage";

	}

	/**
	 * desc: 新密码写入数据库，更新用户信息，跳转到从新跳转页面
	 * 
	 * @param model
	 * @param currentUser
	 * @param username
	 * @param passwordAnswer
	 * @return
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(Model model,
			@ModelAttribute("currentUser") User currentUser, String oldpwd1,
			String pwd1) {
		try {
			if (currentUser.getPassword().equals(
					SecurityUtil.md5(oldpwd1 + currentUser.getSalt()))) {
				userService.resetPassword(currentUser.getUsername(), pwd1);
				model.addAttribute("message", "修改密码成功");
				return "bbs/msg";
			} else {
				model.addAttribute("message", "原密码不正确，密码失败");
				return "bbs/msg";
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return "bbs/msg";

	}

	/**
	 * 这个只是临时的替代方法，我打算写一个session的拦截器来实现登录权限校验　以前代码额校验就可以放弃了
	 * 
	 * @param session
	 * @param currentUser
	 * @return
	 */
	private boolean isLogin(HttpSession session, String currentUser) {
		if (session.getAttribute(currentUser) != null) {
			return false;
		}
		return true;
	}

	/**
	 * TODO如何实现trim功能
	 */
}