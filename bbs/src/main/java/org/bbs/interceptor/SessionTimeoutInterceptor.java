package org.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base.exception.SessionTimeoutException;
import org.bbs.entity.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionTimeoutInterceptor extends HandlerInterceptorAdapter {
	
	
	 public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除  
     
	    public void setAllowUrls(String[] allowUrls) {  
	        this.allowUrls = allowUrls;  
	    }  


	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	      String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");    
	        System.out.println(requestUrl);  
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
	            // 未登录  跳转到登录页面  
	            throw new SessionTimeoutException();//返回到配置文件中定义的路径  
	        }  
	    } 
		
		
	}
	


