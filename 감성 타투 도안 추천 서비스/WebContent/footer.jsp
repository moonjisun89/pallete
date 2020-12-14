<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="footer">
	<div class="f_mn_w">

		<div class="w1200">
			<ul class="f_menu">
				<li><a href="">회사소개</a></li>
				<li><a href="">입점문의</a></li>
				<li><a href="">이용안내</a></li>
				<li><a href="">이메일무단수집거부</a></li>
			</ul>

			<div class="notice">
				<ul id="ticker_01" class="ticker">
					<li><a href="">‘팔레트’ GRAND OPEN! 타투 첫 후기 이벤트 진행중</a></li>
					<li><a href="">블랙프라이스 EVENT! 친구 데려오면 나는 공짜!</a></li>
				</ul>
			</div>
			<script>
				function tick(){
					$('#ticker_01 li:first').slideUp( function () { $(this).appendTo($('#ticker_01')).slideDown(); });
				}
				setInterval(function(){ tick () }, 5000);
			</script>

		</div>
	</div>

	<div class="w1200">
		<p class="copyright">회사명 : 기가막히조&nbsp;&nbsp;ㅣ&nbsp;&nbsp;사이트명 : 팔레트&nbsp;&nbsp;ㅣ&nbsp;&nbsp;주소 : 광주광역시 남구 송암로60 광주CGI센터 2층<br />
		사업자등록번호 :  123-45-67890&nbsp;&nbsp;ㅣ&nbsp;&nbsp;대표 : 홍길동 &nbsp;&nbsp;ㅣ&nbsp;&nbsp; Tel. 062-123-4567&nbsp;&nbsp;ㅣ&nbsp;&nbsp;Fax. 062-123-4568&nbsp;&nbsp;ㅣ&nbsp;&nbsp;E-mail : abcdefg@naver.com<br />
		Copyright ⓒ 'PALLETE' Co.,Ltd All rights Reserved</p>
	</div>
</div>


<div class="quick_bn" onclick="window.open('https://frogue.danbee.ai/?chatbot_id=c875be1c-4466-410d-b8d6-9c6c826620a6', '단비챗봇', 'width=500, height=600, location=no, status=no, scrollbars=no, toolba=no, left=1300, top=200');"><img src="./img/icon_chat.png" alt="" /></div>

<!-- 컨텐츠 서서히 나타나는 -->
<script>
	$(document).ready(function() {
		$(window).fadeThis({
			speed: 700,//서서히 나타나는 속도
		});
	});
</script>

<!-- 수량 숫자 올라가는 소스 -->
<script>
	$(document).ready(function(){
		$('.input_qty input[ct]').click(function(e){
			e.preventDefault();
			var type = $(this).attr('ct');
			var $count = $(this).parent().children('input.count');
			var count_val = $count.val(); // min 1
			if(type=='m'){
				if(count_val<1){
					return;
				}
				$count.val(parseInt(count_val)-1);
			}else if(type=='p'){
				$count.val(parseInt(count_val)+1);
			}
		});
	});
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