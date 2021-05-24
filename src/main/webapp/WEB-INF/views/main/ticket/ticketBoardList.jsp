<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
                                예약문의
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
            <li class='on'><a href="${contextPath}/ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="${contextPath}/events.do">이벤트<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItem.do">분실물 문의<i></i></a></li>
            <li class=''><a href="${contextPath}/list.do">자유게시판<i></i></a></li>            
          
            
          
        </ul>
    </div>
  
</div>

		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">예매문의</h2>
				<p class="stit">늘봄극장 예매(예매,취소,상영시간)관련 게시판 입니다</p>
			</div>
			<div class="search_area">
			<form action="ticketboardfind.do">
				<legend><label for="c_select">검색</label></legend>
				<select name="selsearchfield" id="selsearchfield" class="c_select" style="width:100px;">
					<option selected="selected" value="0">제목</option>
					<option value="1">내용</option>
				</select>
				<label for="searchtext" class="hidden">검색어 입력</label>
				<input id="searchtext" name="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" style="width:185px;" value="" />
				<input type="submit" class="round inblack" value="검색하기" />
				<c:if test="${MDTO!=null}">
				<a href="ticketBoardWriteForm.do"><button type="button" class="round inblack" title="문의하기" id="write">문의하기</button></a>
			</c:if>
				</form>
				
			</div>
			
			
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
				<caption>목록</caption>
				<colgroup>
					<col style="width:70px;" />
                    <col style="width:160px;" />
					<col style="auto;" />
					<col style="width:140px;" />
					<col style="width:120px" />
				</colgroup>
				<thead>
					<tr>
					<th scope="col">번호</th>
          <th scope="col">구분</th>
					<th scope="col" class="tit">제목</th>
					<th scope="col" class="writer">작성자</th>
					<th scope="col">등록일</th>
					<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
              <c:forEach  var="list"  items="${ticketList}">
					    <tr class="first">
					    <c:if test="${list.member_Id ne('admin')}">
						    <fmt:parseNumber var= "boardNo" integerOnly= "true" value= "${list.ticketBoard_id} "/>
								<td>${boardNo}</td>

						   </c:if> 
						    <c:if test="${list.member_Id eq('admin')}">
						    <td></td>
						    </c:if>
                <td>${list.ticketBoard_group}</td>
						    <td class="txt"><a href="ticketBoardDetail.do?ticketBoard_id=${list.ticketBoard_id}">${list.ticketBoard_title}</a></td>
						    <td>${list.member_Id}</td>
						    <td><fmt:formatDate value="${list.ticketBoard_regDate}" pattern="yyyy.MM.dd" /></td>
						    <td class="num">${list.ticketBoard_readcount}</td>
					    </tr>                
					    </c:forEach>
                    
				</tbody>
				</table>
			</div>
			<?xml version="1.0" encoding="utf-8"?>

		</div>
	</div>
	<!-- //Contents End -->