<%@page import="com.model.DesignDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./style.css" />
<link rel="stylesheet" href="./move/normalize.css">
<link rel="stylesheet" href="./move/gridle.css">
<link rel="stylesheet" href="./move/demo.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	

	DesignDTO dinfo = (DesignDTO)session.getAttribute("dinfo");
	String num = request.getParameter("shop_num");
%>
<!-- 팝업창 -->
		<%if (dinfo != null){ %>
		<div class="layer_cont" style="padding:40px;">

			<div id="tt_detail">
				<div id="slide1">
					<div class="sd_w">
						<ul class="sd1">
							<li><img src="<%=dinfo.getShop_img1() %>" width="100%" /></li>
							<li><img src="<%=dinfo.getShop_img2() %>" width="100%" /></li>
							<li><img src="<%=dinfo.getShop_img3() %>" width="100%" /></li>
							<li><img src="<%=dinfo.getShop_img4() %>" width="100%" /></li>
							<li><img src="<%=dinfo.getShop_img5() %>" width="100%" /></li>
						</ul>
					</div>
				</div>
				<div class="tt_dtl_txt">
					<h2><%=dinfo.getShop_name() %></h2>
					<p><%=dinfo.getShop_content() %></p>
					<dl>
						<dt class="ts1">주소</dt><dd><%=dinfo.getShop_addr() %></dd>
						<dt class="ts2">연락처</dt><dd><%=dinfo.getShop_tel() %></dd>
						<dt class="ts3">운영시간</dt><dd><%=dinfo.getShop_time() %></dd>
						<dt class="ts4">시술종류</dt><dd><%=dinfo.getShop_kinds() %></dd>
					</dl>
					<a href="https://www.instagram.com/" target="_blank">SNS 바로가기</a>
					<a onclick="window.open('./PayController?shop_num=<%=dinfo.getShop_num() %>');" target="_blank" style="background:#54349e">예약하기</a>
				</div>
				<%} %>
			</div>
			</div>


<!-- 레이어팝업 -->
<script>
	$(function () {
	  // 레이어 display none 상태
	  $(".layer_bg, .layer_wrap").hide();
	  //레이어팝업 위치 지정 function 만들기
	  function layer_position(){
		var win_W = $(window).width();
		var win_H = $(window).height();
		$(".layer_wrap").css({'left':(win_W)/2, 'top':(win_H)/2});
	  };
	  //레이어팝업 open 상태 function 만들기
	  function layer_open(no){
		$(".layer_wrap[layer="+no+"]").fadeIn();
		$(".layer_bg").fadeIn();
		layer_position();
		//레이어 영역 외 바탕화면 클릭시 화면 닫기
		$(".layer_bg").click(function (e) {
		  if(!$(".layer_wrap").has(e.target).length){
			layer_close();
		  };
		});
	  };
	  //레이어팝업 close 상태 function 만들기
	  function layer_close(){
		$(".layer_wrap, .layer_bg").fadeOut();
	  };
	  //링크 클릭시 해당 레이어팝업 호출
	  
	 
		  	$(".btn_layer, .btn_layer2").click(function () {
				var no = $(this).attr("layer");
				console.log("check");
				console.log(no);
				layer_open(no);
		   }); 
		     
		   
/* 	 $(".btn_layer, .btn_layer2").click(function() {
		
		var no = $(this).attr("layer");
		var val = $(this).attr("value");
		
				$.ajax({
					url : 'Shop_DetailController',
					data : 'num='+ val,
					success : function(result){
						
						console.log("no 확인 : " + no);
						
						layer_open(no);
						
					}
					
					
				});
				
				
		   });  */   
		  
	  //닫기 버튼 클릭시 레이어 닫기
	  $(".btn_close").click(function () {
		layer_close();
	  });
	  //반응형 대응 - 레이어 위치 잡기
	  $(window).resize(function () {
		layer_position();
	  });
	})
</script>

<script>
	$( ".thumb li a" ).click(function() {
		var address = $(this).children("img");
		$("#zoom_img img").attr("src",address.attr("src")).attr("alt",address.attr("alt"));
		$(this).parent().addClass("on").siblings().removeClass("on");
		return false;
	});
</script>


</body>
</html>