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
height: 30px;
font-size: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
$(function(){
	
	
	$("#return").click(function(){
		location.href="./lostItem.do";
	})//click
	
	$("#sub").click(function(){
		var real = confirm("불만사항이 다 처리 되었습니까");
		if(real==true){
		document.frm.submit()
		}
	})//click
	
})//$(function()
</script>

<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>분실물상세보기</title>
</head>
<body>
	<div style="margin-bottom: 30px">
		<div class="inl">
		제목	
		</div>
		<div class="inl" style="width: 777px; text-align: center;">
		${lostItemDTO.lost_title}
		</div>
	</div>
<div>
<table class="main" style="width: 800px; margin: 0px">
	<tr>
		<th width="50">작성자번호</th>
		<th width="200">이메일</th>
		<th width="120">분실위치</th>
		<th width="120">분실극장</th>
		<th width="120">분실날짜</th>
		<th width="120">분실물종류</th>
		<th width="120">분실물색상</th>
		<th width="120">잃어버린시간</th>
		<th width="120">기타</th>
	</tr>
	<tr>
		<td>${lostItemDTO.member_id}</td>
		<td>${lostItemDTO.member_email}</td>
		<td>${lostItemDTO.lost_loc}</td>
		<td>${lostItemDTO.lost_theater}</td>
		<td>${lostItemDTO.lost_day}</td>
		<td>${lostItemDTO.lost_type}</td>
		<td>${lostItemDTO.lost_color}</td>
		<td>${lostItemDTO.lost_hour}시  ${lostItemDTO.lost_min}분</td>
		<td>${lostItemDTO.lost_etc}</td>
	</tr>
</table>
</div>
<div id="textar">
<form action="${contextPath}/lostAnserFin.do" method="post" name="frm">
	<textarea rows="5" cols="110" name="lost_anser" readonly="readonly">
	${lostItemDTO.lost_anser}
	</textarea>
	<input type="hidden" value="${lostItemDTO.lost_id}" name="lost_id">
	<input type="hidden" value="${pageNo}" name="pageNo">
	<div style="text-align: center; width: 800px;">
	<input type="button" value="되돌아가기" style="font-size: 20px; padding: 5px" id="return">
	<input type="button" value="분실물찾기완료" style="font-size: 20px; padding: 5px" id="sub">
	</div>
</form>
</div>
</body>
</html>