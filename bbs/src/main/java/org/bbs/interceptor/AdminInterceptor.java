package org.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base.exception.BusinessException;
import org.bbs.entity.User;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute("currentUser");
		if (user == null) {
			throw new BusinessException("请先登录");
		}

		if (user.getGroup().getId() == 6) {
			return true;
		} else {
			throw new BusinessException("你所在的用户组没有权限访问");
		}
	}

}
