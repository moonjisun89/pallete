<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device=width", initial-scale="1"> <!--컴퓨터,핸드폰 해상도에맞게 디자인변경되는 템플릿-->
<link rel = "stylesheet" href = "css/bootstrap.css"> <!--디자인을 담당한 css 파일 참조-->

<%@ include file="header.jsp" %>    
<body>

	<div class="container">
		<div class="row">
		<form action = "WriteAction" method = "post" enctype = "multipart/form-data"> <!--WriteAction으로 넘김 DAO에도 만들어야됨  파일 넘기려면 -->
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan = "2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td><input type = "text" class = "form-control" placeholder = "글 제목" name = "bbsTitle" maxlength = "50"></td>
					</tr>	
					<tr>	
						<td><textarea class = "form-control" placeholder = "글 내용" name = "bbsContent" maxlength = "2048" style = " height: 350px"></textarea></td>
					</tr>
					
				</tbody>
			</table>
			<input type = "file" name ="bbsImg"> <!--파일 업로드-->
			<div class="btn_w2">
				<input type = "submit" class = "btn11" value = "글쓰기">
			</div>
		</form>
		</div>
	</div>
	<!--Jquery를 특정한 홈페이지에서 가져옴 애니메이션을 담당함-->
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
</body>
</html>