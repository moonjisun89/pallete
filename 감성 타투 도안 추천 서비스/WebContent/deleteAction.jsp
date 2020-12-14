<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.BbsVO" %>
<%@ page import="com.model.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
    	String userID = null;
    	if(session.getAttribute("userID") != null){
    		userID = (String)session.getAttribute("userID");
    	}
	    if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.)");
			script.println("location href = 'login.jsp'");
			script.println("</script>");
	    }
	    int bbsID = 0; //게시판 숫자 초기화
	    if(request.getParameter("bbsID") != null){
	    	bbsID = Integer.parseInt(request.getParameter("bbsID")); // 게시판 수정시에 게시판 번호를 받아옴
	    	System.out.print("bbsID는 :" + bbsID);
	    	System.out.print("bbsID는 :" + bbsID);
	    }
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location href = 'review.jsp'");
			script.println("</script>");
		} //해당 bbsID에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다. 
		
		BbsVO bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location href = 'review.jsp'");
			script.println("</script>");
		}
        BbsDAO bbsDAO = new BbsDAO();
        int result = bbsDAO.delete(bbsID); //기능 작동
        System.out.print(result);
           if(result == -1){
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('글 삭제에 실패했습니다..')");
               script.println("history.back()");
               script.println("</script>");
           }
           else{
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('글 삭제에 성공했습니다')");
               script.println("location.href='review.jsp'");
               script.println("</script>");
              }
        
	    
    %>
</body>
</html> 
