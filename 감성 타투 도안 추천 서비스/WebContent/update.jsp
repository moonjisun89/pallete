<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.model.BbsVO" %>
<%@ page import = "com.model.BbsDAO" %>
<%@ include file="header.jsp" %>  
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
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //세션에서 로그인한 회원정보를 가져와서 userID에 담아줌
		} 
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0; //게시판 번호 초기화
		if(request.getParameter("bbsID") != null){ 
			bbsID = Integer.parseInt(request.getParameter("bbsID")); //view.jsp에서 bbsID 넘긴것을 받아옴
			System.out.println("업데이트 페이지입니다 bbsID는 "+ bbsID); 
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location href = 'review.jsp'");
			script.println("</script>");
		}
		BbsVO bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location href = 'review.jsp'");
			script.println("</script>");
		}
	%>

		<div class="container">
			<div class="row">
			<form action = "UpdateAction?bbsID=<%=bbsID%>" method = "post" enctype = "multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan = "2" style="background-color: #eeeeee; text-align: center;">게시판 글수정 양식</th>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td><input type = "text" class = "form-control" placeholder = "글 제목" name = "bbsTitle" maxlength = "50" value = "<%=bbs.getBbsTitle()%>"></td>
						</tr>	
						<tr>	
							<td><textarea class = "form-control" placeholder = "글 내용" name = "bbsContent" maxlength = "2048" style = " height: 350px"><%=bbs.getBbsContent()%></textarea></td>
						</tr>
						<tr>
							<td colspan="1" style = "min-height : 200px; text-align : left;">
								<img src="./upload/<%=bbs.getBbsImg() %>" width="10%" />현재사진<%=bbs.getBbsImg() %>
							</td>
						</tr>
					</tbody>
				</table>
				
				<input type = "file" name ="bbsImg"> <!--파일 업로드-->		
				<div class="btn_w2">
					<input type = "submit" class = "btn11" value = "글수정">
				</div>
				
			</form>
			</div>
		</div>
	<!--Jquery를 특정한 홈페이지에서 가져옴 애니메이션을 담당함-->
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>