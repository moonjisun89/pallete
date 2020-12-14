<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.ProductDTO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList" %>
<% 	
	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> list = dao.pselect();
%>

<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">타투 관리 용품</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->

			<div class="pro_info">
				<em>총 8개의 상품이 있습니다.</em>
				<select>
					<option>신상품순</option>
					<option>낮은가격순</option>
					<option>높은가격순</option>
					<option>인기순</option>
				</select>
			</div>

			<div class="pro_list">
				<ul>
				<!-- 1. ProductDAO와 ArrayList를 가져옴. -->
				<!-- 2. for문으로 list size만큼  -->

				<%for (int i=0; i<list.size(); i++) {%>
					<li>
						<!-- 사진, 이름, 설명글, 가격, 용량  -->
						<a href="detail.jsp?p_img=<%=list.get(i).getP_img()%>&p_name=<%=list.get(i).getP_name()%>&p_text=<%=list.get(i).getP_text()%>&p_price=<%=list.get(i).getP_price()%>&p_weight=<%=list.get(i).getP_weight()%>&p_detail=<%= list.get(i).getP_detail() %>">
							<div class="img2"><img src="<%= list.get(i).getP_img() %>" alt="" width="100%" /></div>
						</a>
						<div class="pro_txt">
							<p><%= list.get(i).getP_name() %></p>
							<span><%= list.get(i).getP_text() %></span>
							<b>￦ 
							<% 
								DecimalFormat df = new DecimalFormat("###,###");
								String totPrice = df.format(list.get(i).getP_price());
							%>
							<%= totPrice %>
							</b>
						</div>
					</li>
				<% }%>
				</ul>
			</div>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="footer.jsp" %>  