package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BusinessDAO;
import com.model.BusinessVO;

@WebServlet("/LoginServiceCon2")
public class LoginServiceCon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사업자 회원 로그인
		String business_id = request.getParameter("business_id");
		String business_pw = request.getParameter("business_pw");
		
		BusinessDAO bDao = new BusinessDAO();
		BusinessVO bVo = new BusinessVO(business_id, business_pw);
		BusinessVO bInfo = bDao.login(bVo);              
		
		
		if(bInfo != null) { //개인회원 로그인 성공시
			HttpSession session = request.getSession();
			System.out.println("로그인 성공!");
			session.setAttribute("bInfo", bInfo);
			session.setAttribute("userID", business_id);
		} else {
			System.out.println("로그인 실패!");
		}
		
		response.sendRedirect("index.jsp");
	}

}
