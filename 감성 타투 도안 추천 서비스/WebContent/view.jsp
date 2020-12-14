<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.model.BbsVO" %>
<%@ page import = "com.model.BbsDAO" %>
<%@include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device=width", initial-scale="1"> <!--컴퓨터,핸드폰 해상도에맞게 디자인변경되는 템플릿-->
<link rel = "stylesheet" href = "css/bootstrap.css"> <!--디자인을 담당한 css 파일 참조-->

<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		
		String userID = null; //변수 초기화
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //세션에서 로그인한 회원정보를 userID변수에 담아줌
		} 
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){ 
			bbsID = Integer.parseInt(request.getParameter("bbsID")); //review.jsp에서 넘긴 bbsID를 받아와서 bbsID변수에 담아줌
		}
		if(bbsID == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location href = 'review.jsp'");
			script.println("</script>");
		}
		BbsVO bbs = new BbsDAO().getBbs(bbsID); //bbsID에 해당하는 테이블 정보를 가져와서 bbs에 담아줌
	%>

		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan = "4" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td style = "width : 20%;">글 제목</td>
							<td colspan="3"><%=bbs.getBbsTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="3"><%=bbs.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="3"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
						+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="1" style = "min-height : 200px; text-align : left;"><img src="./upload/<%=bbs.getBbsImg() %>" width="50%" /></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3" style = "min-height : 200px; text-align : left;"><%=bbs.getBbsContent().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replace(">","&gt").replace("\n", "<br>") %></td>
						</tr>
						
					</tbody>
				</table>
				
				<div class="btn_w2">
					<a href = "review.jsp" class = "btn22">목록</a>
					<% if(userID != null && userID.equals(bbs.getUserID())){ %>
						<a href = "update.jsp?bbsID=<%=bbsID%>" class = "btn22">수정</a><!--쿼리스트링으로 bbsID update.jsp로 넘김-->
						<a href = "deleteAction.jsp?bbsID=<%=bbsID%>" class = "btn22">삭제</a><!--쿼리스트링으로 bbsID deleteAction.jsp로 넘김-->
					<% } %>	
					<a href = "write.jsp" class = "btn11">글쓰기</a>
				</div>
			</div>
		</div>
			
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>