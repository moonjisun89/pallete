<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.ProductDTO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList" %>
<% 	
	ProductDTO info = (ProductDTO)session.getAttribute("info");
	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> list = dao.pselect();

	request.setCharacterEncoding("UTF-8");
	String p_name = request.getParameter("p_name");
	String p_img = request.getParameter("p_img");
	String p_price = request.getParameter("p_price");
	String p_qty = request.getParameter("p_qty");
%>

<% 
	double price = Integer.parseInt(p_price);

	String price3 = String.format("%.0f", price);
	int price4 = Integer.parseInt(price3); // 할인금액
	int totPrice = price4+2500; // 배송비포함 금액
	
	DecimalFormat df = new DecimalFormat("###,###");
	DecimalFormat totDeformat = new DecimalFormat("###,###");
	String price5 = df.format(price4); // 최종 할인금액
	
	int q_price3 = Integer.parseInt(p_qty);
	int q_price2 = price4/q_price3;
	String q_price22 = df.format(q_price2);
	
	String totalPrice = totDeformat.format(totPrice); // 배송비합계 최종금액
%>

<script type="text/javascript">
function confirm_alert(node) {
    return confirm("구매하시겠습니까? 확인버튼을 누르면 메인페이지로 이동합니다.");
}
</script>



<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">구매하기</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->

		<form name="form" id="form" >
			<div id="cart_tbl" style="padding-bottom:5%;">
				<table>
					<tr>
						<th class="th2">이미지</th>
						<th>상품정보</th>
						<th class="th3">판매가</th>
						<th class="th4">수량</th>
						<th class="th5">합계</th>
					</tr>
					<tr>
						<td><img src="<%= p_img %>" alt="" width="100%" /></td>
						<td><strong><%= p_name %></strong></td>
						<td><b>￦ <%= q_price22 %></b></td>
						<td><%= p_qty %></td>
						<td><b>￦ <%= price5 %></b></td>
					</tr>
					<tr>
						<th colspan="7"><div class="cart_tbl_price">상품구매금액 <b>￦ <%= price5 %></b> + 배송비 ￦ 2,500 = <b>합계 : </b> <strong>￦ <%= totalPrice %></strong></div></th>
					</tr>
				</table>
			</div>

			
			<div class="sub_title2">1. 배송정보</div>
			<div class="tbl" style="padding-bottom:5%;">
				<table>
					<tr>
						<th>받는 사람</th>
						<td><input type="text" class="ip01" ></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" class="ip01" ></td>
					</tr>
					<tr>
						<th>받는 주소</th>
						<td>
							<input type="text" placeholder="주소" id="roadFullAddr" class="ip01" ><input type="button" onClick="goPopup();" class="tbl_btn" value="우편번호">
							<input type="text" placeholder="우편 번호" id="zipNo" class="ip04">
						</td>
					</tr>
					<tr>
						<th>배송메시지</th>
						<td><input type="text" class="ip01" ></td>
					</tr>
				</table>
			</div>


			<div class="sub_title2">2. 결제정보</div>
			<div class="tbl">
				<table>
					<tr>
						<th>일반결제</th>
						<td>
							<ul class="tbl_radio">
								<li><input type="radio" class="rd_ip" checked>신용카드</li>
								<li><input type="radio" class="rd_ip">계좌이체</li>
								<li><input type="radio" class="rd_ip">가상계좌</li>
								<li><input type="radio" class="rd_ip">휴대폰결제</li>
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
				<a href="index.jsp" class="btn" onclick="return confirm_alert(this);">구매하기</a>
			</div>
			</form>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("./jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr; //도로명주소 전체(포맷)
	/* 	document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr; */
		document.form.zipNo.value = zipNo; //우편번호
/* 		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList; */
		/** 2017년 2월 추가제공 **/
/* 		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno; */
		/** 2017년 3월 추가제공 **/
/* 		document.form.emdNo.value = emdNo; */
		
}

</script>



<%@include file = "footer.jsp" %>