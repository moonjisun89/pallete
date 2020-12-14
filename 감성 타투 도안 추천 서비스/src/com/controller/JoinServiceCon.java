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

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//개인회원 가입
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_tel = request.getParameter("member_tel");
		String member_name = request.getParameter("member_name");
		String member_gender = request.getParameter("member_gender");
		String member_recommend = request.getParameter("member_recommend");
		String member_addr = request.getParameter("member_addr");
		String member_post = request.getParameter("member_post");
		
		System.out.println(member_id);
		System.out.println(member_pw);
		System.out.println(member_tel);
		System.out.println(member_name);
		System.out.println(member_gender);
		System.out.println(member_recommend);
		System.out.println(member_addr);
		System.out.println(member_post);
		
		MemberDAO mDao = new MemberDAO();
		MemberVO mVo = new MemberVO(member_id, member_pw, member_tel, member_name, member_gender, member_recommend, member_addr, member_post);
		int mCnt = mDao.join(mVo);
		
		if(mCnt > 0) {
			System.out.println("회원가입 성공!");
		} else {
			System.out.println("회원가입 실패!");
		}
		response.sendRedirect("index.jsp");
		
	}

}
