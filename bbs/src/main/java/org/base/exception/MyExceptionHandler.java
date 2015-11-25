package org.base.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyExceptionHandler implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception ex) {
		Map<String, Object> model = new HashMap<String, Object>();
		if(ex instanceof SessionTimeoutException){
			model.put("ex", "亲，您还没登录或者太久没动作了，请重新登录吧");
			return new ModelAndView("error/msg", model);
			}
		if(ex instanceof BusinessException){
			model.put("message", ex.getMessage());
			return new ModelAndView("bbs/msg", model);
			}
		model.put("message", ex.getMessage());
		return new ModelAndView("bbs/msg", model);
	}

}
