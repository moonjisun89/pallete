<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<link rel="stylesheet" href="./css/styles.css" />
<script src="some-path-where-you-dump-the-javascript-libraries/lib/bodyScrollLock.js"></script>
<%@ include file="header.jsp" %>
<div id="contents">
	<div class="contents">
		<div class="sub_title s_top">당신이 원하는 도안을 그려보세요!</div>
		<div class="page">
			
	<!-------------------  그림판 내용 전체 ------------------------->		

	<!-------------------  그림판 내용 전체 ------------------------->		

    <canvas id="jsCanvas" class="canvas" style="position:relative;float:left;margin-left:280px;"></canvas>
    <div class="controls">
<!-- <div class="controls__range">
    <input
     type="range"
     id="jsRange"
     min="0.1"
     max="5.0"
     value="2.5"
     step="0.1"
   /> 
 </div>-->
      
      
<style>
#controls__btns_wrap{
  position:relative !important;float:left !important;
  width:100%;margin-left:80px;
 }

#controls__btns_wrap p{
	position:relative !important;
	float:left !important;
	width:100% !important;
	margin-top:10px;
}
.controls__btns button, input {
  position:relative;float:left;
  all: unset;
  cursor: pointer;
  background-color: #54349e;
  border-radius: 40px;
  width: 140px;
  height: 40px;
  text-align: center;
  box-shadow: 6px 6px 10px 1px #ccc;
  color: #fff;
  text-transform: uppercase;
}

.btn_colorss{
  position:relative;float:left;width:100%;

}

.btn_colorss form{
  position:relative;float:left;;
  width:144px;height:44px;

}
.btn_colorss label{
  position:absolute;left:0;top:0;
  background-color: #54349e;
  border-radius: 40px;
  width: 140px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  box-shadow: 6px 6px 10px 1px #ccc;
  color: #fff;
  text-transform: uppercase;
  cursor:pointer;
}

.btn_colorss input[type="file"] {position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }

</style>


    <div id="controls__btns_wrap">
      <div class="controls__btns" style="float:left !important;">
        <p><button id="jsMode">FILL</button></p>
        <p><button id="jsSave">SAVE</button></p>

	  <div class="btn_colorss">
		<form action="CnnController" method="post" encType="multipart/form-data">
			<p><label><input type="file" class="up_file"  name="paint" >UPLOAD</label></p>
		  </div>    
		  <div class="btn_colorss">
			<p style="margin-top:16px !important"><label><input type="submit" class="up_file" value="전송하기" name="business_file1" style="border:none;"></label></p>
		  </div>   
	  </form> 
    </div>
    </div>



<!-- <form action="CnnController" method = "post" encType ="multipart/form-data">
<input type = "file"  name = "paint">
<input type = "submit" class="controls__btns">
</form> -->


      <div id="jsColors" class="controls__colors" style="margin :100px 0 0 -230px;">
        <div
          class="controls__colors jsColor"
          style="background-color:black;"
        ></div>
        <div
          class="controls__colors jsColor"
          style="background-color:white"
        ></div>
 
      </div>
    </div>
    <script src="./js/app.js"></script>

		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp" %>