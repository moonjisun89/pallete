<%@page import="com.model.RankingDAO"%>
<%@page import="com.model.RankingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<%

	RankingDTO rankingdto = new RankingDTO();
	RankingDAO rankingDAO = new RankingDAO();
	ArrayList<RankingDTO> ranking_list = null;
	if(session.getAttribute("ranking_list")!=null){
		ranking_list = (ArrayList<RankingDTO>) session.getAttribute("ranking_list");
	} else{
		ranking_list = rankingDAO.select_all();
	}
%>


<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">타투샵 랭킹</div>
		<div id="cate_wrap">
			<div class="cate_container">
			
				<a id="ALL" class="cate_btn" type="button" onclick = "location.href='RankingController'">전체</a>
				<a id="AA" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AA'">서울</a>
				<a id="AB" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AB'">인천</a>
				<a id="AC" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AC'">대구</a>
				<a id="AD" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AD'">부산</a>
				<a id="AE" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AE'">광주</a>
				<a id="AF" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AF'">대전</a>
				<a id="AG" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AG'">울산</a>
				<a id="AH" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AH'">경기도</a>
				<a id="AI" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AI'">강원도</a>
				<a id="AJ" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AJ'">충청도</a>
				<a id="AK" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AK'">전라도</a>
				<a id="AL" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AL'">경상도</a>
				<a id="AM" class="cate_btn" type="button" onclick="location.href='RankingController?shop_id=AM'">제주도</a>
			</div>
			<div class="cate_cont">
				<div class="cate_box on">
					<div class="rank">
					
						<%if(ranking_list != null){ %>
						<%for(int i = 0; i < ranking_list.size(); i++){ %>
						<div class="rank_w">
							<h5><%=(i+1)+"등 " + ranking_list.get(i).getShop_name()%></h5>
							<span class="rank_map"><%=ranking_list.get(i).getShop_addr() %></span>
							<span><%=ranking_list.get(i).getShop_likes()%></span>
							<p><%=ranking_list.get(i).getShop_content() %></p>
							
							<a onclick="window.open('./Shop_DetailController?shop_num=<%=ranking_list.get(i).getShop_num() %>','타투샵팝업','width=1030,height=520,location=no,status=no,scrollbars=no');">＋</a>
						</div>
						
						<%}} %>
						
					</div>
				</div>
			</div> 


		</div>
	</div>
</div>


<script src = ranking.js></script>
<%@ include file="footer.jsp"%>