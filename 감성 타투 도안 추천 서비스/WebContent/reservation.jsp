<%@page import="com.model.RankingDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">타투샵 예약</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
<%
	RankingDTO pay_list = (RankingDTO) session.getAttribute("pay_list");
	String shop_num = request.getParameter("shop_num");
%>

			
			<div class="sub_title2">1. 예약하기</div>
			<div id="res_left">
			
				<table>
				<%if(pay_list != null){ %>
					<tr>
						<th>타투샵</th>
						<td><%=pay_list.getShop_name() %></td>
					</tr>
					<tr>
						<th>위치</th>
						<td><%=pay_list.getShop_addr() %></td>
					</tr>
					<tr>
						<th>타투종류</th>
						<td><%=pay_list.getShop_kinds() %></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><img src="<%=pay_list.getShop_img1() %>" alt="" width="100%" /></td>
					</tr>
					<%} %>
					<tr>
						<th>날짜 선택</th>
						<td>
							<select class="sct1" >
								<option value="" selected="selected">년 선택</option>
								<option value="2020">2020년</option>
								<option value="2021">2021년</option>
							</select>
							<select class="sct1" >
								<option value="" selected="selected">월 선택</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<select class="sct1" >
								<option value="" selected="selected">일 선택</option>
								<option value="31">31</option>
								<option value="30">30</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>시간 선택</th>
						<td>
							<select class="sct1" >
								<option value="" selected="selected">시간 선택</option>
								<option value="10:00 - 12:00">10:00 - 12:00</option>
								<option value="12:00 - 14:00">12:00 - 14:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><b>￦ 24,000</b></td>
					</tr>
				</table>
			</div>
			
			<div class="sub_title2" style="margin-top:5%;">2. 결제하기</div>
			<div id="res_right">
				<table>
					<tr>
						<th>일반결제</th>
						<td>
							<ul class="tbl_radio">
								<li><input type="radio" name = "card" class="rd_ip" checked>신용카드</li>
								<li><input type="radio" name = "card" class="rd_ip">계좌이체</li>
								<li><input type="radio" name = "card" class="rd_ip">가상계좌</li>
								<li><input type="radio" name = "card" class="rd_ip">휴대폰결제</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>카드사 선택</th>
						<td>
							<select class="sct2">
								<option selected="selected" value="">카드사 선택</option>
								<option value="029">신한카드</option>
								<option value="026">비씨카드</option>
								<option value="031">삼성카드</option>
								<option value="016">국민카드</option>
								<option value="006">하나카드</option>
								<option value="008">하나(구 외환)카드</option>
								<option value="027">현대카드</option>
								<option value="018">NH농협카드</option>
								<option value="022">씨티카드</option>
								<option value="047">롯데카드</option>
								<option value="017">수협카드</option>
								<option value="002">광주카드</option>
								<option value="010">전북카드</option>
								<option value="021">우리카드</option>
								<option value="011">제주카드</option>
							</select>							
						</td>
					</tr>
					<tr>
						<th>할부 선택</th>
						<td>
							<select class="sct2" >
								<option value="" selected="selected">할부선택</option>
								<option value="00">일시불</option>
								<option value="03">03개월</option>
								<option value="06">06개월</option>
								<option value="10">10개월</option>
								<option value="12">12개월</option>
							</select>							
						</td>
					</tr>
				</table>
			</div>
			<div class="agree"><input type="checkbox" name="agree" value="1"><label for="">구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label></div>
			<div class="btn_w">
				<a href="index.jsp" class = "btn" onclick="return confirm_alert(this);">구매하기</a>
				<!-- <input type="button" value=" 결제하기 " class="btn" onClick="location.href='mypage1.jsp'"> -->
			</div>
			<script type="text/javascript">
			function confirm_alert(node){
				return confirm("구매하시겠습니까? 확인 버튼을 누르면 메인페이지로 이동합니다.");
			}
			</script>


			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp" %>    