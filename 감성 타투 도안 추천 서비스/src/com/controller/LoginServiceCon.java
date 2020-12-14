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
import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//개인회원 로그인
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		
		MemberDAO mDao = new MemberDAO();
		MemberVO mVo = new MemberVO(member_id, member_pw);
		MemberVO mInfo = mDao.login(mVo);
		
		if(mInfo != null) { //개인회원 로그인 성공시
			System.out.println("로그인 성공!");
			session.setAttribute("mInfo", mInfo);
			session.setAttribute("userID", member_id); //게시판에 쓸 것 만듦
		} else {
			System.out.println("로그인 실패!");
		}
		response.sendRedirect("index.jsp");
		
	}

}
