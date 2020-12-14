<%@page import="com.model.BusinessVO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>타투 - 새기다.</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<link rel="stylesheet" type="text/css" href="./style.css" />

<link rel="stylesheet" href="./move/normalize.css">
<link rel="stylesheet" href="./move/gridle.css">
<link rel="stylesheet" href="./move/demo.css">
<script src="./move/jquery.min.js"></script>
<script src="./move/jquery.easing.min.js"></script>
<script src="./move/jquery.fadethis.js"></script>

<script type="text/javascript" src="./js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./js/jquery.slide.js"></script><!-- 확대되는 슬라이드 -->
<script type="text/javascript">
	$( function () {
		var slider = $( ".main-banner" ).bxSlider( {   //  타투용품
			auto:'auto',
			autoControls:'true', 
			controls:true,  // 좌우버튼 노출
			speed: 1500,  // 이동 속도를 설정    
			autoDelay:1000, //자동으로 롤링되는 딜레이시간
		    minSlides: 4, //최소 슬라이드 수
			maxSlides: 12, //최대 슬라이드 수
			moveSlides:1,  //1개씩 이동
			slideWidth: 'auto' //슬라이드 안의 넓이, 숫자로도 가능합니다.
		} );
	});
</script>
<script type="text/javascript">
   $( function () {
      var slider = $( ".main-banner2" ).bxSlider( {   // 타투 리뷰
         auto:'auto',
         mode:'fade',
         speed: 800,  // 이동 속도를 설정    
         autoDelay: 300, //자동으로 롤링되는 딜레이시간
             minSlides: 4, //최소 슬라이드 수
         maxSlides: 5, //최대 슬라이드 수
         moveSlides:1,  //1개씩 이동
         autoHover:true  //오버되어있을때 슬라이딩이 멈춤
      } );
   });
</script>

<script type="text/javascript">
	$( function () {
		var slider = $( ".sd1" ).bxSlider( {  //  타투샵 롤링배너
			auto:'auto',
			mode:'fade',
			speed: 800,  // 이동 속도를 설정    
			autoDelay: 300, //자동으로 롤링되는 딜레이시간
		    minSlides: 3, //최소 슬라이드 수
			maxSlides: 12, //최대 슬라이드 수
			moveSlides:1,  //1개씩 이동
			autoHover:true  //오버되어있을때 슬라이딩이 멈춤
		});
	});
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery(".menuBtn").click(function() {
			jQuery(".menuNav").slideToggle();
		});
	});
</script>
</head>
<body>
<%
	MemberVO mInfo = (MemberVO)session.getAttribute("mInfo");
	BusinessVO bInfo = (BusinessVO)session.getAttribute("bInfo");
%>



<div id="header">
	<header>
		<button type="button" class="menuBtn"></button><!-- 모바일/테블릿 메뉴 아이콘 -->
		<div id="head_top">
			<ul>
			<!-- 개인회원 로그인이 되었을 때 -->
				<%if(mInfo != null){ %>
					<li><a href="Logout"><img src="./img/hd_icon5.png" alt="로그아웃" width="100%" /></a></li>
					<li><a href="mypage1.jsp"><img src="./img/hd_icon4.png" alt="마이페이지" width="100%" /></a></li>
				<%} else if(bInfo != null){ %>	
			<!-- 사업자회원 로그인이 되었을 때 -->
					<li><a href="Logout"><img src="./img/hd_icon5.png" alt="로그아웃" width="100%" /></a></li>
					<li><a href="mypage2.jsp"><img src="./img/hd_icon4.png" alt="마이페이지" width="100%" /></a></li>
					<!--로그인이 안되었을 때-->
				<%} else {%> 
					<li><a href="login.jsp"><img src="./img/hd_icon1.png" alt="로그인" width="100%" /></a></li>
					<li><a href="join.jsp"><img src="./img/hd_icon2.png" alt="회원가입" width="100%" /></a></li>
				<%} %>
				
			</ul>
		</div>
		<div id="logo"><a href="./index.jsp">PALLETE</a></div>
		<nav class="menuNav" id="menuNav">
			<ul>
				<li><a href="design.jsp">DESIGN</a></li>
				<li><a href="shop.jsp">SHOP</a></li>
				<li><a href="ranking.jsp">RANKING</a></li>
				<li><a href="review.jsp">COMMUNITY</a></li>
			</ul>
		</nav>
	</header>
</div>