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

import com.model.BbsDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateAction")
public class UpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8"); //어떤 타입으로 출력할 것인지 명시
		PrintWriter out = response.getWriter();//getWriter() 출력스트림. 응답할 정보를 갖고 있는 객체에 출력스트림을 써서 out 객체에 담았다.
		
        String userID = null; //userID 변수 null값으로 초기화
		HttpSession session = request.getSession();
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");//세션에서 로그인한 회원 아이디 가져와서 userID 변수에 담기
		}
		
		int bbsID = 0; //게시판 숫자 초기화
		if(request.getParameter("bbsID") != null){  
	    	bbsID = Integer.parseInt(request.getParameter("bbsID")); //update.jsp에서 bbsID를 받아와서 bbsID에 담아줌 (게시판 수정시에 게시판번호 필요)
	    	System.out.println("bbsID는 "+ bbsID); //잘넘어왔는지 확인용
	    }
		
		ArrayList<String> list = new ArrayList<String>(); //파일명이 안담아져서 ArrayList에 담기위한 객체생성
		 
		//손댈것 없음
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
			
			// multpart/form-data로 값을 넘길경우 request.getParameter쓰면 null뜸  multi.getParameter로 받아줘야함.
			String bbsTitle = null; // null로 초기화
			String bbsContent = null; // null로 초기화
			bbsTitle = multi.getParameter("bbsTitle"); // write.jsp에서 넘긴 값을 받아옴
			bbsContent = multi.getParameter("bbsContent"); // write.jsp에서 넘긴 값을 받아옴
			
			// 파일이 있으면 서버에 업로드하는 부분
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement();
				String file_name = multi.getFilesystemName(file);
				//중복된 파일을 업로드 할 경우 파일명이 바뀐다.
				String ori_file_name = multi.getOriginalFileName(file);
				System.out.println("<br> 업로드 된 파일명 : " + file_name);
				System.out.println("<br> 원본 파일명 : " + ori_file_name);
				System.out.println("<hr>");
				
				list.add(file_name); //파일명을 list변수에 담기 이유는 dao.write에 매개변수로 보내주기  위함. getParameter로 파일명을 받아오려했으나 null값이떠서 이 방법사용
			}
			
			//콘솔로 값이 넘어오는지 확인하는 부분
			System.out.println("bbsTitle : " + bbsTitle);
			System.out.println("bbsContent : " + bbsContent);
			System.out.println("userID : " +userID);
			System.out.println("list.get(0) : " + list.get(0));
	        
			//로그인이 안되었을 시 글쓰기를 못하게 조건 거는 부분
			if(userID == null) {
				out.println("<script>");
	    		out.println("alert('로그인을 하세요.')");
	    		out.println("location.href= 'login.jsp'");
	    		out.println("</script>");
			}else{
				//게시글 제목이나 내용이 안적혀있으면 입력안된사항이있습니다 ...인데 
		    	if(bbsTitle == null || bbsContent == null){  //아무것도 입력안해도 그냥 글쓰기가 되는 상태임.. DB에서 못하게 막아야될듯 싶다..
		    		out.println("<script>");
		    		out.println("alert('입력이 안된 사항이 있습니다.')");
		    		out.println("history.back()");
		    		out.println("</script>");
		    	 } else {
				        BbsDAO bbsDAO = new BbsDAO();
				        int result = bbsDAO.update(bbsID, bbsTitle, bbsContent, list.get(0));
			            if(result == -1){
			                out.println("<script>");
			                out.println("alert('글수정에 실패했습니다..')");
			                out.println("history.back()");
			                out.println("</script>");
			            }
			            else{
			                out.println("<script>");
			                out.println("alert('글 수정 성공!')");
			                out.println("location.href= 'review.jsp'");
			                out.println("</script>");
		                }
		    	 }
			}
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e);
		}
		
	}

}