<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
 <script>
  function chg(n) // n은 0부터 순서대로 값을 가져온다  => 첫번째 : 0, 두번재 : 1 ...
  {
	  // 선택한 별을 포함한 이전 별은 색이 있는 star1.png 변경
	  for(i=0;i<=n;i++)
	    document.getElementsByClassName("star")[i].src="../resources/img/star1.png";
	
	  // 선택한 별 다음 별은 끝까지 star2.png로 변경
	  for(i=n+1;i<=4;i++)
	    document.getElementsByClassName("star")[i].src="../resources/img/star2.png";
	  
	  // 전송될 값을 위해 클릭될때마다 hidden의 값을 변경
	  document.pkc.review_grade.value=n+1;
  }
 </script>
 <style type="text/css">
 	#reviewSubmit{background:pink; padding: 5px 5px 3px 5px; border-radius: 15px; color:white; margin: 0 0 0 10px}
 	#reviewForm{ width: 100%; clear: both; text-align:center;}
 </style>
</head>
<body>
		<div id="reviewForm">
			<form name="pkc" action="${contextPath}/movie/reviewModify.do">
				<input type="hidden" id="member_id" name="member_id" value="${reviewDto.member_id }" />
				<input type="hidden" id="review_id" name="review_id" value="${reviewDto.review_id }" />
				<label for="member_name">작성자 :</label>
				 <input type="text" id="member_name" name="member_name"  value="${reviewDto.member_name }" readonly><p>
				 <label for="movie_id">영화번호 : </label>
				<input type="text" id="movie_id" name="movie_id" value="${reviewDto.movie_id }" readonly><p>
				평점 : <input type="hidden" name="review_grade" value="0">
						  <img src="../resources/img/star2.png" class="star" onclick="chg(0)">
						  <img src="../resources/img/star2.png" class="star" onclick="chg(1)">
						  <img src="../resources/img/star2.png" class="star" onclick="chg(2)">
						  <img src="../resources/img/star2.png" class="star" onclick="chg(3)">
						  <img src="../resources/img/star2.png" class="star" onclick="chg(4)"> <p>
				리뷰내용 : <textarea id="review_review" name="review_review"  style="width:200px;height:100px"  required>
										${reviewDto.review_review }
								</textarea><p>
				<input type="submit" id="reviewSubmit"value="수정하기">
			</form>
		</div>
</body>
</html>