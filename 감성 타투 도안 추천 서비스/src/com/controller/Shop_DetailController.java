package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.RankingDTO;
import com.model.shop_detailDAO;

@WebServlet("/Shop_DetailController")
public class Shop_DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String shop_num = request.getParameter("shop_num"); //샵을 클릭해서 그 숫자를 받아오고
		
		RankingDTO rinfo = null;
		shop_detailDAO dao = new shop_detailDAO(); 
		
		if(shop_num != null) {
			System.out.println("Shop_DetailController성공");
			rinfo = dao.shop_select(shop_num); //그 번호에 관련된 샵 13개 정보를 받아서 
		}else {
			System.out.println("Shop_DetailController실패");
		}
		
		if(rinfo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("rinfo", rinfo); //세션에 shop_select에는 13개 정보가 담김.
			System.out.println("Shop_DetailController 세션성공");
		}else {
			System.out.println("Shop_DetailController 세션실패");
		}
		
		response.sendRedirect("pop.jsp?num="+shop_num); //pop.jsp로 간다.
		
	}
}