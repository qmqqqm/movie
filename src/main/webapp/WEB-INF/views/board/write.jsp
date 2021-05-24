<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
		
		document.form1.submit();
	});
});
</script>
</head>
<body>
<br>
<h4>게시글 작성</h4>
<br>
<form name="form1" method="post" action="${contextPath}insert.do">
	<div>
		<h2>제목</h2> 
		<input name="title" id="title" size="70" placeholder="제목을 입력"> 
	</div><br>
	<div>
		<h2>내용</h2>
		<textarea name="content" id="content" rows="10" cols="130" placeholder="내용 입력"></textarea>
	</div><br>
	<div>
		<h2>이름</h2>
		<input name="writer" id="writer" size="20" placeholder="이름을 입력">
	</div><br><br>
	<div style=" padding-left: 450px;" id="btngroup">
		<button type="button" id="btnSave">확인</button>
		<button type="button" id="btnreset">취소</button>	
	</div>
</form>
</body>
</html>