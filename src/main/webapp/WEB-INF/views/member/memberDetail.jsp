<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>개인회원정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	
	$(".delete_chg").click(function(){
		var adm = document.frm.member_admin.value;
		
		if(adm=='회원'){
			document.frm.member_admin.value = 0;
		}else{
			document.frm.member_admin.value = 1;
		}
		document.frm.submit();
	})//
	
	$(".delete_btn").click(function(){
		var member_id = $("#idn").val()
		document.frm.action='./deleteMember.do?member_id='+member_id;
		document.frm.submit();
	})//
	
});
	
</script>	
</head>
<body>
	<%--
		MemberControllerImpl 컨트롤러에서  아래와같이 model이 넘어왔다
	  mv.addObject("memberDTO", memberDTO); //회원정보
	 --%>
	<hr/>
	
		<form action="${contextPath}/member/chgMember.do?member_id=${memberDTO.member_id}" method="post" name="frm">		
	<table border="1" width="100%" style="margin-top: 20px;">
		<caption>개인회원정보</caption>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>번호</th>
				<th>email</th>
				<th>권한<th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${memberDTO.member_id}</td>
				<td><input type="text" value="${memberDTO.member_userid}" name="member_userid"></td>
				<td><input type="text" value="${memberDTO.member_name}" name="member_name"></td>
				<td><input type="text" value="${memberDTO.member_tel}" name="member_tel"></td>
				<td><input type="text" value="${memberDTO.member_email}" name="member_email"></td>
				<td>
				<c:if test="${memberDTO.member_admin==0}"><input type="text" value="회원" name="member_admin"></c:if>
				<c:if test="${memberDTO.member_admin==1}"><input type="text" value="운영자" name="member_admin"></c:if>
				</td>
				<td>
				</td>
			</tr>
		</tbody>
	</table>	
	<input type="hidden" value="${memberDTO.member_id}" id="idn">
			</form>
			<div style="text-align: center; margin-top: 10px">
			<button name="delete_btn" class="delete_btn" style="background: green; color: black; width: 50px; font-size: 20px; margin-top: 10px;">삭제</button>
			<button name="delete_chg" class="delete_chg" style="background: pink; color: white; width: 50px; font-size: 20px; margin-left: 20px; margin-top: 10px;">수정</button>
			</div>
	<div style="text-align: center; margin: 10px 0 0 0;">
	 <a href="${contextPath}/member/memberList.do?pageNo=${pageNo}" style="font-size: 20px; margin-top: 10px;">회원목록으로 돌아가기</a> 
	</div>	

</body>
</html>










