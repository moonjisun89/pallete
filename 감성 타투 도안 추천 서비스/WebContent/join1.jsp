<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.jsp" %>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">회원가입</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->


		<form name="form" id="form" action = "JoinServiceCon" method = "post">
			<div class="tbl">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" class="ip01" name = "member_name"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<!--name으로 값을 넘길 수 없는 태그 li태그 value로 넘겨야된다.-->
							<ul class="tbl_radio" >
								<li><input type="radio" class="rd_ip" name = "member_gender" value = "남">남</li>
								<li><input type="radio" class="rd_ip" name = "member_gender" value = "여">여</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="ip01" name="member_id" >
							<input type="button" class="tbl_btn" value="중복확인">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="ip01" name = "member_pw"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" class="ip01" name = "member_tel"></td>
					</tr>
					<tr>
						<th>관심타투</th>
						<td>
							<ul class="tbl_radio">
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
			


			<div class="terms_w">
				<div class="terms_box">
					<p class="terms_title">개인정보취급방침</p>
					<div class="terms_list">
						<dl>
						   <dt>1. 개인정보의 수집항목</dt>
						   <dd>
								"회사"는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다.<br />
								"회사"는 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.<br /> 
								1) 회원 가입 시 수집하는 개인정보의 범위 <br />
								이름, 아이디, 비밀번호, 별명(닉네임), 차량정보, 집주소, 휴대전화, 이메일<br />
								2) 개인정보 수집방법 : 홈페이지(회원가입)
						   </dd>
						</dl>
						<dl>
							<dt>2. 개인정보의 수집목적 및 이용목적</dt>
							<dd>
								1) 수집목적<br />
								"회사"는 회원님께 최대한으로 최적화되고 맞춤화된 서비스를 제공하기 위하여 다음과 같은 목적으로 개인정보를 수집하고 있습니다.<br /> 
								- 이름, 아이디, 비밀번호, 이메일주소 : 서비스 이용에 따른 본인 식별 절차에 이용 <br />
								- 이메일주소, 전화번호, 이메일 수신여부, SM 수신여부 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내 <br />
								- 주소, 전화번호 : 경품과 쇼핑 물품 배송에 대한 정확한 배송지의 확보 <br />
								- 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료 <br />
								단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.<br />
								2) 이용목적<br />
								- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br />
								- 회원 관리: 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달<br />
								- 마케팅 및 광고에 활용 : 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
						   </dd>
						</dl>
						<dl>
						   <dt>3. 개인정보의 보유기간, 이용기간 및 파기절차, 방법</dt>
						   <dd>
								① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.<br /> 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br />
								- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.<br />
								&nbsp;1.계약 또는 청약철회 등에 관한 기록 <br />
								&nbsp;보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년<br />

								&nbsp;2. 대금결제 및 재화 등의 공급에 관한 기록 <br />
								&nbsp;보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년<br />

								&nbsp;3. 소비자의 불만 또는 분쟁처리에 관한 기록 <br />
								&nbsp;보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 3년<br />
								- 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 "회사"는 지체없이 그 열람,확인 할 수 있도록 조치합니다.<br />
								- 파기방법 : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
						   </dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="agree"><input type="checkbox" name="agree" value="1"><label for="">개인정보취급방침에 동의합니다.</label></div>
			<div class="btn_w">
				<input type="submit" value=" 회원가입 " class="btn" onClick="location.href='index.jsp'">
			</div>
				</form>

			<!--  -->
		</div>
	</div>
</div>

			<!-- 내용 들어갈 곳 -->
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

<!--아이디 중복체크 기능 만드는 중-->
<script language ="javascript">
fucntion loginCheck(){
	if(document.frm.userid.value.length == 0){
		alert("아이디를 써주세요");
		frm.userid.focus();
		return false;
	}
	if(document.frm.pwd.value == ""){
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	return true;
	
	function idCheck(){
		if(document.frm.userid.value == ""){
			alert("아이디를 입력하여 주십시오."){
			document.frm.userid.focus();
			return;
			}
		}
	}
	
}


</script>	
			


</body>
<%@ include file="footer.jsp" %>