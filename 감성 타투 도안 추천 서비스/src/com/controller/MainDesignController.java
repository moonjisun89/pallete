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

@WebServlet("/MainDesignController")
public class MainDesignController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		String kinds_id = request.getParameter("kinds_id"); //이것만 받아옴
		
		DesignDAO dao = new DesignDAO();
		ArrayList<DesignDTO> design_list = new ArrayList<DesignDTO>();
		
		if (kinds_id == null) {
			design_list = dao.ds_select(); // 전체 선택 타투샵 10개 보여주는 메서드
			System.out.println("MainDesignController 세션성공");
		}else {
			design_list = dao.kinds_select(kinds_id); //지역 선택 타투샵 10개 보여주는 메서드
			System.out.println("MainDesignController 세션성공");
		}
		
		if (design_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("design_list", design_list); //design_list를 담음
			System.out.println("MainDesignController 세션성공");
		}else {
			System.out.println("MainDesignController 세션실패");
		}
		response.sendRedirect("index.jsp?"+kinds_id);
	}

}
