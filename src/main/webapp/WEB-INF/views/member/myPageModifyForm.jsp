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
border-bottom: 1px solid pink;
	font-size: 20px;
}

*{
	margin-top: 10px;
}

input{
margin-bottom:10px;
}

#sub{
margin-left: 450px;
font-size: 20px;
margin-top: 20px;
background-color: pink;
color: white;
padding: 10px;
}

#tit{
font-size: 30px;
position: relative;
left: 230px;
}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="pkc">
		<form action="${contextPath}/member/myPageModify.do">
			<table>
				<tr>
					<td id="tit">회윈정보 수정</td>
				</tr>
				<tr>
					<td class="tadata">회원번호</td>
					<td class="tadata"><input type="text" id="member_id" name="member_id" value="${memberDto.member_id }" readonly></td>
				</tr>
				<tr>
					<td class="tadata">아이디</td>
					<td class="tadata"><input type="text" id="member_userid" name="member_userid" value="${memberDto.member_userid }"></td>
				</tr>
				<tr>
					<td class="tadata">닉네임</td>
					<td class="tadata"><input type="text" id="member_name" name="member_name" value="${memberDto.member_name }"></td>
				</tr>
				<tr>
					<td class="tadata">이메일</td>
					<td class="tadata"><input type="text" id="member_email" name="member_email" value="${memberDto.member_email }"></td>
				</tr>
				<tr>
					<td class="tadata">휴대폰 번호</td>
					<td class="tadata"><input type="text" id="member_tel" name="member_tel" value="${memberDto.member_tel }"></td>
				</tr>
				<tr>
					<td class="tadata">권한</td>
					<td class="tadata"><input type="text" id="member_admin" name="member_admin" value="${memberDto.member_admin }" readonly></td>
				</tr>
				<tr>
					<td class="tadata">비밀번호</td>
					<td class="tadata"><input type="text" id="member_pwd" name="member_pwd" value="${memberDto.member_pwd }" readonly></td>
				</tr>
				<tr>
					<td class="tadata">주민번호</td>
					<td class="tadata"><input type="text" id="member_jumin" name="member_jumin" value="${memberDto.member_jumin }" readonly></td>
				</tr>
			</table>
				<input type="submit" value="수정" id="sub"> 
		</form>
	</div>
</body>
</html>