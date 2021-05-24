<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<style>
.mypage{
position: relative;
left: 150px;
bottom: 350px;
}
</style>
<meta charset="UTF-8">

<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>분실물게시판 리스트</title>
</head>
<body>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">운영자</a>
                            </li>
                        
                            <li  class="last">
                                분실물 문의 관리
                            </li>
                        
                        
                    </ul>
                </div>
                <div class="sect-special">
                    <ul>                      
                        <li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../user/memberShip/ClubService.html" title="새창" class="specialclub">Club서비스</a></li>
                      
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

		<!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			
<!-- Contents Area -->
<div id="contents">
	<!-- Contents Start -->
	<div class="cols-content">
		
<div class="col-aside">
    <h2>
        운영자관리 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=''><a href="${contextPath}/adminchk.do">운영자 관리 메인<i></i></a></li>
            <li class=''><a href="${contextPath}/member/memberList.do">회원 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do">예매문의 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adEventList.do/">이벤트 관리<i></i></a></li>
            <li class='on'><a href="${contextPath}/lostItemList.do">분실물 문의 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/showTheaterList.do">극장 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/movie/movieList.do">영화 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adminTicketForm.do">예매 관리<i></i></a></li>
        </ul>
    </div>
   
</div>		
			
		</div>
	</div>
<!--메인  -->
		<div class="mypage">

	<%-- 내용출력부분 --%>
	<table class="main">
		<caption>분실물정보</caption>
			<thead>
				<tr>
					<th width="260">제목</th>
					<th width="120">작성자번호</th>
					<th width="280">이메일</th>
					<th width="120">분실위치</th>
					<th width="120">분실극장</th>
					<th width="120">분실날짜</th>
					<th width="120">분실물종류</th>
					<th width="120">분실물색상</th>
					<th width="120">기타</th>
					<th width="90">답변상황</th>
				</tr>
			</thead>
			<tbody>
				<%--p653 20라인 
						게시물이 존재x한다면  게시글이 없다는 메세지가 있는 줄 출력--%>
				<c:if  test="${lostItemListDTO.hasNoArticles()}">
					<tr>
						<td colspan="4" style="position: relative; left: 300px;">
							 아직 작성된 게시글이 없습니다.
						</td>
					</tr>
				</c:if>
				
				
				<c:forEach var="article" items="${lostItemListDTO.content}"> 
					<tr>
						<td width="260"><a href="${contextPath}/lostListDetail.do?no=${article.lost_id}&pageNo=${lostItemListDTO.currentPage}"> ${article.lost_title}</a></td>
						<th width="120">${article.member_id}</th>
						<th width="120">${article.member_email}</th>
						<th width="120">${article.lost_loc}</th>
						<th width="120">${article.lost_theater}</th>
						<th width="120"><fmt:formatDate value="${article.lost_day}"/></th>
						<th width="120">${article.lost_type}</th>
						<th width="120">${article.lost_color}</th>
						<th width="120">${article.lost_etc}</th>
						<th width="50">
						<c:if test="${not empty article.lost_anser}">답변완료</c:if>
						<c:if test="${empty article.lost_anser}">답변필요</c:if>
						</th>
					</tr>
				</c:forEach>
				<%-- 반복끝 -------------%>
			</tbody>	
	</table>
	
	<%-- 페이징처리 p653 37라인 
			 전체게시물수가 0보다 크면 
			 -> 게시물수가 존재한다면 페이징을 출력하여라 
	--%>
<%-- 	articlePage.hasArticles()=${articlePage.hasArticles()}<br/>
	articlePage.startPage=${articlePage.startPage}<br/>
	articlePage.endPage=${articlePage.endPage}<br/>
	articlePage.totalPages=${articlePage.totalPages} --%>
	<c:if test="${lostItemListDTO.hasArticles()}">
		<table border="0" width="90%">
			<tbody>
				<tr>
					<td class="pageNo">
						<%-- p653 41라인
								 조건문활용하여 이전으로 넘어갈수 있는 경우에는
						         시작페이지(startPage가 0보다 큰 경우)
						    <<prev 출력 --%>
						    
						<c:if test="${lostItemListDTO.startPage>5}">    
							<a href="<%=request.getContextPath()%>/lostItemList.do?pageNo=${lostItemListDTO.startPage-5}"> &lt;&lt;prev </a>				
						</c:if>
						
						<%--p653 43라인
								페이징처리에서 한번에 출력할 페이수만큼 반복처리
								형식
								<c:forEach begin="0시작값" end="10종료값" step="2증감값" var="i변수명">		
									<a href="#~~~">[${i}]</a>   [0] [2] [4] [6] [8] [10]
								</c:forEach>
								 --%>
						<c:forEach begin="${lostItemListDTO.startPage}" 
						           end="${lostItemListDTO.endPage}" step="1" 
						           var="pNo">	
							<a href="<%=request.getContextPath()%>/lostItemList.do?pageNo=${pNo}">[${pNo}]</a>
						</c:forEach>
						
						<%--조건문활용하여 다음으로 넘어갈수 있는 경우에는
						    endPage<totalPages
						    next>> 출력 --%>
						<c:if test="${lostItemListDTO.endPage<lostItemListDTO.totalPages}">   
							<a href="<%=request.getContextPath()%>/lostItemList.do?pageNo=${lostItemListDTO.startPage+5}"> next&gt;&gt; </a>
						</c:if> 
					</td>
				</tr>
			</tbody>
		</table>
	</c:if>	
	   	
	   </div>
	   
</body>
</html>