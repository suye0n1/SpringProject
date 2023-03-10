package com.suyeon.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	//세션: 1.SessionUtils 클래스 만들기 2.컨드롤러에서 매개변수에 HttpServletRequest request 작성하고 3. 사용하고자하는 함수 쓰기
	  public static void setObject(HttpServletRequest request, String key, Object value) {
	      HttpSession session = request.getSession();
	      session.setAttribute(key, value);
	   }
	  //제거하기
	   public static void removeObject(HttpServletRequest request, String key) {
	      HttpSession session = request.getSession();
	      session.removeAttribute(key);
	   }
	   //로그인이 유지되고 있는지
	   public static boolean contains(HttpServletRequest request, String key) {
	      HttpSession session = request.getSession();
	      return session.getAttribute(key) != null;
	   }
	   //값 얻기
	   public static Object getObject(HttpServletRequest request, String key) {
	      HttpSession session = request.getSession();
	      return session.getAttribute(key);
	   }

	
	
}
