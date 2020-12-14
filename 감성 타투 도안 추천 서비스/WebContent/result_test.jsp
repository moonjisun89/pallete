<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@page import="com.model.*"%>
<%
	// 사용자 ID 불러오기
	String userID = (String)session.getAttribute("userID");	

	SurveyDAO dao = new SurveyDAO();
	String sv1 = dao.sv1(userID);
	String sv2 = dao.sv2(userID);
	String sv3 = dao.sv3(userID);
	String sv4 = dao.sv4(userID);
	String sv5 = dao.sv5(userID);
	
	ArrayList<String> rslist = new ArrayList<String>();
	rslist.add(sv1);
	rslist.add(sv2);
	rslist.add(sv3);
	rslist.add(sv4);
	rslist.add(sv5);
%>




<div id="contents" style="background:#f4f4f4">
	<div class="contents">
		<div class="sub_title s_top">설문 결과</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->



			<div class="tattoo_list4">
				<ul>
					<% for (int i=0; i<rslist.size(); i++){ %>
					<li><img src="./img_tt/<%= rslist.get(i) %>.jpg" width="100%" /></li>
					<%} %>
				</ul>
			</div>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="footer.jsp" %>