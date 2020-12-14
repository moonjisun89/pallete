<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf8">
</head>
<body>
<%
	String file_name = request.getParameter("file_name"); //플라스크 서버에서 파일 이름을 가져오기
	String[] file_names = file_name.split(",");
	System.out.println("이미지경로"+ file_name);
	System.out.println("1번 "+ file_names[0]);
	System.out.println("2번 "+ file_names[1]);
	System.out.println("3번 "+ file_names[2]);
	System.out.println("4번 "+ file_names[3]);
	System.out.println("5번 "+ file_names[4]);
	
	String file_name2 = (String)session.getAttribute("file_name2");// 원본이미지
%>


<%-- 	<h3>원래 이미지</h3>
	<p>
	<!--원래이미지 받아오는 경로는 다른것도 파라미터 값을 받아와서 반복문을 돌려야한다.-->
		<img src= "./upload/<%=file_name2%>" width=400>
	</p>
	
	<!-- 반복문 ArrayList 같은걸로 담아서 반복문 돌리기-->
	<!--이미지를 다시 플라스크서버에 다시 요청-->
	
	<%for(int i =0; i<5; i++){ %>
	<div style="float: left;">
		<!-- <h3>[차이 :0.19921875-0003.jpg]</h3> -->
		<p>
			<a href=""><img src="http://localhost:9000/draw?img_url=<%=file_names[i]%>" width=400></a>
		</p>
	</div>
	<%} %> --%>
	
	
	
<div id="contents" style="background:#f4f4f4">
	<div class="contents">
		<div class="sub_title s_top">도안 추천 결과</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->

			<div class="tattoo_list3">
				<div class="tattoo_list3_big"><img src="./upload/<%=file_name2%>" width="100%" /></div>
				<ul>
				<%for(int i =0; i<5; i++){ %>
					<li><img src="http://localhost:9000/draw?img_url=<%=file_names[i]%>" width="100%" /></li>
				<%} %>
					<li class="tListBox"><a href="design.jsp">┼</a></li>
				</ul>
			</div>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="footer.jsp" %>