<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#notice{
		width:980px;
	}
	ul {
    list-style:none;
    margin:0;
    padding:0;
    border-bottom: 1px solid black;
	}

	li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
	}
	.notice_title{
		text-align:left;
		margin: 12px 10px 10px 10px;
		width:750px;
	}
	.notice_writer{
		text-align:rigth;
		margin: 12px 10px 10px 10px;
		width:160px;
	}
	.notice_title span{
		font-size:20px;
	}
	.notice_writer span{
		font-size:16px;
		font-size:15px;
	}
	#notice a{
		border:1px solid pink;
		padding : 8px;
		margin : 10px 10px;
		font-weight:600;
		font-size:16px;
	}
</style>
</head>
<body>
	<div id="notice">
		<ul style="margin-top:50px;">
			<li class="notice_title">
				<span>${noticeDTO.notice_title}</span>
			</li>
			
			<li class="notice_writer">
				<span> 등록일 <fmt:formatDate value="${noticeDTO.notice_date}" pattern="yyyy.MM.dd"/></span>
			</li>
		</ul>
		
		<div style="padding:35px 13px">
			<p style="width:954px; height:500px; font-size:20px; border-bottom: 1px solid black;">${noticeDTO.notice_content}</p>
		</div>
		<c:if test="${MDTO.member_admin eq 1}"><!-- 수정 -->
			<a href="${contextPath}/noticeBoard.do">목록</a>
		</c:if>
	</div>
	
</body>
</html>