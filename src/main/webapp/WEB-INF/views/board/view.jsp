<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${contextPath}/delete.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function(){
			document.form1.action="${contextPath}/update.do";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post">
	<br>
	<div>
		<h2>제목</h2> 
		<input name="title" id="title" size="70" value="${dto.title}" placeholder="제목을 입력"> 
	</div><br>
	<div>
		<h2>내용</h2>
		<textarea name="content" id="content" rows="10" cols="130" placeholder="내용 입력">"${dto.content}"</textarea>
	</div><br>
	<div>
		<h2>이름</h2>
		<input name="writer" size="20" id="writer" value="${dto.writer}" placeholder="이름을 입력">
	</div><br>
	<div style="width:650px; padding-left: 450px;" id="btngroup">
		<input type="hidden" name="bno" value="${dto.bno}">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</div>
</form>
</body>
</html>