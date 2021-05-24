<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function(){
      $("#btnWrite").click(function(){
         location.href = "${contextPath}/write.do";
      });
   });
</script>
<style>
   table{
      width: 100%;
   }
   th, td {
    border: 1px solid #444444;
  }
   h4{
      text-align: left;
      color: orange;
   }
   h2{
      padding-left: 385px;
   }
</style>
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
                                <a href="index.html">고객센터</a>
                            </li>
                        
                            <li  class="last">
                                                             자유게시판
                            </li>
                        
                        
                    </ul>
                </div>
                <!-- Contents Area -->
      <div id="contents" class="">
            
            <!-- Contents Start -->
         

<!-- Contents Area -->
<div id="contents">
   <!-- Contents Start -->
   <div class="cols-content">
      
<div class="col-aside">
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=''><a href="support.do">고객센터 메인<i></i></a></li>
            <li class=''><a href="${contextPath}/noticeBoard.do">공지/뉴스<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="${contextPath}/events.do">이벤트<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItem.do">분실물 문의<i></i></a></li>
            <li class='on'><a href="${contextPath}/list.do">자유게시판<i></i></a></li>            
        </ul>
    </div>
  
</div>

</div>
<div style="position: relative; bottom: 230px;">
<button type="button" id="btnWrite" style="position: relative; left: 550px; margin-bottom: 20px;"><h2>글쓰기</h2></button>
<table style="position: absolute; padding-left: 165px;">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.bno}</td>
		<td><a href="${contextPath}/view.do?bno=${row.bno}">${row.title}</a></td>
		<td>${row.writer}</td>
		<td>
			<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
		<td>${row.viewcnt}</td>
	</tr>
	</c:forEach>
</table>
</div>
<br><br><br><br><br>
</body>
</html>