<%@page import="com.model.RankingDTO"%>
<%@page import="com.model.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">마이페이지</div>
		<div class="sub_tab">
			<ul>
				<li><a href="mypage2.jsp" class="on">마이페이지</a></li>
				<li><a href="modify2.jsp">정보수정</a></li>
			</ul>
		</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
			<%
			
				BusinessVO vo = (BusinessVO)session.getAttribute("bInfo");//bInfo에서 받아와서 사진 띄워주기
				BusinessDAO dao = new BusinessDAO(); //객체 생성
				BusinessVO photo = dao.fileSelect(vo);
				
				System.out.print("테스트");
				System.out.print(photo.getBusiness_file1());
				System.out.print(photo.getBusiness_file2());
				System.out.print(photo.getBusiness_file3());
				System.out.print(photo.getBusiness_file4());
				
				RankingDTO pay_list = (RankingDTO) session.getAttribute("pay_list"); //mypage1에 담긴 세션 그대로 2로 옮겨옴
				
			%>



			<div class="sub_title2">예약관리</div>
			<div id="cart_tbl">
				<table>
					<tr>
						<th class="th1"><input type="checkbox" name="all" id="check_all" class="chk"></th>
						<th class="th2">이미지</th>
						<th class="th2">신청자</th>
						<th>상품정보</th>
						<th class="th3">판매가</th>
						<th class="th6">주문/삭제</th>
						<th class="th6">합계</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="chk"/></td>
						<td><a href=""><img src="<%=pay_list.getShop_img1() %>" alt="" width="100%" /></a></td>
						<td>문지순</td>
						<td><strong>발뒤꿈치 비행기 - 3cm<%=pay_list.getShop_content() %></strong></td>
						<td><b>￦ 24,000</b></td>
						<td>
							<div class="cart_tbl_btn">
								<input type="button" value="예약확인" class="ctb1">
								<input type="button" value="삭제하기" class="ctb2" >
							</div>
						</td>
						<td rowspan="2"><div class="cart_tbl_price"><strong>￦ 24,000</strong></div></td>
					</tr>
					<!-- <tr>
						<td><input type="checkbox" class="chk"/></td>
						<td><a href=""><img src="./img/tattoo_14.jpg" alt="" width="100%" /></a></td>
						<td>basisi1989</td>
						<td><strong>이텔릭체 레터링 - 11cm</strong></td>
						<td><b>￦ 107,000</b></td>
						<td>
							<div class="cart_tbl_btn">
								<input type="button" value="예약확인" class="ctb1">
								<input type="button" value="삭제하기" class="ctb2" >
							</div>
						</td>
					</tr> -->
				</table>
			</div>


			<div class="sub_title2" style="margin-top:5%">타투이미지 관리</div>
			<div class="tattoo_list2">
				<ul>
					<li><img src="./upload/<%=photo.getBusiness_file1() %>" width="100%" /></li>
					<li><img src="./upload/<%=photo.getBusiness_file2() %>" width="100%" /></li>
					<li><img src="./upload/<%=photo.getBusiness_file3() %>" width="100%" /></li>
					<li><img src="./upload/<%=photo.getBusiness_file4() %>" width="100%" /></li>
				</ul>
			</div>






			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<!-- 전체 체크 -->
<script>
      $( document ).ready( function() {
        $( '#check_all' ).click( function() {
          $( '.chk' ).prop( 'checked', this.checked );
        } );
      } );
</script>
</body>
<%@ include file="footer.jsp" %>    