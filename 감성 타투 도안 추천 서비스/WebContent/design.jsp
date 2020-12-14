<%@page import="com.model.DesignDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.DesignDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%

	DesignDTO designdto = new DesignDTO();
	DesignDAO designDAO = new DesignDAO();
	ArrayList<DesignDTO> design_list = null;
	if(session.getAttribute("design_list")!=null){
		design_list = (ArrayList<DesignDTO>) session.getAttribute("design_list");
	} else{
		design_list = designDAO.ds_select();
	}
	String kindsID = request.getParameter("kinds_id");

	
%>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">타투 카테고리</div>
		<div id="cate_wrap">
			<div class="cate_container">
				<button id = "ALL" class="cate_btn" type="button" onclick="location.href='DesignController'">전체</button>
				<button id = "TA" class="cate_btn" type="button" onclick="location.href='DesignController?kinds_id=TA'">두들</button>
				<button id = "TB" class="cate_btn" type="button" onclick="location.href='DesignController?kinds_id=TB'">라인워크</button>
				<button id = "TC" class="cate_btn" type="button" onclick="location.href='DesignController?kinds_id=TC'">수채화</button>
				<button id = "TD" class="cate_btn" type="button" onclick="location.href='DesignController?kinds_id=TD'">레터링</button>
				<button id = "TE" class="cate_btn" type="button" onclick="location.href='DesignController?kinds_id=TE'">일러스트</button>
			</div> 
			<div class="cate_cont">
				<div class="cate_box on">
					<div class="tattoo_list2">
						<ul>
						<%if(design_list != null){ %>
						<%for(int i =0; i < design_list.size(); i++){%>
							<li>
								<div class="img"><img src="<%=design_list.get(i).getShop_img1() %>" width="100%" /></div>
								<div class="tl_cont2"><b><%=design_list.get(i).getShop_name() %></b><p><%=design_list.get(i).getShop_kinds() %> 전문 '<%=design_list.get(i).getShop_name() %>' 입니다.</p>
								<a onclick="window.open('./Design_DetailController?shop_num=<%=design_list.get(i).getShop_num() %>','타투샵팝업','width=1030,height=520,location=no,status=no,scrollbars=no');" class="btn_layer" layer="1">＋</a></div>
							</li>
						<%}} %>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('.cate_btn').on('click',function(){
			  //버튼 색 제거,추가
			  $('.cate_btn').removeClass('on');
			  $(this).addClass('on')
			  
			  //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
			  var idx = $('.cate_btn').index(this);
			  
			  $('.cate_box').hide();
			  $('.cate_box').eq(idx).show();
			});
		</script>

	</div>
</div>
</body>
<script src = "./design.js"></script>
<%@ include file="footer.jsp" %>  