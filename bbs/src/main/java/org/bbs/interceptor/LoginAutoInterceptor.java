package org.bbs.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bbs.entity.User;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginAutoInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		User user = (User) request.getSession().getAttribute("currentUser");
		if (user == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if ("userCookie".equals(cookie.getName())) {
						String name = cookie.getValue();
						if (!name.trim().isEmpty()) {
							String[] ss = name.split(",");// 把密码和用户名分开
							// 判断这个的user 的密码用户名是否合法
							if (userService.exsit(ss[0], ss[1])) {
								User currentUser = userService
										.findByUsername(ss[0]);
								request.getSession().setAttribute("currentUser",
										currentUser);
							} else
								break;
						} else
							break;
					}
				}
			}
		}
		return true;
	}

}
