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
			 String  pwd = SecurityUtil.md5(user.getPassword().trim()
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
					+ "," +currentUser.getPassword());
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
	@RequestMapping(value = "/editUserInfoPage", method = RequestMethod.GET)
	public String updateUserInfoPage(Model model, HttpSession session) {
		return "bbs/editUserInfo";
	}
	
	@RequestMapping(value = "/changePasswordPage", method = RequestMethod.GET)
	public String changePasswordPage(Model model, HttpSession session) {
		return "bbs/changePassword";
	}

	@RequestMapping(value = "/editPersonalInfoPage", method = RequestMethod.GET)
	public String editPersonalInfoPage(Model model, HttpSession session) {
		return "bbs/editPersonalInfo";
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
			@ModelAttribute("currentUser") User currentUser) {
		UserInfo currentUserInfo = userInfoService.findByUserId(currentUser
				.getId());
		currentUserInfo.setSex(userInfo.getSex());
		currentUserInfo.setBirthday(userInfo.getBirthday());
		currentUserInfo.setNativePlace(userInfo.getNativePlace());
		currentUserInfo.setPersonSign(userInfo.getPersonSign());
		currentUserInfo.setShowHead(userInfo.isShowHead());
		userInfoService.update(currentUserInfo);
		model.addAttribute("userInfo", currentUserInfo);
		return "redirect:myUserInfo";

	}

	/**
	 * (通过测试) 列出简单的用户信息
	 * 
	 * @param model
	 * @param currentUser
	 * @return
	 */
	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	public String listUser(Model model,String sort,String order) {

		Page<UserInfo> page = null;
		page = userInfoService.findPage();
		SystemContext.removeOrder();
		SystemContext.removeSort();
		model.addAttribute("page", page);
		return "bbs/userList";
	}

	/**
	 * 我要找到一个方法能避免每一次都校验是否登录 从页面传来userInfo的id查询到相应的userInfo来跳转到相应的用户页面(通过测试）
	 * 
	 * @param userInfoId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/showUserInfo", method = RequestMethod.GET)
	public String showUserInfo(String userInfoId, Model model,
			HttpSession session) {
		UserInfo currentuserInfo = userInfoService.get(Long
				.parseLong(userInfoId));
		if (currentuserInfo == null) {
			model.addAttribute("error", "您查询了不存在的用户信息");
			return "error/error";
		}
		model.addAttribute("userInfo", currentuserInfo);
		return "bbs/showUserInfo";
	}

	@RequestMapping(value = "/myUserInfo", method = RequestMethod.GET)
	public String myUserInfo( Model model,@ModelAttribute("currentUser") User currentUser,
			HttpSession session) {
		UserInfo currentuserInfo = userInfoService.findByUserId(currentUser.getId());
		if (currentuserInfo == null) {
			model.addAttribute("error", "非法操作");
			return "error/error";
		}
		model.addAttribute("userInfo", currentuserInfo);
		return "bbs/showUserInfo";
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

	@RequestMapping(value = "/uploadHeadImage", method = RequestMethod.POST)
	public String uploadHeadImage() {
		// 还没想好如何异步上传图片
		return null;
	}

	/**
	 * 异步上传头像的页面和方法都还没有写
	 * 
	 * @return
	 */
	@RequestMapping(value = "/uploadHeadImagePage", method = RequestMethod.GET)
	public String uploadHeadImagePage() {
		// 还没想好如何异步上传图片
		return "test/uploadHeadImagePage";
	}

	/**
	 * 根据用户名修改 还没想好，还没有写好密码修改的jsp页面
	 * 
	 * @param model
	 * @param currentUser
	 * @return
	 */
	@RequestMapping(value = "/forgetPasswordPage", method = RequestMethod.GET)
	public String forgetPasswordPage(Model model, HttpSession session,
			String username) {
		if (!this.isLogin(session, "currentUser")) {
			model.addAttribute("error", "您已经登录了喔，怎么会忘记密码呢");
			return "test/error";
		}
		return "test/forgetPasswordPage";

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
			@ModelAttribute("currentUser") User currentUser, String username,
			String passwordAnswer) {

		return "test/login";

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
			return true;
		}
		return false;
	}

	/**
	 * TODO如何实现trim功能
	 */
}
