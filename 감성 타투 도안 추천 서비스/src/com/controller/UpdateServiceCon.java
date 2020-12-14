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

@WebServlet("/UpdateServiceCon")
public class UpdateServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO mInfo = (MemberVO)session.getAttribute("mInfo"); //세션 mInfo안에 개인 아이디, 비밀번호가 있음
		
		request.setCharacterEncoding("UTF-8");
		
		// 개인회원 성별, 비밀번호, 연락처, 관심타투, 주소, 우편번호  + 세션에서 받아온 아이디값 총 8개
		String member_gender = request.getParameter("member_gender");
		String member_pw = request.getParameter("member_pw");
		String member_tel = request.getParameter("member_tel");
		String member_recommend = request.getParameter("member_recommend");
		String member_addr = request.getParameter("member_addr");
		String member_post = request.getParameter("member_post");
		String member_id = mInfo.getMember_id();//그거중에서 아이디만빼서 String member_id 에 담아줌
		
		System.out.println(member_gender);
		System.out.println(member_pw);
		System.out.println(member_tel);
		System.out.println(member_recommend);
		System.out.println(member_addr);
		System.out.println(member_post);
		System.out.println(member_id);
		
		MemberDAO mDao = new MemberDAO();
		MemberVO mVo = new MemberVO(member_id, member_pw, member_tel, member_gender, member_recommend, member_addr, member_post);
		int mCnt = mDao.update(mVo);
		
		
		if(mCnt > 0) {
			System.out.println("업데이트 성공!");
		} else {
			System.out.println("업데이트 실패");
			
		}
		response.sendRedirect("index.jsp");
	}

}
