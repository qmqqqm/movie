<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.tadata{
font-size: 20px;
}

.sp{
margin-top:30px;
margin-left: 230px;
display: inline-block;
}

.tadata{
border-bottom: 1px solid pink;
}

#delete{
background: pink;
color: white;
padding: 10px;
}

#sujung{
background: green;
color: white;
padding: 10px;
}

</style>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script>
</script>
<title></title>
</head>
<body>
	<div id="pkc">
		<table style="height: 500px;">
			<tr>
				<td style="font-size: 30px; position: relative; left: 250px;">회원정보</td>
			</tr>
			<tr>
				<td class="tadata">아이디</td>
				<td class="tadata">${memberDto.member_userid }</td>
			</tr>
			<tr>
				<td class="tadata">닉네임</td>
				<td class="tadata">${memberDto.member_name }</td>
			</tr>
			<tr>
				<td class="tadata">이메일</td>
				<td class="tadata">${memberDto.member_email }</td>
			</tr>
			<tr>
				<td class="tadata">휴대폰 번호</td>
				<td class="tadata">${memberDto.member_tel }</td>
			</tr>
			<tr>
				<td class="tadata">비밀번호</td>
				<td class="tadata">${memberDto.member_pwd }</td>
			</tr>
			<tr>
				<td class="tadata">주민번호</td>
				<td class="tadata">${memberDto.member_jumin }</td>
			</tr>
		</table>
		<span class="sp"><a id="sujung" href="${contextPath}/member/myPageModifyForm.do?member_id=${memberDto.member_id}">회원정보 수정</a></span>
		<span class="sp"><a id="delete" href="${contextPath}/member/myPageDelete.do?member_id=${memberDto.member_id}">회원탈퇴</a></span>
	</div>
</body>
</html>