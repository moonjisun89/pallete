package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DesignDAO;
import com.model.DesignDTO;

@WebServlet("/DesignController")
public class DesignController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8"); //design.jsp에서 값 받아옴. design.jsp에서는 보내는게 없는데.. 어떻게 받아오는거지??
//		String num = request.getParameter("shop_num");
//		String name = request.getParameter("shop_name");
//		String content = request.getParameter("shop_content");
//		String likes = request.getParameter("shop_likes");
//		String addr = request.getParameter("shop_addr");
//		String tel = request.getParameter("shop_tel");
//		String time = request.getParameter("shop_time");
//		String kinds = request.getParameter("shop_kinds");
//		String shop_url = request.getParameter("shop_url");
//		String shop_img1 = request.getParameter("shop_img1");
//		String shop_img2 = request.getParameter("shop_img2");
//		String shop_img3 = request.getParameter("shop_img3");
//		String shop_img4 = request.getParameter("shop_img4");
//		String shop_img5 = request.getParameter("shop_img5");
//		String shop_id = request.getParameter("shop_id");
		String kinds_id = request.getParameter("kinds_id");//이것만 받아옴
		
		DesignDAO dao = new DesignDAO();
		ArrayList<DesignDTO> design_list = new ArrayList<DesignDTO>(); //ArrayList 객체생성했고
		
		if (kinds_id == null) { //kinds_id가 전체가아니라 지역명이면
			design_list = dao.ds_select(); // dao.ds_select를 담고
		}else {
			design_list = dao.kinds_select(kinds_id); //kinds_id가 전체면 kinds_select를 담아. 16개 정보를 매개변수로 보내서.
		}
		
		if (design_list != null) { //그래서 반환된게 null이 아니면 
			System.out.println("성공");
			session = request.getSession();
			session.setAttribute("design_list", design_list); //그걸 세션에 담아.
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("design.jsp?kinds_id="+kinds_id); // design.jsp로 지역명 넘겨서 가. 그런데 키값이 없네 kinds_id 키값추가.
	}

}
