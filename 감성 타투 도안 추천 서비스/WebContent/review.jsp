<%@page import="com.model.BbsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel = "stylesheet" href = "css/bootstrap.css"> <!--디자인을 담당한 css 파일 참조-->
<style type="text/css">
	a, a:hover{
		color = #000000;
		text-decoration: none;
	}
</style>    
<%@ include file="header.jsp" %>    

<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">커뮤니티</div>
		<div class="sub_tab">
			<ul>
				<li><a href="review.jsp" class="on">리뷰게시판</a></li>
				<li><a href="notice.jsp">공지사항</a></li>
			</ul>
		</div>
		<div class="page">
		
			<!-- 내용 들어갈 곳 -->
			
	<% 			
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){ 
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
			
			System.out.println("review.jsp 페이지 pageNumber : "+pageNumber);
		}
	%>
	
				<div class="container">
					<div class="row">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								</tr>
							<thead>
							<tbody>
								<%
									BbsDAO bbsDAO = new BbsDAO();
									ArrayList<BbsVO> list = bbsDAO.getList(pageNumber);
									for(int i = 0; i < list.size(); i++){
								%>
							<tr>
								<td><%=list.get(i).getBbsID()%></td>					<!--replace 해준 이유는 내용에서 한줄로 입력되기때문에 특수문자, 띄어쓰기 등등 적용시켜주려고 씀.-->
								<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replace(">","&gt").replace("\n", "<br>")%></a></td>
								<td><%=list.get(i).getUserID()%></td>
								<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
								+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
							</tr>
								<%
									}
								%>
	
							</tbody>
						</table>
						
						<div class="btn_w2">
						   <% if(pageNumber != 1){%>
						      <a href = "review.jsp?pageNumber=<%=pageNumber-1%>" class = "btn22">◀ 이전</a>
						   <% } if(bbsDAO.nextPage(pageNumber + 1) ){%>
						      <a href = "review.jsp?pageNumber=<%=pageNumber+1%>" class = "btn22">다음 ▶</a>
						   <% } %>
						      <a href = "write.jsp" class="btn11">글쓰기</a>
						</div>

				</div>
			</div>
		
			<!-- 내용 들어갈 곳 -->
		</div>
	</div>

	<!--Jquery를 특정한 홈페이지에서 가져옴 애니메이션을 담당함-->
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>	
</body>
<%@ include file="footer.jsp" %>    