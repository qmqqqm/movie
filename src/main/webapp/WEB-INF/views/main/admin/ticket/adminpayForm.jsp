<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
            <li class=''><a href="support.do">예약관리<i></i></a></li>
            <li class='on'><a href="adminpayForm.do">매출관리<i></i></a></li>
            <li class=''><a href="ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="../user/login/index08fe.html">~~~<i></i></a></li>
            <li class=''><a href="../user/login/indexf961.html">~~<i></i></a></li>
            <li class=''><a href="lease/default.html">~~<i></i></a></li>            
          
            
          
        </ul>
         
    </div>
  
</div >		
<div class="contentbody">
<script>
$(document).ready(function () {
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
	$( "#startDate" ).datepicker({ 
		changeMonth: true, changeYear: true, 
		nextText: '다음 달', 
		prevText: '이전 달', 
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], 
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
		dateFormat: "yymmdd", 
		maxDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) 
		onClose: function( selectedDate ) { //시작일(startDate) datepicker가 닫힐때 //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정 
			$("#endDate").datepicker( "option", "minDate", selectedDate ); } }); 
	
	$( "#endDate" ).datepicker({ 
		changeMonth: true, changeYear: true, 
		nextText: '다음 달',
		prevText: '이전 달', 
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], 
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
		dateFormat: "yymmdd", 
		maxDate: 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가) 
		onClose: function( selectedDate ) { // 종료일(endDate) datepicker가 닫힐때 // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정 
			$("#startDate").datepicker( "option", "maxDate", selectedDate ); } }); }); 
			
	</script>

		<form action="admindatepay.do">
		<p>기간선택 :<input type="text" name="startDate" id="startDate">~<input type="text" id="endDate" name="endDate"><input type="submit" value="매출조회"/></p>
		</form>
		<br/>
		<c:if test="${total !=null}">
		총 매출액: ${total}
		</c:if>
		<c:if test="${datetotal !=null}">
		기간 매출액: ${datetotal}
		</c:if>
		<table>
		<tr>
		<th>번호</th>
		<th>날짜</th>
		<th>매출금액</th>
		</tr>
		<c:forEach items="${paylist}" var="list">
		<tr>
		<td>${list.ticket_id}</td>
		<td>${list.ticket_date}</td>
		<td>${list.ticket_price}</td>
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