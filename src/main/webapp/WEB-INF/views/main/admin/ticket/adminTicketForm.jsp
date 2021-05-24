<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.contentbody{
width:80%;
float: left;
}
</style>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">관리메뉴</a>
                            </li>
                        
                            <li  class="last">
                                예약관리
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
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class='on'><a href="support.do">예약관리<i></i></a></li>
            <li class=''><a href="adminpayForm.do">매출관리<i></i></a></li>
            <li class=''><a href="ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="../user/login/index08fe.html">~~~<i></i></a></li>
            <li class=''><a href="../user/login/indexf961.html">~~<i></i></a></li>
            <li class=''><a href="lease/default.html">~~<i></i></a></li>            
          
            
          
        </ul>
         
    </div>
  
</div >		
<div class="contentbody">
		<!-- 111	 -->
		<table>
		<tr>
		<th>번호</th>
		<th>회원</th>
		<th>영화</th>
		<th>극장</th>
		<th>상영관</th>
		<th>날짜</th>
		<th>시간</th>
		<th>결제금액</th>
		<th>인원</th>
		<th>좌석</th>
		<th>예약관리</th>
		</tr>
		<c:forEach items="${reserve}" var="item" varStatus="number">
		<tr>
		<td>${item.ticket_id}</td>
		<td>${item.member_userid}</td>
		<td>${item.movie_id}</td>
		<td>${item.theater_id}</td>
		<td>${item.sangyg_id}</td>
		<c:set value="${item.ticket_date}" var="ticketdate"/>		
		<td >${fn:substring(ticketdate,0,10)}</td>
		<c:set value="${item.ticket_time}" var="tickettime"/>		
		<td>${fn:substring(tickettime,10,16)}</td>
		<td>${item.ticket_price}</td>
		<td>${item.ticket_quantity}</td>
		<td>${item.ticket_seats}</td>
		<td><a href="./ticketcancle.do?ticket_id=${item.ticket_id}"><input type="button" value="예약취소"/></a></td>
		</tr>
		
		</c:forEach>
		</table>
		</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->


            <!--/ 사이드바 End -->

		</div>
		<!-- /Contents Area -->
		
	</div>
	<!-- /Contaniner --> 
    <div class="com_pop_wrap">
		<div class="com_pop_fog"></div>
	</div>