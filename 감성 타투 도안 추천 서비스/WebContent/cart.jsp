<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.ProductDTO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList" %>

<% 	
	ProductDTO info = (ProductDTO)session.getAttribute("info");
	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> list = dao.pselect();

	request.setCharacterEncoding("UTF-8");
	String p_num = request.getParameter("p_num");
	String p_name = request.getParameter("p_name");
	String p_img = request.getParameter("p_img");
	String p_price = request.getParameter("p_price");
	String p_text = request.getParameter("p_text");
	String p_weight = request.getParameter("p_weight");
	String p_detail = request.getParameter("p_detail");
	
	String p_qty = request.getParameter("p_qty");
	String sum = request.getParameter("sum");
%>

<% 
	int sum2 = Integer.parseInt(sum);
	int price = Integer.parseInt(p_price);
	double price2 = price*0.8;
	String price3 = String.format("%.0f", price2);
	int price4 = Integer.parseInt(price3); // 할인금액
	int totPrice = sum2+2500; // 배송비포함 금액
	
	DecimalFormat df = new DecimalFormat("###,###");
	DecimalFormat totDeformat = new DecimalFormat("###,###");
	String price5 = df.format(price4); // 최종 할인금액
	String totalPrice = totDeformat.format(totPrice); // 배송비합계 최종금액

	String sum3 = df.format(sum2);
%>
<script type="text/javascript">
function confirm_alert(node) {
    return confirm("상품을 삭제하시겠습니까? 확인버튼을 누르면 상품목록으로 이동합니다.");
}
</script>
				

<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">장바구니</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->

						


			<div id="cart_tbl">
				<table>
					<tr>
						<th class="th1"><input type="checkbox" name="all" id="check_all" class="chk"></th>
						<th class="th2">이미지</th>
						<th>상품정보</th>
						<th class="th3">가격</th>
						<th class="th4">수량</th>
						<th class="th5">합계</th>
						<th class="th6">주문/삭제</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="chk"/></td>
						<td><img src="<%= p_img %>" alt="" width="100%" /></td>
						<td><strong><%= p_name %></strong></td>						
						<td><b>￦ <%= price5 %></b></td>
						<td><%= p_qty %></td>
						<td><b>￦ <%= sum3 %></b></td>
						<td>
							<div class="cart_tbl_btn">
								<a href="buy.jsp?p_img=<%=p_img%>&p_name=<%=p_name%>&p_price=<%=sum2%>&p_qty=<%=p_qty%>" class="ctb1">구매하기</a>
								<a href="shop.jsp" onclick="return confirm_alert(this);" class="ctb2">삭제하기</a>
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="7"><div class="cart_tbl_price">상품구매금액 <b>￦ <%= sum3 %></b> + 배송비 ￦ 2,500 = <b>합계 : </b> <strong>￦ <%= totalPrice %></strong></div></th>
					</tr>
				</table>
			</div>
			<div class="btn_w">
				<a class="btn" href="buy.jsp?p_img=<%=p_img%>&p_name=<%=p_name%>&p_price=<%=sum2%>&p_qty=<%=p_qty%>">구매하기</a>
				<a class="btn2" href="shop.jsp">상품목록</a>
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
<%@ include file ="footer.jsp" %> 