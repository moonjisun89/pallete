package com.Front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String URI = request.getRequestURI(); //전체경로
		String path = request.getContextPath(); //프로젝트
		String resultURI = URI.substring(path.length()+1); //원하는 경로만 잘라내기
		
		
		if(resultURI.equals("JoinServiceCon.do")) {
			
		}else if(resultURI.equals("JoinServiceCon2.do")) {
			
		}else if(resultURI.equals("LoginServiceCon.do")) {
			
		}else if(resultURI.equals("LoginServiceCon2.do")) {
			
		}else if(resultURI.equals("LoginServiceCon.do")) {
			
		}else if(resultURI.equals("LoginServiceCon.do")) {
			
		}else if(resultURI.equals("LoginServiceCon.do")) {
			
		}else if(resultURI.equals("LoginServiceCon.do")) {
			
		}else if(resultURI.equals("UpdateAction.do")) {
			
		}else if(resultURI.equals("WriteAction.do")) {
			
		}
		
	}

}
