<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	td{
		margin:0px 0px 0px 50px;
	}
	table{
		border-collapse: collapse;
		width: 800px;
		padding:0px 0px 0px 50px;
	}
	.notice_no{
		width:40px;
		padding: 10px 10px;
	}
	.notice_title{
		width:700px;
		padding: 10px 10px;
	}
	.notice_day{
		width:60px;
		padding: 10px 10px;
	}
	.notice_no_{
		text-align:center;
	}
	.notice_title_{
		text-align:left;
		padding: 10px 10px;
	}
	.notice_day_{
		text-align:center;
	}
	.notice_table_top{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	}
	.notice_a{
		padding : 10px 10px;
		border:1px solid pink;
		margin:15px 15px;
	}
</style>

<script>

</script>
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
                                공지/뉴스
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
            <li class='on'><a href="${contextPath}/noticeBoard.do">공지/뉴스<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="${contextPath}/events.do">이벤트<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItem.do">분실물 문의<i></i></a></li>
            <li class=''><a href="${contextPath}/list.do">자유게시판<i></i></a></li>            
          
            
          
        </ul>
    </div>
  
</div>
<div>
	<table>
		<tr class="notice_table_top">
			<td class="notice_no">번호</td>
			<td class="notice_title">제목</td>
			<td class="notice_day">작성일</td>
		</tr>
		
		<c:forEach var="notice"  items="${noticeList}">
		<tr class="notice_table_bottom">
			<td class="notice_no_">${notice.notice_id}</td>
			<td class="notice_title_"><a href="${contextPath}/noticeDetail.do?notice_id=${notice.notice_id}">${notice.notice_title}</a></td>
			<td class="notice_day_"><fmt:formatDate value="${notice.notice_date}" pattern="yyyy.MM.dd"/></td>
		</tr>
		</c:forEach>
	</table> 
	<c:if test="${MDTO.member_admin eq 1}"><!-- 수정 -->
		<a href="${contextPath}/noticeWriter.do" class="notice_a" style="position:relative; top:20px; padding: 10px">글 작성</a>
	</c:if>
	</div>
</body>
</html>