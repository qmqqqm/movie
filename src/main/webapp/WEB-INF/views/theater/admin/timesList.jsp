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
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/theater/timeList.css" />
<title>영화관 LIST</title>

</head>
<body>
<div id="timeList_wrap">

<h1 id="timeList_h1">${theater_name} 상영시간표 LIST</h1>
<div id="timeList_add">
	<a href="<%=request.getContextPath()%>/createTimesForm.do"  id="timeList_a" >새로운 상영시간 추가</a>
</div>
<form>
	<table id="timeList_table" >
		<thead>
			<tr>
				<th width="150">번호</th>
				<th width="300">상영관 번호</th>
				<th width="120">좌석수</th>
				<th width="500">영화이름</th>
				<th width="250">시간표</th>
				<th width="200">노출여부</th>
				<th width="120">삭제</th>
			</tr>
		</thead>
		<tbody>
			
			<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
			<c:forEach  var="times"  items="${times}">
			<tr>

				<td>${times.times_id}</td>
				<td>${times.sangyg_id} 관</td>
				<td>${times.times_seat}</td>
				<td>${times.movie_title}</td>
				<td><fmt:formatDate pattern ="yyyy-MM-dd HH:mm" value="${times.times_time}"/></td>
				<td>${times.times_isshow}</td>
				<td><button type="button" onclick="location.href='<%=request.getContextPath() %>/deleteTimes.do?times_id=${times.times_id}'">삭제</button></td>

			</tr>
		
			</c:forEach>
		</tbody>
	</table>		

</form>	
</div>
</body>
</html>