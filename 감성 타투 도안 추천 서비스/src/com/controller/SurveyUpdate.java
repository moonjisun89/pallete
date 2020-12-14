package com.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.RatingDAO;
import com.model.RatingDTO;

@WebServlet("/SurveyUpdate")
public class SurveyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("userID");
		
		String sv_data1 = request.getParameter("c1");
		String sv_data2 = request.getParameter("c2");
		String sv_data3 = request.getParameter("c3");
		String sv_data4 = request.getParameter("c4");
		String sv_data5 = request.getParameter("c5");
		
		ArrayList<String> tattoo_id = new ArrayList<String>();
		tattoo_id.add(sv_data1);
		tattoo_id.add(sv_data2);
		tattoo_id.add(sv_data3);
		tattoo_id.add(sv_data4);
		tattoo_id.add(sv_data5);

		
		RatingDAO dao = new RatingDAO();
		RatingDTO dto = new RatingDTO(member_id, tattoo_id);
		int cnt = dao.sinsert(dto);

		if (cnt > 0) {
			System.out.println("서베이성공");
			System.out.println(sv_data1);
			System.out.println(sv_data2);
			System.out.println(sv_data3);
			System.out.println(sv_data4);
			System.out.println(sv_data5);			
		} else {
			System.out.println("서베이실패;");
		}
		response.sendRedirect("result_test.jsp");
	}		
		
}