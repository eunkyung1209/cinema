package com.kh.project.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 인터셉터 사용 방법
	// 1. 클래스를 하나 만든다
	// 2. 인터셉터 기능이 구현된 인터페이스를 구현하거나, 클래스를 상속 받는다.
	// 인터페이스 - HandlerInterceptor
	// 클래스 - HandlerInterceptorAdapter
	// 공통 메소드 : preHandle() : 컨트롤러 실행 전 실행,  postHandle() : 실행 되고 jsp 가기 전 실행, atferComplate() : jsp 가고 나서 실행
	// 원하는 시점에 동작하는 메소드를 재정의 한다.

	//인터페이스 구현 - 설명 보류
	//public class LoginInterceptor implements HandlerInterceptor { 
	//}

	//클레스 상속
	public class Intercepter extends HandlerInterceptorAdapter {

	   // 로그인 여부를 검사 (컨트롤 들어 가기 전에 거쳐 가는 관문)
	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

	      HttpSession session = request.getSession();
	      
	      Object result = session.getAttribute("loginInfo");

	      if (result == null) {

	         response.sendRedirect("/member/login");
	         
	         // false -> (이프문에 걸렸다) 정해준 경로로 가라response.sendRedirect("/member/login");
	         return false;

	      }
	      
	      // true -> (위 이프문에 안걸렸다) 컨트롤에서 요청한 경로로 가세요.
	      return true;

	   }

	}


