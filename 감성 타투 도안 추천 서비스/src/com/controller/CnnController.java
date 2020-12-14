package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CnnController")
public class CnnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String file_name;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
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
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement();
				file_name = multi.getFilesystemName(file);
				//중복된 파일을 업로드 할 경우 파일명이 바뀐다.
				String ori_file_name = multi.getOriginalFileName(file);
				out.print("<br> 업로드 된 파일명 : " + file_name);
				out.print("<br> 원본 파일명 : " + ori_file_name);
				out.print("<hr>");
			}
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e);
		}
		//파이썬 연동하기 file_name을 넘겨줘야한다. 
		//플라스크 서버를 만든다.
		HttpSession session = request.getSession();
		session.setAttribute("file_name2", file_name);
		
		response.sendRedirect("http://localhost:9000/painting?file_name="+file_name); //그림을 서버에 전송하고 이 페이지로 파일명을 가지고 이동함
	}

}
