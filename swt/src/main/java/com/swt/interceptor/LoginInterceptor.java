package com.swt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	// interceptor쓰려면 HandlerInterceptorAdapter를 반드시 상속받아야함 
	// 상속이라 오버라이딩 강제는 안 함. 
	// 메서드 실행 전의 동작이면 prehandler 메서드 실행 후의 동작이면  posthandler
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
			String uri = request.getRequestURI();
			String query = request.getQueryString(); // 쿼리스트링으로 받은 데이터도 같이 보내주기 위함
			
			if(query==null||query.equals("null")) {
				query = "";
			} else { // getQueryString()로 가져올 때 ?는 같이 안가져오기 때문에 추가 
				query = "?" + query;
			}
//			/board/list 문제 없음
			
//			로그아웃시
//			/board/create 로그아웃
//			/board/update
//			/create와 /update만 subString으로 잘라야함
			
//			페이지이동을 referer로 하지말고 (referer로 이동하면 ERR_TOO_MANY_REDIRECTS 뜸) 
//			/board/list로 이동해라
			
			int index = referer.lastIndexOf("/"); // 마지막 /가 있는 index 번호(위치값) : 6
			int length = referer.length();	// 전체 길이 : 12
			String url = referer.substring(index, length); // 6~12 : index부터 length까지 가져옴
			log.info("수정된 URL: " + url);
			
			if(url.equals("/create")) {
				response.sendRedirect(request.getContextPath()+"/board/list");
				return false;
			} else if(url.equals("/write")) {
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}
			
			// Login 페이지로 이동
			// FlashMap: 1회성으로 데이터 담아서 보내줌
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "nologin"); 
			flashMap.put("uri", (uri+query));
			log.info(">>>URI: " + (uri+query));
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
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
