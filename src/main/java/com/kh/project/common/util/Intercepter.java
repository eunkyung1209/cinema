package com.kh.project.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Intercepter extends  HandlerInterceptorAdapter {
	
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
