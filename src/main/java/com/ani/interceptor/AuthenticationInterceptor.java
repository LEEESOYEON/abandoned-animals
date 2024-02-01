package com.ani.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {

	// session 객체를 가져옴
	HttpSession session = request.getSession();
	// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
	Object obj = session.getAttribute("login");

	if (obj == null) {
		// 로그인이 안되어 잇는 상태이므로 로그인 폼으로 다시 돌려보냄
		response.sendRedirect("memberlogin");
		return false;
	}
	// preHandle의 return은 컨트롤러 요청 url로 가도 되냐 안되냐를 허가하는 의미
	// 따라서 true로 하면 컨트롤러 url로 가게 됨.
	return  true; //super.preHandle(request, response, handler);

}

public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
	super.postHandle(request, response, handler, modelAndView);
}

}
