package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BusinessDAO;
import com.model.BusinessVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateServiceCon2")
public class UpdateServiceCon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		BusinessVO bInfo = (BusinessVO)session.getAttribute("bInfo"); //세션 bInfo안에 사업자 아이디 비밀번호가 있음 아이디만 꺼내 쓸것임.
		
		BusinessDAO bDao = null;
		BusinessVO bVo = null;
		ArrayList<String> list = new ArrayList<String>(); //파일명이 안담아져서 객체생성
		
		PrintWriter out = response.getWriter();
		String savePath = "upload"; //파일 저장 위치
		int uploadFileSizeLimit = 5 * 1024 * 1024; //5MB 파일 첨부 
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, 
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			
			// 사업자회원  상호명, 비밀번호, sns주소, 시술종류, 주소, 우편번호, 샵소개, 첨부파일  + 세션에서 받아온 아이디값 총 9개
			// multpart/form-data로 값을 넘길경우 request.getParameter쓰면 null뜸  multi. getParameter로 받아줘야함.
			String business_shop = multi.getParameter("business_shop");
			String business_pw = multi.getParameter("business_pw");
			String business_sns = multi.getParameter("business_sns");
			String business_recommend = multi.getParameter("business_recommend");
			String business_addr = multi.getParameter("business_addr");
			String business_post = multi.getParameter("business_post");
			String business_content = multi.getParameter("business_content");
			String business_id = bInfo.getBusiness_id();//그거중에서 아이디만빼서 String business_id 에 담아줌
			
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement();
				String file_name = multi.getFilesystemName(file);
				//중복된 파일을 업로드 할 경우 파일명이 바뀐다.
				String ori_file_name = multi.getOriginalFileName(file);
				System.out.println("<br> 업로드 된 파일명 : " + file_name);
				System.out.println("<br> 원본 파일명 : " + ori_file_name);
				System.out.println("<hr>");
				
				list.add(file_name); //파일명을 담기
			}
			
			bDao = new BusinessDAO();
			bVo = new BusinessVO(business_shop, business_id, business_pw, business_sns, business_recommend, business_addr, business_post, business_content, list.get(0), list.get(1), list.get(2), list.get(3));
			int bCnt = bDao.update(bVo);
			
			if(bCnt > 0) {
				System.out.println("업데이트 성공!");
			} else {
				System.out.println("업데이트 실패!");
			}
			
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e);
		}
		
		
		response.sendRedirect("index.jsp");
	}
}
