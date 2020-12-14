package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DesignDAO;
import com.model.DesignDTO;

@WebServlet("/Design_DetailController")
public class Design_DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String shop_num = request.getParameter("shop_num"); //index.jsp에서 타투에 해당하는 숫자 받아옴
		
		DesignDTO dinfo = null;
		DesignDAO dao = new DesignDAO();
		if(shop_num != null) {
			dinfo = dao.shop_select(shop_num); // 샵의 정보 16개 값을  info에 전체 다 담아서 dinfo에 담아줌
			System.out.println("Desing_DetailController성공");
		}else {
			System.out.println("Desing_DetailController실패");
		}
		
		if(dinfo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dinfo", dinfo);
			System.out.println("Desing_DetailController 세션성공"); //dinfo 값이 담겼으면 그걸 세션에 다시 담아줌 왜???,,
		}else {
			System.out.println("Desing_DetailController 세션실패");
		}
		
		response.sendRedirect("designpop.jsp?shop_num="+shop_num); //designpop으로 num값을 가지고 감. dinfo를 넘겨줘야하는데 쿼리스트링으로 못넘기니까 세션에 담은거구나..
		
	}

}
