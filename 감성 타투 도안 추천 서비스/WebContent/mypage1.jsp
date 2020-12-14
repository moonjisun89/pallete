<%@page import="com.model.RankingDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">마이페이지</div>
		<div class="sub_tab">
			<ul>
				<li><a href="mypage1.jsp" class="on">마이페이지</a></li>
				<li><a href="modify1.jsp">정보수정</a></li>
			</ul>
		</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
<%
RankingDTO pay_list = (RankingDTO) session.getAttribute("pay_list"); //reservation.jsp에서 세션으로 불러온 내용 그대로 여기에 불러옴

%>


			<div class="sub_title2">예약 내역</div>
			<div id="detail" style="background:#f4f4f4;box-shadow:none">
				<div class="dtl_img"><img src="<%=pay_list.getShop_img1() %>" width="100%" /></div>
				<div class="dtl_txt">
					<h2><%=pay_list.getShop_name() %></h2>
					<p><%=pay_list.getShop_content() %></p>
					<dl>
						<dt>가격</dt><dd>￦ 24,000</dd>
						<dt>위치</dt><dd><%=pay_list.getShop_addr() %></dd>
					</dl>
					<div class="dtl_price"><span>총 합계</span><b>￦ 24,000</b></div>

					<div class="dtl_btn_w">
						<input type="submit" value="예약수정" class="dtl_btn1">
						<input type="button" value="예약취소" class="dtl_btn2">
					</div>
				</div>
			</div>


			<div class="sub_title2" style="margin-top:5%;">관심 타투</div>
			<div class="tattoo_list2">
				<ul>
					<li>
						<div class="img"><img src="./img/tattoo_1.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="1">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_2.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="2">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_3.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="3">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_4.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="4">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_5.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="5">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_6.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="1">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_7.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="2">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_8.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="3">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_9.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="4">＋</a></div>
					</li>
					<li>
						<div class="img"><img src="./img/tattoo_10.jpg" width="100%" /></div>
						<div class="tl_cont2"><b>타투샵 이름</b><p>장미타투 전문 '홍대타투' 입니다.</p><a href="javascript:;" class="btn_layer" layer="5">＋</a></div>
					</li>
				</ul>
			</div>


			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp" %>