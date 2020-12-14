<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">정보수정</div>
		<div class="sub_tab">
			<ul>
				<li><a href="mypage1.jsp">마이페이지</a></li>
				<li><a href="modify1.jsp" class="on">정보수정</a></li>
			</ul>
		</div>
		<%
		//회원가입정보 가져오기
			String userID = (String)session.getAttribute("userID");
			MemberDAO dao = new MemberDAO();
			String name = dao.myPage1(userID);
		%>
		<div class="page">
			<!-- 내용 들어갈 곳 -->


		<form  name="form" id="form" action = "UpdateServiceCon" method = "post">
			<div class="tbl">
				<table>
					<tr>
						<th>이름</th>
						<td><%=name %></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<ul class="tbl_radio">
								<li><input type="radio" class="rd_ip" name = "member_gender" value = "남">남</li>
								<li><input type="radio" class="rd_ip" name = "member_gender" value = "여">여</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=userID%></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" class="ip01" name = "member_pw"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" class="ip01" name = "member_tel"></td>
					</tr>
					<tr>
						<th>관심타투</th>
						<td>
							<ul class="tbl_radio">
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="미니타투">미니타투</li>
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="두들">두들</li>
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="라인워크">라인워크</li>
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="수채화">수채화</li>
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="일러스트">일러스트</li>
								<li><input type="radio" class="rd_ip" name = "member_recommend" value="레터링">레터링</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" class="ip01" placeholder="주소" id="roadFullAddr" name = "member_addr"><input type="button" onClick="goPopup();" class="tbl_btn" value="우편번호">
							<input type="text" class="ip04" placeholder="우편 번호" id="zipNo" name = "member_post">
						</td>
						
					</tr>
				</table>
			</div>
			<div class="btn_w">
				<input type="submit" value=" 정보수정 " class="btn" onClick="location.href='mypage1.jsp'">
			</div>
			</form>


			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>


<!--  -->
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



<!--  -->
</body>
<%@ include file="footer.jsp" %>