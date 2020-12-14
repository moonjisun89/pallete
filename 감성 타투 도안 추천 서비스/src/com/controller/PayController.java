package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.PayDAO;
import com.model.RankingDTO;

@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String shop_num = request.getParameter("shop_num");
		
		RankingDTO pay_list = null;
		PayDAO dao = new PayDAO();
		
		if(shop_num != null) {
			pay_list = dao.pay_select(shop_num);
			System.out.println("PayController 성공");
		}else {
			System.out.println("PayController 실패");
		}
		if (pay_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("pay_list", pay_list);
			System.out.println("PayController 세션성공");
		}else {
			System.out.println("PayController 세션실패");
		}
		response.sendRedirect("reservation.jsp?shop_num=" + shop_num);
	}

}
