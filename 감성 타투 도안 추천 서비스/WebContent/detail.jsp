<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
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
	
	int price = Integer.parseInt(p_price);
	double price2 = price*0.8;
	String price3 = String.format("%.0f", price2);
	int price4 = Integer.parseInt(price3); // 할인금액
	int totPrice = price4+2500; // 배송비포함 금액
	
	DecimalFormat df = new DecimalFormat("###,###");
	DecimalFormat totDeformat = new DecimalFormat("###,###");
	String price5 = df.format(price4); // 최종 할인금액
	String totalPrice = totDeformat.format(totPrice); // 배송비합계 최종금액
	
%>

<script type="text/javascript">
   function cart(){
	   document.frm.submit();
   }
</script>
<body onload="init();">



<div id="contents" style="background:#f4f4f4">
	<div class="contents">
		<div class="sub_title s_top">타투 관리 용품</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->





<form name="frm" action="cart.jsp">
	<input type="hidden" name="p_img" value="<%=p_img%>">
	<input type="hidden" name="p_name" value="<%=p_name%>">
	<input type="hidden" name="p_price" value="<%=p_price%>">
	<input type="hidden" name="p_qqty" value="<%=p_price%>">
	

			<div id="detail">
				<div class="dtl_img">
					<div id="zoom_img2"><img src="<%= request.getParameter("p_img") %>"></div>
				</div>

				<div class="dtl_txt">
					<h2><%= request.getParameter("p_name") %></h2>
					<p><%= request.getParameter("p_text") %></p>
					<dl>
						<dt>판매가</dt><dd><span style="text-decoration:line-through">￦ <%= request.getParameter("p_price") %></span></dd>
						<dt>할인가</dt><dd>￦ <%=price5 %></dd>
						<dt>용량/중량</dt><dd><%= request.getParameter("p_weight") %></dd>
						<dt>수량</dt>
						<dd>
							<div class="input_qty" style="float:right">
								<input type="text" name="p_qty" value="1" size="3" onchange="change();">
								<input type="button" value="" onclick="add();" class="qty_up">
								<input type="button" value="" onclick="del();"class="qty_down">	
							</div>
						</dd>
					</dl>
					<div class="dtl_price">
						<span>총 합계</span><b>￦ <input type="hidden" name="sell_price" value="<%= price4 %>"><input type="text" name="sum" class="dtl_won" readonly></b>
					</div>

					<div class="dtl_btn_w">
						<a class="dtl_btn1" onclick="cart()">장바구니</a>
						<a class="dtl_btn2" href="shop.jsp">상품목록</a>
					</div>
				</div>

				<div class="dtl_cont">
					<img src="<%= request.getParameter("p_detail") %>" width="100%" />
					
				</div>
			</div>

</form>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<!-- https://www.blueb.co.kr/?c=1/9&cat=Input%252FButton&p=3&uid=1874 -->

<script language="JavaScript">
	
	var sell_price;
	var amount;
	
	function init () {
		sell_price = document.frm.sell_price.value;
		p_qty = document.frm.p_qty.value;
		document.frm.sum.value = sell_price;
		change();
	}
	
	function add () {
		hm = document.frm.p_qty;
		sum = document.frm.sum;
		hm.value ++ ;
	
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function del () {
		hm = document.frm.p_qty;
		sum = document.frm.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sell_price;
			}
	}
	
	function change () {
		hm = document.frm.p_qty;
		sum = document.frm.sum;
	
			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}
</script>
<%@ include file="footer.jsp" %>