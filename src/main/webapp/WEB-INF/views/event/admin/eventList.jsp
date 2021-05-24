<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/event/adEventList.css" />
<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function (){
	
	//이벤트 종류를 누르면 해당하는 이벤트 보여주기
	$(".categoryList").on("click",function (){
		var category = $(this).text();
		var val = '${fn:length(eventMap)}';
	
		for(i = 1; i <= val; i++){
			var cat = document.getElementById(i);
	
			if(cat.getAttribute('value') != category)
				cat.style.display="none";
			else
				cat.style.display="block";
		}
	});//$(".categoryList").on("click",function)
	
	
	$("#deleteBtn").on("click", function(){
		var con = confirm("삭제하시겠습니까?");
		
		if(con == true){
			location='<%=request.getContextPath()%>/deleteEvent.do?event_id=${event.event_id}';
		}
		
	})
	
});

function deleteFn(id){
	alert(id);
	var con = confirm("삭제하시겠습니까?");
	
	if(con == true){
		context="<%=request.getContextPath()%>/deleteEvent.do?event_id="+id;
		location=context;
	}
}
</script>
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
                                이벤트 관리
                            </li>
                        
                        
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->


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
            <li class='on'><a href="${contextPath}/adEventList.do">이벤트 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItemList.do">분실물 문의 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/showTheaterList.do">극장 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/movie/movieList.do">영화 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adminTicketForm.do">예매 관리<i></i></a></li>
		        </ul>
		    </div>
		  
		</div><!-- col-aside -->
		

		
		
		
		
		
<div id="eventList_wrap">		
	<form>
		<h1 id="eventList_h1">EventList</h1>
		<div id="eventList_topWrap">
	
			<div id="event-menu">
				<ul id="event-menu_ul">
					<c:forEach  var="category"  items="${categoryList}">
					<li id="event-menu_li"><button type="button" class="categoryList" value="${category}">${category}</button></li>
					</c:forEach>
				</ul>
			</div>
			<button type="button" onClick="location='<%=request.getContextPath()%>/createEventForm.do'" id="createEventBtn">새로만들기</button><br>
		</div>		
		
		<c:forEach var="event_cat" items="${eventMap}">
		<c:set var="count" value="${count + 1}" /> 
			<table id="${count}"  class="eventList_table"  value="${event_cat.key}">
				<h2 class ="cate_name">${event_cat.key}</h2>
				<thead>
					<tr>
						<th width="60">번호</th>
						<th width="100">진행상태</th>
						<th width="300">제목</th>
						<th width="100">작성일</th>
						<th width="100">시작일</th>
						<th width="100">종료일</th>
						<th width="80">여부</th>
						<th width="100">수정</th>
						<th width="100">삭제</th>
					</tr> 
				</thead>
				<tbody id = "event_main">
					<c:forEach var="event" items="${event_cat.value}">
						<tr>
							<td width="60">${event.event_id}</td>
							<td width="100">${event.event_status}</td>
							<td width="300">${event.event_title}</td>
							<td width="100">${event.event_wday}</td>
							<td width="100">${event.event_start}</td>
							<td width="100">${event.event_end}</td>
							<td width="60">${event.event_isshow}</td>
							<td width="100"><button type="button" onClick="location='<%=request.getContextPath()%>/modifyEventForm.do?event_id=${event.event_id}'">수정</button></td>
							<td width="100"><button type="button" onClick="deleteFn('${event.event_id}')">삭제</button></td>
						</tr>
					</c:forEach> 
				</tbody>
				
			</table>
		</c:forEach>
	</form>
</div>

		</div>		


</body>
</html>