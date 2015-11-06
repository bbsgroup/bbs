package org.bbs.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base.exception.SessionTimeoutException;
import org.bbs.entity.User;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionTimeoutInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	UserService userService;
	
	 public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除  
     
	    public void setAllowUrls(String[] allowUrls) {  
	        this.allowUrls = allowUrls;  
	    }  


	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	      String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");    
	        if(null != allowUrls && allowUrls.length>=1)  
	            for(String url : allowUrls) {    
	                if(requestUrl.contains(url)) {    
	                    return true;    
	                }    
	            }  
	          
	        User user = (User) request.getSession().getAttribute("currentUser");  
	        if(user != null) {    
	            return true;  //返回true，则这个方面调用后会接着调用postHandle(),  afterCompletion()  
	        }else{  
	        	Cookie[] cookies = request.getCookies();
	        	if (cookies!=null && cookies.length>0){
	        		for (Cookie cookie : cookies) {
	        			if ("userCookie".equals(cookie.getName())){
	        				String name = cookie.getValue();
	        				if(!name.trim().isEmpty()){
	        					String[] ss = name.split(",");//把密码和用户名分开
	        					//判断这个的user 的密码用户名是否合法
	        					if(userService.exsit(ss[0], ss[1])){
	        						User currentUser = userService.findByUsername(ss[0]);
	        						 request.getSession().setAttribute("currentUser", currentUser);
	        						  return true;
	        					}else break;
	        				}else break;
	        			}
					}
	        	}
	            // 未登录  跳转到登录页面  
	            throw new SessionTimeoutException();//返回到配置文件中定义的路径  
	        }  
	    } 
		
		
	}
	


