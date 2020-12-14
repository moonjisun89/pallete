package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//세션 객체 생성
		HttpSession session = request.getSession();
		session.removeAttribute("bInfo"); //info 정보 삭제
		session.removeAttribute("mInfo"); //info 정보 삭제
		session.removeAttribute("userID");
		//session.invalidate();//세션에 담긴거 전부 삭제
		
		response.sendRedirect("index.jsp"); //메인페이지로 이동
		
		
	}

}
