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

@WebServlet("/MainRankingController")
public class MainRankingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String shop_id = request.getParameter("shop_id"); //index.jsp 에서 shop_id 받아옴
		
		RankingDAO dao = new RankingDAO();
		ArrayList<RankingDTO> ranking_list = new ArrayList<RankingDTO>();
		
		if (shop_id != null) {
			System.out.println("MainRankingController성공");
			ranking_list = dao.main_rk_select(shop_id);
		}else {
			System.out.println("MainRankingController실패");
		}
		if (ranking_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("ranking_list", ranking_list); // 값이 담겼으면 세션에 담는다.
			System.out.println("MainRankingController 세션성공");
		}else {
			System.out.println("MainRankingController 세션실패");
		}
		response.sendRedirect("index.jsp?"+shop_id);
	}

}
