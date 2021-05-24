<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/event/eventDetail.css" />
</head>
<body>
<c:set var="eventInform" value="${eventMap.eventInform}"/>
<c:set var="eventImage" value="${eventMap.imageList}"/>

<div id="eventsDetail_main">

	<div id="eventsDetail_title">
		<table id="eventsDetail_table">
			<tr>
			<td width="150">${eventInform.event_category} </td>
			<td wdith="800">${eventInform.event_title}</td>
			<td width="200">${eventInform.event_start}~${eventInform.event_end}</td>
			</tr>
		</table>       
	</div>
	<hr>
	<div id="main_content">
		<c:forEach var="image" items="${eventImage}">
			<img class="eventDetail_img"src='${contextPath}/eventDetail_image.do?event_id=${eventInform.event_id}&fileName=${image.event_image_filename}'/><br> 
		</c:forEach>
		<br>
		<div id="detail_main">
			<pre id="eventsDetail_pre"> ${eventInform.event_content} </pre>	
		</div>
	</div>
	
	<div id="eventsDetail_backDiv">
		<button type="button" id="eventsDetail_backBtn" value="back" onClick="location='<%=request.getContextPath()%>/events.do'"> <-목록</button>
	</div>
</div><!--main div  -->
</body>
</html>