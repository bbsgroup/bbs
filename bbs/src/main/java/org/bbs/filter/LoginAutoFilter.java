package org.bbs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.bbs.entity.User;
import org.bbs.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class LoginAutoFilter implements Filter {

	UserService userService;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/**
	 * 自动登录 从cookie中获取
	 * 
	 * @param request
	 * @param arg1
	 * @param arg2
	 * @throws IOException
	 * @throws ServletException
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		User user = (User) req.getSession().getAttribute("currentUser");
		if (user == null) {
			Cookie[] cookies = req.getCookies();
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
								req.getSession().setAttribute("currentUser",
										currentUser);
							} else
								break;
						} else
							break;
					}
				}
			}
		}
		this.doFilter(request, arg1, arg2);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ServletContext context = filterConfig.getServletContext();

		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(context);

		userService = (UserService) ctx.getBean("userService");

	}

}
