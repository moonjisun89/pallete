<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%@page import="com.model.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>


<style>
input[type="radio"][id^="c"] {display: none;}
label {display: block;position: relative;cursor: pointer;z-index:1000;}
label:before {top: 0;left: 0;width: 100%;height: 97%;color: white;content: " ";display: block;position: absolute;text-align: center;transition-duration: 0.1s;transform: scale(0);border:10px solid #54349e;box-sizing:border-box;}
label img {height:100%;transition-duration: 0.2s;transform-origin: 50% 50%;z-index:1;}
:checked + label:before {content: "✓";transform: scale(1);}
:checked + label img {transform: scale(0.9);z-index: -11;}
</style>


<% 	
	SurveyDAO dao = new SurveyDAO();
	ArrayList<SurveyDTO> svlist = dao.tselect();

	List<SurveyDTO> sv1 = (List<SurveyDTO>)svlist.subList(0, 5);
	List<SurveyDTO> sv2 = (List<SurveyDTO>)svlist.subList(5, 10);
	List<SurveyDTO> sv3 = (List<SurveyDTO>)svlist.subList(10, 15);
	List<SurveyDTO> sv4 = (List<SurveyDTO>)svlist.subList(15, 20);
	List<SurveyDTO> sv5 = (List<SurveyDTO>)svlist.subList(20, 25);

	// 사용자 ID 불러오기
	String userID = (String)session.getAttribute("userID");
%>



<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">내 취향의 타투를 찾아보세요!</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
			<input type="hidden" id ="myValue" value="<%=userID %>">
			
			<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
			<script type="text/javascript">
				testSendId();
				
				function testSendId(){
					var ididid = $("#myValue").val();
					$.ajax({
					  url: 'http://localhost:9000/?id='+ididid,
					  type: 'get',
					  data: {
					    // 보낼 데이터
					  },
					  dataType: 'json',
					  done: function(response) {
					    // 성공 시 동작
					    alert('성공');
					  },
					  fail: function(error) {
					    // 실패 시 동작
					  },
					  always: function(response) {
					    // 성공하든 실패하든 항상 할 동작
					  }
					});
				}
			</script>

			<form action="SurveyUpdate" method="post">
				<div class="sv_tab_list"><a data-sv_tab="1" class="active"></a><a data-sv_tab="2"></a><a data-sv_tab="3"></a><a data-sv_tab="4"></a><a data-sv_tab="5"></a></div>
				<div class="survey">
					<div class="sv_tab active" data-sv_tab="1">
						<ul id="random_list">
							<%for (int i=0; i<sv1.size(); i++) {%>
								<li><input type="radio" id="c<%=sv1.get(i)%>" name="c1" value="<%= sv1.get(i).getTattoo_id() %>" /><label for="c<%=sv1.get(i)%>"><img src="./img_tt/<%= sv1.get(i).getTattoo_id() %>.jpg" width="100%" /></label><b><%=sv1.get(i).getTattoo_id()%></b></li>
							<% }%>
						</ul>
					</div>
					
					<div class="sv_tab" data-sv_tab="2">
						<ul id="random_list">
							<%for (int i=0; i<sv2.size(); i++) {%>
								<li><input type="radio" id="c<%=sv2.get(i)%>" name="c2" value="<%= sv2.get(i).getTattoo_id() %>" /><label for="c<%=sv2.get(i)%>"><img src="./img_tt/<%= sv2.get(i).getTattoo_id() %>.jpg" width="100%" /></label><b><%=sv2.get(i).getTattoo_id()%></b></li>
							<% }%>
						</ul>
					</div>
					<div class="sv_tab" data-sv_tab="3">
						<ul id="random_list">
							<%for (int i=0; i<sv3.size(); i++) {%>
								<li><input type="radio" id="c<%=sv3.get(i)%>" name="c3" value="<%= sv3.get(i).getTattoo_id() %>" /><label for="c<%=sv3.get(i)%>"><img src="./img_tt/<%= sv3.get(i).getTattoo_id() %>.jpg" width="100%" /></label><b><%=sv3.get(i).getTattoo_id()%></b></li>
							<% }%>
						</ul>
					</div>
					<div class="sv_tab" data-sv_tab="4">
						<ul id="random_list">
							<%for (int i=0; i<sv4.size(); i++) {%>
								<li><input type="radio" id="c<%=sv4.get(i)%>" name="c4" value="<%= sv4.get(i).getTattoo_id() %>" /><label for="c<%=sv4.get(i)%>"><img src="./img_tt/<%= sv4.get(i).getTattoo_id() %>.jpg" width="100%" /></label><b><%=sv4.get(i).getTattoo_id()%></b></li>
							<% }%>
						</ul>
					</div>
					<div class="sv_tab" data-sv_tab="5">
						<ul id="random_list">
							<%for (int i=0; i<sv5.size(); i++) {%>
								<li><input type="radio" id="c<%=sv5.get(i)%>" name="c5" value="<%= sv5.get(i).getTattoo_id() %>" /><label for="c<%=sv5.get(i)%>"><img src="./img_tt/<%= sv5.get(i).getTattoo_id() %>.jpg" width="100%" /></label><b><%=sv5.get(i).getTattoo_id()%></b></li>
							<% }%>
						</ul>
						<div class="controll_wrap">
							<input type="submit" value="전송하기" class="btn">
						</div>
					</div>
					
					<div class="btn_w">
						<a href="#" id="back" class="btn2">Back</a>
						<a href="#" id="next" class="btn">Next</a>
					</div>
				</div>
			</form>

<script>
$('ul#random_list >').map(function(i,t) {
    var s=$(t).siblings();
    s.eq(Math.round(s.length*Math.random())).after(t)
})
</script>


<script>
	document.querySelectorAll(".sv_tab_list a").forEach(function(e) {
	  e.addEventListener("click", function() {
	    // Removing all active
	    document.querySelectorAll(".sv_tab_list a.active, .survey > .sv_tab.active").forEach(function(b) {
	      b.classList.remove("active");
	    });
	
	    // Activating sv_tab
	    e.classList.add("active");
	    var sv_tabid = e.getAttribute("data-sv_tab");
	    document.querySelector(".sv_tab[data-sv_tab='"+ sv_tabid +"']").classList.add("active");
	  });
	})
	
	// Next button
	document.querySelector("#next").addEventListener("click", function() {
	  var sv_tabid = parseInt(document.querySelector(".survey > .sv_tab.active").getAttribute("data-sv_tab"))+1;
	  if(sv_tabid > document.querySelectorAll(".sv_tab_list a").length) sv_tabid = 1;
	  document.querySelectorAll(".sv_tab_list a.active, .survey > .sv_tab.active").forEach(function(b) {
	      b.classList.remove("active");
	  });
	  document.querySelectorAll(".sv_tab_list a[data-sv_tab='"+sv_tabid+"'], .survey > .sv_tab[data-sv_tab='"+sv_tabid+"']").forEach(function(b) {
	      b.classList.add("active");
	    });
	});
	
	
	// Next button
	document.querySelector("#back").addEventListener("click", function() {
	  var sv_tabid = parseInt(document.querySelector(".survey > .sv_tab.active").getAttribute("data-sv_tab"))-1;
	  if(sv_tabid < 1) sv_tabid = document.querySelectorAll(".sv_tab_list a").length;
	  document.querySelectorAll(".sv_tab_list a.active, .survey > .sv_tab.active").forEach(function(b) {
	      b.classList.remove("active");
	  });
	  document.querySelectorAll(".sv_tab_list a[data-sv_tab='"+sv_tabid+"'], .survey > .sv_tab[data-sv_tab='"+sv_tabid+"']").forEach(function(b) {
	      b.classList.add("active");
	    });
	});
</script>


    

			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="footer.jsp" %>  