<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.inl{
display: inline-block;
}

.outer{
padding: 10px 0px;
}

#all{
position: relative;
left: 170px;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
$(function (){
	//지역을 누르면 지역별 영화관 생성
	$("#loc").on("change",function (){
		$("#the").empty();
		var cho = "<option>영화관선택</option>";
		$("#the").append(cho);
		<c:forEach  var="theaters"  items="${theaters}">
			if ($(this).val() == "${theaters.theater_location}") { 
				var str = "<option value='${theaters.theater_name}'>" + "${theaters.theater_name}" + "</option>";
		    	$("#the").append(str);
				} 
		</c:forEach>
	}) //$(".location").click()
$( "#datepicker" ).datepicker();
	
	$("#sum").click(function(){
		//유효성검사
		if($("#loc option:selected").index()==0){
			alert("지역을 선택해주세요")
			return;
		}
		
		if($("#the option:selected").index()==0){
			alert("영화관을 선택해주세요")
			return;
		}
		
		if($("#datepicker").val()==null||$("#datepicker").val()==""){
			alert("분실날짜를 입력해주세요")
			return;
		}
		
		if($("#si").val()==null||$("#si").val()==""){
			alert("시간를 입력해주세요")
			return;
		}
		
		if($("#bun").val()==null||$("#bun").val()==""){
			alert("분을 입력해주세요")
			return;
		}
		
		if($("#type option:selected").index()==0){
			alert("분실물 종류를 선택해주세요")
			return;
		}
		
		if($("#col").val()==null||$("#col").val()==""){
			alert("색상을 입력해주세요")
			return;
		}
		
		if($("#tle").val()==null||$("#tle").val()==""){
			alert("제목을 입력해주세요")
			return;
		}
		
		if($("#con").val()==null||$("#con").val()==""){
			alert("내용을 입력해주세요")
			return;
		}
		
		
		if($("#idval").val()==""||$("#idval").val()==null||$("#idval").val()==undefined){
			alert("로그인을 해주세요")
			return;
		}else{
		alert("분실물문의가 접수되었습니다")
		}
		document.frm.submit();
	})
});


</script>

<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>분실물 게시판</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">고객센터</a>
                            </li>
                        
                            <li  class="last">
                                분실물 문의
                            </li>
                        
                        
                    </ul>
                </div>
                <!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			

<!-- Contents Area -->
<div id="contents">
	<!-- Contents Start -->
	<div class="cols-content">
		
<div class="col-aside">
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=''><a href="support.do">고객센터 메인<i></i></a></li>
            <li class=''><a href="${contextPath}/noticeBoard.do">공지/뉴스<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="${contextPath}/events.do">이벤트<i></i></a></li>
            <li class='on'><a href="${contextPath}/lostItem.do">분실물 문의<i></i></a></li>
            <li class=''><a href="${contextPath}/list.do">자유게시판<i></i></a></li>            
          
            
          
        </ul>
    </div>
  
</div>

<div id="all">
	<div style="width: 800px;">
		<h4>분실물 문의</h4>
		분실물을 등록해주시면 확인 후 신속하게 답변 드리겠습니다<br/>
		빠르고 정확한 답변을 위해 분실물에 대한 정보를 자세히 작성해주세요.<br/>
		단순 분실물 문의 외 문의나 불편사항은 이메일 문의로 작성 부탁드립니다
	</div>
	<div style="width: 800px; height: 700px; margin-top: 20px;">
		<div class="outer">
			<div style="width: 12.5%; position: relative; right: 140px;" class="inl"> 
			이름
			</div>
			<div class="inl" style="position: relative; right: 160px;">
			${memberDTO.member_name}
			</div>
		</div>
		<div class="outer">
			<div class="inl" style="width: 12.5%; position: relative; right: 140px;">
				이메일    
				</div>
				<div class="inl" style="position: relative; right: 160px;">
				 ${memberDTO.member_email}
			</div> 
		</div>
		<hr/>
	<form action="${contextPath}/lostItemPro.do" method="post" name="frm">
		<div class="outer">
			<div style="width: 12.5%; position: relative; right: 140px;" class="inl"> 
				분실장소 
			</div>
			<div class="inl" style="position: relative; right: 160px;">
				<select id="loc" name="lost_loc" required="required">
					<option>지역선택</option>
					<c:forEach items="${location}" var="location">
						<option class="location" value="${location}">${location}</option>
					</c:forEach>
				</select>
				<select id="the" name="lost_theater" required="required">
					<option>영화관선택</option>
				</select>
				<input type="text" value="기타입력란" name="lost_etc" required="required">
			</div>
		</div>
		<hr>
		<div class="outer">
			<div style="width: 12.5%; position: relative; right: 140px;" class="inl">
			분실날짜
			</div>
			<div class="inl" style="position: relative; right: 160px;">
				<input type="text" id="datepicker" name="lost_day" required="required" style="padding-right: 10px">     
				&nbsp;&nbsp;분실 시간(영화시간) <input type="text" style="width: 50px; margin-left: 10px" name="lost_hour" required="required" id="si"/>&nbsp;&nbsp;시<input type="text" style="width: 50px; margin-left: 10px;" name="lost_min" required="required" id="bun"/>&nbsp;&nbsp;분
			</div>
		</div>
		<hr>
		<div class="outer">
			<div style="width: 12.5%; position: relative; left: 17px;" class="inl">
				분실물 종류
			</div>
			<div class="inl" style="width: 25%">
				 <select name="lost_type" required="required" id="type">
				 	<option>분실물 종류 선택</option>
  				 	<option value="핸드폰">핸드폰</option>
  				 	<option value="지갑">지갑</option>
  				 	<option value="가방">가방</option>
				 	<option value="의류">의류</option>
				 	<option value="전자제품">전자제품</option>
				 	<option value="책">책</option>
				 	<option value="우산">우산</option>
				 	<option value="귀금속">귀금속</option>
				 	<option value="기타">기타</option>
				 </select>
			</div>
			<div class="inl">
			 분실물 색상   <input type="text" name="lost_color" required="required" id="col">
			</div>
		</div>
		<hr/>
		<div class="outer">
			<div style="width: 12.5%; position: relative; left: 17px;" class="inl">
				제목 
			</div>
			<hr>
			<div class="inl">
				<input type="text" style="width: 600px" name="lost_title" required="required" id="tle">
			</div>
		</div >
		<div class="outer">
			<div style="width: 12.5%; position: relative; left: 17px;" class="inl">
				내용 
			</div>
			<div class="inl">
			<textarea cols="80" rows="15" name="lost_content" required="required" id="con"></textarea>
			</div>
		</div>
	<input type="reset" value="취소" style="background: green; color: black; width: 80px; cursor: pointer; margin-left: 330px; margin-top: 20px; margin-right: 10px; height: 30px;"> 
	<input type="button" value="등록하기" style="background: pink; color: white; width: 80px;margin-top: 20px; height: 30px;" id="sum"> 
	</form>
	<input type="hidden" value="${memberDTO.member_id}" id="idval">
<div style="position: relative; bottom: 20px;">
	<c:set var="loop_flag" value="false" />
	<c:forEach items="${LostItemDTOList}" var="LostItemDTOList">
		<c:if test="${not loop_flag}">
			<c:if test="${not empty LostItemDTOList.lost_anser}">
				<a href="${contextPath}/lostListAnser.do?lost_id=${LostItemDTOList.lost_id}" style="font-size: 20px">답글확인하기</a>
				<c:set var="loop_flag" value="true" />
			</c:if>
		</c:if>
	</c:forEach>
	</div>
	</div>
	</div>
</body>
</html>