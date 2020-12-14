package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DesignDTO;
import com.model.RankingDAO;
import com.model.RankingDTO;

@WebServlet("/RankingController")
public class RankingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String shop_id = request.getParameter("shop_id");// ranking.jsp에서 shop_id 받아옴
		
		RankingDAO dao = new RankingDAO();
		ArrayList<RankingDTO> ranking_list = new ArrayList<RankingDTO>();
		
		if (shop_id == null) {
			ranking_list = dao.select_all(); //전체 선택시 10개 보여줌
		}else {
			ranking_list = dao.rk_select(shop_id); // 지역 선택시 10개 보여줌
		}
		
		if (ranking_list != null) {
			System.out.println("성공");
			session = request.getSession();
			session.setAttribute("ranking_list", ranking_list); //세션에 ranking_list에 담음
		}else {
			System.out.println("실패");
		}
		
		response.sendRedirect("ranking.jsp?shop_id="+shop_id); //ranking.jsp로 shop_id 가지고 다시 이동
		
	}

}
