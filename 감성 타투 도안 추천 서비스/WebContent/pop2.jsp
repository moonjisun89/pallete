<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./style.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 팝업창 -->
		
		<div class="layer_cont" style="padding:40px;">

			<div id="tt_detail">
				<div id="slide1">
					<img src="./img_tt/102.jpg" width="100%" />
				</div>
				<div class="tt_dtl_txt">
					<h2>라라타투</h2>
					<p>일러스트타투 전문 홍대타투입니다.</p>
					<dl>
						<dt class="ts1">주소</dt><dd>서울 광진구</dd>
						<dt class="ts2">연락처</dt><dd>010-1234-5678</dd>
						<dt class="ts3">운영시간</dt><dd>10:00 ~ 20:00</dd>
						<dt class="ts4">시술종류</dt><dd>일러스트, 수채화</dd>
					</dl>
					<a href="https://www.instagram.com/" target="_blank">SNS 바로가기</a>
					<a onclick="window.open('http://mjs89.dothome.co.kr/web2/reservation.html');" target="_blank" style="background:#54349e">예약하기</a>
					
  					 
					
				</div>
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