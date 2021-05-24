<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.9.0/css/lightbox.min.css" type="text/css">
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>

<style>
#mvpkc{width:100%; margin: 0 auto;  max-width: 1000px; padding-top:10px}

#detailNav{background:pink; width:100%; margin: 0 auto; padding-bottom:10px; max-width: 1000px; }

#detailNavbar li{display:inline; margin-left:50px; font-size:25px; color:white; font-weight:bold}

#detailNavbar{text-align:center; padding-top: 10px}

#mvInfo{max-width: 1000px; width:100%; margin: 0 auto; padding-top:10px; }

#mvInfo.#mainInfo{max-width: 1000px; width:100%; margin: 0 auto; padding-top:0px;}

pre{white-space: pre-wrap;}

#img{max-width: 400px; width:100%; margin: 0 auto; }

.mvDetailImg{width:300px; margin : 10px 10px 10px 10px; }

#reviewWrite{background:pink; padding: 5px 5px 5px 5px; border-radius: 15px; color:white; margin: 0 0 0 10px}

#reveiwForm{margin: 30px 0 20px 0; text-align:center; width: 100%; clear: both;}



	ul.reviewList {
    list-style: none;
    margin:0 auto;
    padding: 0px;
  
    max-width: 1000px;
    width: 100%;
}
  
ul.reviewList li {
    display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    /* border: 1px solid #efefef; */
    font-size: 12px;
}



</style>

<script>
	$(function(){
		$("#review").hide(); 
		$("#image").hide(); 
		$("#reveiwForm").hide(); 
		
		$("#1").click(function(){
			$("#review").hide(); 
			$("#image").hide(); 
			$("#mainInfo").show(); 
		});
		$("#2").click(function(){
			$("#image").hide(); 
			$("#mainInfo").hide(); 
			$("#review").show(); 
		});
		$("#3").click(function(){
			$("#review").hide(); 
			$("#mainInfo").hide(); 
			$("#image").show(); 
		});
		$("#reviewWrite").click(function(){
			$("#reveiwForm").show(); 
		});
		$("#x").click(function(){
			$("#reveiwForm").hide(); 
		});
		
	});
</script>
<title></title>
</head>
<body>
<div id="img">
	<img class="mvDetailImg" src="${contextPath}/thumbnails.do?movie_id=${map.movieDetail.movie_id}&movieImage_fileName=${map.movieDetail.movieImage_fileName}">
</div>
<div id="mvpkc">
						<p style="font-size:30px; font-weight:bold">${map.movieDetail.movie_title}<p>
						<br/>
						<hr/>
						<p style="font-size:15px;">감독 : ${map.movieDetail.movie_foreman} / 배우 : ${map.movieDetail.movie_actor}<p>
						<fmt:parseDate value="${map.movieDetail.movie_Date}" var="movie_Date" pattern="yyyy-MM-dd"/>
						<p style="font-size:15px;">상영시간 : ${map.movieDetail.movie_time}분 / 개봉일 : <fmt:formatDate value="${movie_Date}" pattern="yyyy-MM-dd"/></p>
						<p style="font-size:15px;">장르 : ${map.movieDetail.movie_genre} / 상영등급 : ${map.movieDetail.movie_rating} </p>
						<%-- 마감
						<fmt:formatDate  value="${map.movieDetail.movie_endDate}"  pattern="yyyy-MM-dd"/>
						<p>영화번호</p>
						${map.movieDetail.movie_id}--%>
							<br/>
							<c:if test="${memberDto.member_admin == 1 }">
								<a href="${contextPath}/movie/movieModifyForm.do?movie_id=${map.movieDetail.movie_id}">수정하기</a>
								<a href="${contextPath}/movie/movieDelete.do?movie_id=${map.movieDetail.movie_id}"  onclick="return confirm('삭제하시겠습니까?');">삭제하기</a>
								
							</c:if>
</div>	

	<div id="detailNav">
		<ul id="detailNavbar">
			<li id="1" style="cursor:pointer;">
				 주요정보 
			</li>
			<li id="2" style="cursor:pointer;"> 
				리뷰/평점
			 </li>
			<li id="3" style="cursor:pointer;"> 
				스틸컷
			</li>
		</ul>
	</div>
	<div id="mvInfo">
			<%-- <p>영화번호</p>
			<p>${mvInfo.movie_id}</p> --%>
			<div id="mainInfo">
				<p style="font-size:20px; font-weight:bold ">주요정보</p><br/>
				<pre>${map.movieDetail.movie_mainInfo}</pre>
			</div>
			<div id="review">
				<span style="font-size:20px; font-weight:bold;">리뷰/평점</span>  
					<span id="reviewWrite" style="cursor:pointer;">
						작성하기
					</span>
					<div id="reveiwForm">
						<span id="x" style="cursor:pointer;"> <img style="width:20px; padding:0 0 20px 200px" src="../resources/img/x.png"/></span>
						<c:import url="${context }/movie/reviewWriteForm.do"/> 
					</div>
					<c:import url="${context }/movie/reviewList.do?movie_id=${map.movieDetail.movie_id}"/>
				</div>
				
			<div id="image">	
			<c:forEach items="${map.movieDetailImg}" var="movieDetail">
							<img  class="mvDetailImg" src="${contextPath}/thumbnails.do?movie_id=${movieDetail.movie_id}&movieImage_fileName=${movieDetail.movieImage_fileName}">
			</c:forEach>
			 
			</div>

		</div>		

<script>
</script>
</body>
</html>