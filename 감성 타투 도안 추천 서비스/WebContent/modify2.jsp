<%@page import="com.model.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">정보수정</div>
		<div class="sub_tab">
			<ul>
				<li><a href="mypage2.jsp">마이페이지</a></li>
				<li><a href="modify2.jsp" class="on">정보수정</a></li>
			</ul>
		</div>
		<%
		//회원가입정보 가져오기
		//info에 아이디 비번만 담겨있는 상태임. 이름은 DB로 가져와야겠다.
			BusinessVO vo = (BusinessVO)session.getAttribute("bInfo");
		%>
		
		<div class="page">
			<!-- 내용 들어갈 곳 -->

		<form action = "UpdateServiceCon2" method = "post"  enctype = "multipart/form-data">
			<div class="tbl">
				<table>
					<tr>
						<th>상호명</th>
						<td><input type="text" class="ip01" name = "business_shop"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=vo.getBusiness_id() %></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="ip01" name = "business_pw"></td>
					</tr>
					<tr>
						<th>SNS주소</th>
						<td><input type="text" class="ip01" name = "business_sns"></td>
					</tr>					
					<tr>
						<th>시술 종류</th>
						<td>
							<ul class="tbl_radio">
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="미니타투">미니타투</li>
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="두들">두들</li>
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="라인워크">라인워크</li>
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="수채화">수채화</li>
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="일러스트">일러스트</li>
								<li><input type="radio" class="rd_ip" name = "business_recommend" value="레터링">레터링</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<select class="sct1" name="business_addr">
								<option>광역/시/도</option>
								<option>서울</option>
								<option>인천</option>
							</select>
							<select class="sct1" name="business_post">
								<option>구/면/읍</option>
								<option>마포구</option>
								<option>광진구</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>샵 소개</th>
						<td><textarea cols="10"
								placeholder="30글자까지 작성 가능합니다. (ex. 홍대타투는 레터링, 미니타투 전문입니다.)" name = "business_content"></textarea></td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td>
							<div class="tbl_file">
								<input type="text" class="up_text" readonly="readonly" value="파일을 업로드하세요.">
								<label><input type="file" class="up_file" title="업로드" name = "business_file1">업로드</label>
							</div>
							<div class="tbl_file">
								<input type="text" class="up_text" readonly="readonly" value="파일을 업로드하세요.">
								<label><input type="file" class="up_file" title="업로드" name = "business_file2">업로드</label>
							</div>
							<div class="tbl_file">
								<input type="text" class="up_text" readonly="readonly" value="파일을 업로드하세요.">
								<label><input type="file" class="up_file" title="업로드" name = "business_file3">업로드</label>
							</div>
							<div class="tbl_file">
								<input type="text" class="up_text" readonly="readonly" value="파일을 업로드하세요.">
								<label><input type="file" class="up_file" title="업로드" name = "business_file4">업로드</label>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<script>
				$('.selector').on('keyup', function() {
					if ($(this).val().length > 50) {
						alert("글자수는 30자로 이내로 제한됩니다.");
						$(this).val($(this).val().substring(0, 50));
					}
				});
			</script>
			<div class="btn_w">
				<input type="submit" value=" 정보수정 " class="btn"
					onClick="location.href='mypage2.jsp'">
			</div>
			</form>
		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp"%>
