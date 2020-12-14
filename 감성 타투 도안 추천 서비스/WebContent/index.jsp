<%@page import="com.model.RankingDAO"%>
<%@page import="com.model.RankingDTO"%>
<%@page import="com.model.DesignDAO"%>
<%@page import="com.model.DesignDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BbsVO"%>
<%@page import="com.model.BbsDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.ProductDTO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@include file = "header.jsp" %>
<%
	//게시판
	int pageNumber = 1;
	BbsDAO bbsDAO = new BbsDAO();
	BbsVO vo = new BbsVO();
	ArrayList<BbsVO> bbslist = new ArrayList<BbsVO>(); 
	bbslist = bbsDAO.getList(pageNumber); 
	
//상품목록  
    ProductDAO dao = new ProductDAO();
    ArrayList<ProductDTO> prolist = dao.pselect();
    
//타투샵 desgin_list DTO ranking_list 

	DesignDTO designdto = new DesignDTO();
	DesignDAO designDAO = new DesignDAO();
	ArrayList<DesignDTO> design_list = null;
	if(session.getAttribute("design_list")!=null){
		design_list = (ArrayList<DesignDTO>) session.getAttribute("design_list");
	} else{
		design_list = designDAO.ds_select();
	}
	String kindsID = request.getParameter("kinds_id");

	
	RankingDTO rankingdto = new RankingDTO();
	RankingDAO rankingDAO = new RankingDAO();
	ArrayList<RankingDTO> ranking_list = null;
	if(session.getAttribute("ranking_list")!=null){
		ranking_list = (ArrayList<RankingDTO>) session.getAttribute("ranking_list");
	} else{
		ranking_list = rankingDAO.select_all();
	}
	String shopID = request.getParameter("shop_id");
%>

<script type="text/javascript" src="./js/jquery.slide.js"></script><!-- 확대되는 슬라이드 -->
<div class="slider_w">
	<div class="slide_ment">
		<h1 class="s_left">타투는 하나의 예술작품입니다.</h1>
		<h1 class="s_right">기억하고 싶은 것들을 아름답게 새깁니다.</h1>

		<a href="cnn.jsp" class="main_Btn1">‘이미지’ 분석 타투 찾기</a>
		<a href="test.jsp" class="main_Btn2">‘취향’ 분석 타투 찾기</a>
	</div>

	<div id="slideshow-banner">
		<ul>
			<li class="slideshow-item"><img src="./img/slide1.jpg" alt="" width="100%" /></li>
			<li class="slideshow-item"><img src="./img/slide2.jpg" alt="" width="100%" /></li>
		</ul>
		<div class="arrow_w">
			<div id="controller-left"><img src="./img/arrow_left.png" alt="" width="100%" /></div>
			<div id="controller-right"><img src="./img/arrow_right.png" alt="" width="100%" /></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#slideshow-banner').slide({
		cdTime : 5000      //이미지 바뀌는 속도
	});
</script>


<div id="main_icon">
	<div  class="tattoo_cate">
		<ul>
			<li><a href="design.jsp"><div class="img"><img src="./img/tattoo_4.jpg" width="100%" /></div></a><p>두들</p></li>
			<li><a href="design.jsp"><div class="img"><img src="./img/tattoo_5.jpg" width="100%" /></div></a><p>라인워크</p></li>
			<li><a href="design.jsp"><div class="img"><img src="./img/tattoo_8.jpg" width="100%" /></div></a><p>수채화</p></li>
			<li><a href="design.jsp"><div class="img"><img src="./img/tattoo_9.jpg" width="100%" /></div></a><p>레터링</p></li>
			<li><a href="design.jsp"><div class="img"><img src="./img/tattoo_3.jpg" width="100%" /></div></a><p>일러스트</p></li>
		</ul>
	</div>
</div>


<div id="main_doan">
	<div class="w1200">
		<div class="main_title font">지금 가장 HOT한 타투는?</div><a href="design.jsp" class="more">more →</a>
		<div id="cate_wrap">
			<div class="cate_container">
				<button id = "ALL" class="cate_btn" type="button" onclick="location.href='MainDesignController'">전체</button>
				<button id = "TA" class="cate_btn" type="button" onclick="location.href='MainDesignController?kinds_id=TA'">두들</button>
				<button id = "TB" class="cate_btn" type="button" onclick="location.href='MainDesignController?kinds_id=TB'">라인워크</button>
				<button id = "TC" class="cate_btn" type="button" onclick="location.href='MainDesignController?kinds_id=TC'">수채화</button>
				<button id = "TD" class="cate_btn" type="button" onclick="location.href='MainDesignController?kinds_id=TD'">레터링</button>
				<button id = "TE" class="cate_btn" type="button" onclick="location.href='MainDesignController?kinds_id=TE'">일러스트</button>
			</div> 
		<div class="tattoo_list">
			<ul>
			<%for(int i=0; i < design_list.size(); i++){%>
				<li class="s_bottom"><a onclick="window.open('./Design_DetailController?shop_num=<%=design_list.get(i).getShop_num() %>','타투샵팝업','width=1030,height=520,location=no,status=no,scrollbars=no');" class="btn_layer2" layer="1">
					<div class="img"><img src="<%=design_list.get(i).getShop_img1() %>" width="100%" /></div>
					<div class="tl_cont"><b><%=design_list.get(i).getShop_name() %></b><span><%=design_list.get(i).getShop_likes() %></span><p><%=design_list.get(i).getShop_content() %></p></div>
				</a></li>
			<%}%>
				</ul>
				</div>
		</div>
	</div>
</div>


<div id="main_rolling">
	<div class="main_title font">예쁜 내 타투, 오래 유지하기!</div>
	<div class="arrow_rolling">
		<div class="layout">
			<a href="shop.jsp" class="more">more →</a>
			<ul class="main-banner">
				<%for (int i=0; i<prolist.size(); i++) {%>
				   <li><a href="detail.jsp?p_img=<%=prolist.get(i).getP_img()%>&p_name=<%=prolist.get(i).getP_name()%>&p_text=<%=prolist.get(i).getP_text()%>&p_price=<%=prolist.get(i).getP_price()%>&p_weight=<%=prolist.get(i).getP_weight()%>&p_detail=<%= prolist.get(i).getP_detail() %>">
				      <div class="img"><img src="<%= prolist.get(i).getP_img() %>" alt="" width="100%" /></div>
				      <div class="tr_txt"><b><%= prolist.get(i).getP_name() %></b><p><%= prolist.get(i).getP_text() %></p></div>
				   </a></li>
				<% } %>
			</ul>
		</div>
	</div>
</div>


<!--여기서부터 안나옴-->
<div id="main_shop">
	<div class="w1200">
		<div class="main_title font">우리집 근처 타투샵</div><a href="ranking.jsp" class="more">more →</a>

		<div id="tab_wrap">
			<div class="tab_container"><!--값을 넘겨주는게 아니고 페이지만 이동함-->
				<a id="AA" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AA'">서울</a> 
				<a id="AB" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AB'">인천</a>
				<a id="AC" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AC'">대구</a>
				<a id="AD" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AD'">부산</a>
				<a id="AE" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AE'">광주</a>
				<a id="AF" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AF'">대전</a>
				<a id="AG" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AG'">울산</a>
				<a id="AH" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AH'">경기도</a>
				<a id="AI" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AI'">강원도</a>
				<a id="AJ" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AJ'">충청도</a>
				<a id="AK" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AK'">전라도</a>
				<a id="AL" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AL'">경상도</a>
				<a id="AM" class="tab_btn" type="button" onclick="location.href='MainRankingController?shop_id=AM'">제주도</a>
			</div> 
			<div class="tab_cont">
				<div class="tab_box on s_bottom">
					<ul class="local_tattoo">
			<%if (ranking_list != null){ %>
			<%for (int i = 0; i < ranking_list.size(); i++){ %>
						<li>
							<a onclick="window.open('./Shop_DetailController?shop_num=<%=ranking_list.get(i).getShop_num() %>','타투샵팝업','width=1030,height=520,location=no,status=no,scrollbars=no');" class="btn_layer2" layer="10">
								<div class="img"><img src="<%=ranking_list.get(i).getShop_img1() %>" width="100%" /></div>
								<div class="local_txt">
									<b><%=ranking_list.get(i).getShop_name() %></b>
									<p><%=ranking_list.get(i).getShop_content() %></p>
									<span><%=ranking_list.get(i).getShop_addr() %></span>
								</div>
							</a>
						</li>
					<%}} %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
		<script>
			$('.tab_btn').on('click',function(){
			  //버튼 색 제거,추가
			  $('.tab_btn').removeClass('on');
			  $(this).addClass('on')
			  
			  //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
			  var idx = $('.tab_btn').index(this);
			  
			  $('.tab_box').hide();
			  $('.tab_box').eq(idx).show();
			});

			//무슨기능?
			$(".tab_container>a").on('click', function(e) {
				$(".tab_btn on").val($(this).attr('value'));
				e.preventDefault();

			});
		</script>
		
<div id="main_review">
	<div class="arrow_rolling2">
		<div class="layout">
			<div class="main_title font">직접 쓰는 리얼한 타투 후기</div><a href="review.jsp" class="more">more →</a>
			<ul class="main-banner">
				<%for(int i =0; i < 4; i++){ %>
				<li>
					<div class="img_w"><a href ="view.jsp?bbsID=<%=bbslist.get(i).getBbsID()%>"><img src="./upload/<%=bbslist.get(i).getBbsImg() %>" alt="" width="100%" /></a></div>
					<div class="rv_txt"><b><%=bbslist.get(i).getBbsTitle() %></b><p><%=bbslist.get(i).getBbsContent() %></p></div>
					<button onclick="javascript:;" class="btn_layer2 rv_btn" layer="1">타투샵 바로가기</button>
				</li>
				<%} %>

			</ul>
		</div>
	</div>
</div>
</body>
<script src = "design.js"></script>
<script src = "mainranking.js"></script>
<%@include file = "footer.jsp" %>