<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	#notice_title{
		width: 900px;
		margin: 10px;
		padding: 10px;
		font-size : 18px;
	}
	#notice_content{
		width: 900px;
		font-size : 18px;
	}
	input[type=submit]{
		width: 50px;
		height: 50px;
		background: white;
		border : 1px solid pink;
		font-weight : 600;
		font-size: 14px;
		margin: 10px 5px 10px 30px;
		padding: 10px 10px 10px 10px;
	}
	 input[type=button]{
	 	width: 50px;
		height: 50px;
		background: white;
		border : 1px solid pink;
		font-weight : 600;
		font-size: 14px;
		margin: 10px 5px 10px 10px;
		padding: 10px 10px 10px 10px;
	 }
	
</style>
<body>
<form name="noticeFrm" id="noticeFrm" action="${contextPath}/noticeWriterSuc.do" method="post">
	<table>
		<tr>
			<td>
				<input type="text" id="notice_title" name="notice_title" placeholder="제목" required="required"/>
			</td>	
		</tr>
		<tr>
			<td>
				<textarea rows="15"  id="notice_content" name="notice_content" placeholder="내용" required="required"></textarea>
			</td>	
		</tr>
	</table>
	<input type="submit" value="작성">
	<a href="${contextPath}/noticeBoard.do"><input type="button" value="취소"></a>
</form>
</body>
</html>