<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">로그인</div>
		<div class="sub_tab">
			<ul>
				<li><a href="login.jsp">개인회원</a></li>
				<li><a href="login2.jsp" class="on">사업자</a></li>
			</ul>
		</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
			<div id="login">
				<form action ="LoginServiceCon2" method = "post">
					<div class="login_ip">
						<input type="text" placeholder="아이디" name = "business_id" >
						<input type="password" placeholder="비밀번호" name = "business_pw">
					</div>
					<div class="login_btn"><input type="submit" value="LOGIN"></div>
					<ul class="login_find">
						<li><a href="">아이디 찾기</a></li>
						<li><a href="">비밀번호 찾기</a></li>
						<li><a href="join.jsp">회원가입하기</a></li>
					</ul>
				</form>
			</div>
			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp" %> 