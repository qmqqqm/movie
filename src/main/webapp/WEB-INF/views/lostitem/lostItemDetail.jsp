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

<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>분실물상세보기</title>
</head>
<body>
	<div style="margin-bottom: 30px; margin-top: 30px;">
		<div class="inl">
		제목	
		</div>
		<div class="inl" style="width: 777px; text-align: center;">
		${lostItemDTO.lost_title}
		</div>
	</div>
<div style="margin-top: 20px;">
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
	<tr style="margin-top: 10px;">
		<td>${lostItemDTO.member_id}</td>
		<td>${lostItemDTO.member_email}</td>
		<td>${lostItemDTO.lost_loc}</td>
		<td>${lostItemDTO.lost_theater}</td>
		<td><fmt:formatDate value="${lostItemDTO.lost_day}"/></td>
		<td>${lostItemDTO.lost_type}</td>
		<td>${lostItemDTO.lost_color}</td>
		<td>${lostItemDTO.lost_hour}시  ${lostItemDTO.lost_min}분</td>
		<td>${lostItemDTO.lost_etc}</td>
	</tr>
</table>
</div>
<div id="textar">
<form action="${contextPath}/lostListDetailPro.do" method="post">
	<textarea rows="15" cols="110" name="lost_anser" style="margin-top: 15px;">
	${lostItemDTO.lost_anser}
	</textarea>
	<input type="hidden" value="${lostItemDTO.lost_id}" name="lost_id">
	<input type="hidden" value="${pageNo}" name="pageNo">
	<div style="text-align: center; width: 800px;">
	<input type="reset" value="취소" style="font-size: 20px; padding: 5px; background: green; color: black; margin-top: 20px;">
	<input type="submit" value="입력" style="font-size: 20px; padding: 5px; background: pink; color: white; margin-top: 20px; margin-left: 20px">
	</div>
</form>
</div>
<div style="text-align: center;width: 800px; margin-top: 20px; font-size: 20px; margin-bottom: 10px;">
<c:set var="no" value="${empty param.pageNo? '1':param.pageNo}"/>
<a class="bottomMenu" href="${contextPath}/lostItemList.do?pageNo=${no}">목록보기</a>
</div>
</body>
</html>