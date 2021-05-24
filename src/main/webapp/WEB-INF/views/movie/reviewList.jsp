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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.9.0/js/lightbox.min.js" type="text/javascript"></script>	
<title>Insert title here</title>
</head>
<body>
<div>
<c:forEach var="review" items="${review }">
					<%-- 리뷰번호 : ${review. review_id} --%>
					<div  style=" margin-top:20px; ">
					<ul class="reviewList">
						<li>
							<c:if test="${review.review_grade<3}">
								<img src="../resources/img/bad.png" style="width:30px; " /> 
							</c:if>
							<c:if test="${review.review_grade==3 || review.review_grade==4}">
								<img src="../resources/img/soso.png" style="width:30px; " /> 
							</c:if>
							<c:if test="${review.review_grade==5}">
								<img src="../resources/img/smile.png" style="width:30px; " /> 
							</c:if>
							 <span style="font-size:15px; font-weight:bold"> ${review.member_name}</span></li><p/>
						<li>
							<c:if test="${review.review_grade==1}">
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
							</c:if>
							<c:if test="${review.review_grade==2}">
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
							</c:if>
							<c:if test="${review.review_grade==3}">
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star2.png"/>
								<img src="../resources/img/star2.png"/>
							</c:if>
							<c:if test="${review.review_grade==4}">
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star2.png"/>
							</c:if>
							<c:if test="${review.review_grade==5}">
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
								<img src="../resources/img/star1.png"/>
							</c:if>
						
						</li><p/>
						<li style="font-size:20px; font-weight:bold">${review.review_review}</li>
					</ul>
					</div>
					<c:if test="${memberDto.member_id ==  review.member_id}">
						<a href="${contextPath}/movie/reviewModifyForm.do?review_id=${review.review_id }">리뷰 수정하기</a>
						<a href="${contextPath}/movie/reviewDelete.do?review_id=${review.review_id }&movie_id=${review.movie_id}" onclick="return confirm('삭제하시겠습니까?');" >리뷰 삭제하기</a>
					</c:if>
				</c:forEach>	
					<div style="display: block; text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a href="${contextPath}/movie/movieDetail.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&movie_id=${movie_id}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="${contextPath}/movie/movieDetail.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&movie_id=${movie_id}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="${contextPath}/movie/movieDetail.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&movie_id=${movie_id}">&gt;</a>
						</c:if>
					</div>
</div>
</body>
</html>