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
<title>이벤트 생성하기</title>

<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/event/createEventForm.css" />

<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>

  var cnt=0;
  //파일추가 버튼 클릭시 호출 - 동적으로 input type="file"
  //최초의 첫  이미지파일은 메인이미지용이 된다. 최소한 1개의 이미지파일은 첨부
  //2번째 이후이미지파일은 서브이미지용이 된다
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br/>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br/>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	cnt++;
  }
  
  //매개변수 obj에는 user가 폼을 통해 입력한 정보(상품정보+이미지파일등)가 담긴 form 
  function fn_add_new_event(obj){
	    //user가 입력한 첫번째 이미지파일명
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){//첫번째 파일이 존재하면
			 obj.submit();
		 }else{//첫번째 파일이 존재하지않으면  alert창띄운다
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
</script> 
</head>
<body>

<h1 id="createEvent_h1">Create Event</h1>

<form  id="createEvent_Form" action="${contextPath}/createEvent.do"
		  method="post"  enctype="multipart/form-data">
	<table id="createEvent_table">
		<tr>
			<td>카테고리</td>
			<td><select id="createEvent_category" name="event_category">
						<option value="제휴/할인" selected="selected">제휴/할인</option>
						<option value="영화/예매">영화/예매</option>
						<option value="SPECIAL">SPECIAL</option>
				</select><!--나중에 수정하기 -->
			</td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" id="createEvent_title" name="event_title" size="50"></td>
		</tr>
		<tr>
			<td>시작일</td>
			<td><input type="date" class="createEvent_date" name="event_start"></td>
		</tr>
		<tr>
			<td>종료일</td>
			<td><input type="date" class="createEvent_date" name="event_end"></td>
		</tr>
		<tr>
			<td>이벤트 이미지</td>
			<td> <span id="createEvent_imageSpan"> 처음으로 등록하는 사진은 무조건  main사진입니다. </span>
				<input type="button"  value="파일 추가" onClick="fn_addFile()" id="createEvent_addBtn"/><br>
				 <div id="d_file">
				 </div>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea  id="createEvent_textarea" name="event_content"></textarea></td>
		</tr>	
	</table>
	
		<div id="createEvent_endBtns">
				<input  type="button" value="등&nbsp;록" id="createEvent_submitBtn" onClick="fn_add_new_event(this.form)"/>
				<button type="button" value="back" id="createEvent_backBtn" onClick="location='<%=request.getContextPath()%>/adEventList.do'">목&nbsp;록</button>
		</div>
	
	
</form>
</body>
</html>