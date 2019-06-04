package com.swt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	// interceptor쓰려면 HandlerInterceptorAdapter를 반드시 상속받아야함 
	// 상속이라 오버라이딩 강제는 안 함. 
	
	// 메인액션 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// session 체크, 값이 있으면 통과, 
		// 없으면 돌려보냄(원래페이지로 가서 모달창 키고 에러메시지 출력)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userid")==null) {
			log.info(">>>>Session값 없음, 이전 페이지 이동");
			String referer = request.getHeader("referer");	// 원페이지 주소를 알려 줌 
			response.sendRedirect(referer + "?message=nologin");
			return false;
		}else {
			log.info(">>>>Session값 있음, 액션 페이지 이동");
			return true;
		}
		
		
		
//		return false; => 돌아가게 함(못 들어 감 돌아가게 만듦)
//		return true; => 통과! 메인액션 실행
	}

	// 메인액션 실행 된 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
