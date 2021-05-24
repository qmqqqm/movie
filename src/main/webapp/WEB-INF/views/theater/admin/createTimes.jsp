<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표 만들기</title>
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/theater/createTimes.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function(){ 
	
	$('#day').append("<option value=''>" + "선택" + "</option>");
	//오늘 날짜부터 7일치를 날짜 select 문에 저장
	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = currentDay.getMonth();
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();
	
	var thisweek = "";

	for(i = 0; i < 7; i++){
		var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
		var yyyy = resultDay.getFullYear();
		var mm = Number(resultDay.getMonth()) + 1;
		var dd = resultDay.getDate();
		
		 mm = String(mm).length === 1 ? '0' + mm : mm;
		 dd = String(dd).length === 1 ? '0' + dd : dd;

		thisweek = yyyy + '-' + mm + '-' + dd;
		var str = "<option value='"+ thisweek + "'>" +thisweek + "</option>"; 
		$('#day').append(str);
	}
	
	$('#clock').append("<option value=''>" + "선택" + "</option>");
	for(i = 0; i < 24; i++){
		var hh = i;
		
		hh = String(hh).length === 1  ? '0' + hh : hh;
		var str = "<option value='"+ hh + "'>" +hh + "</option>"; 
		$('#clock').append(str);
	}
	$('#minutes').append("<option value=''>" + "선택" + "</option>");
	for(i = 0; i < 59; i++){
		var ss = i;
		
		ss = String(ss).length === 1  ? '0' + ss : ss;
		var str = "<option value='"+ ss+ "'>" +ss + "</option>"; 
		$('#minutes').append(str);
	}
	
	$("#location").change(function (){
		$('#theater').empty();
		$('#theater').append("<option value=''>" + "선택" + "</option>");
			<c:forEach  var="theaters"  items="${theaterList}">
				if ($(this).val() == "${theaters.theater_location}") {
					var str = "<option value='${theaters.theater_id}'>" + "${theaters.theater_name}" + "</option>";
					$('#theater').append(str);
				} 
			</c:forEach>
	
	
	}); //지역을 선택하면 그에 해당하는 영화관 
	
	//영화관을 선택하면 그에 해당하는 상영관
	$("#theater").change(function (){
		$('#sangyg').empty();
		$('#sangyg').append("<option value=''>" + "선택" + "</option>");
		
		//아작스로 theater_id 별 상영 테이블 정보를 가져오자.
		theater_id = $(this).val();
		$.ajax({             
            type : "get",
            url : "./adsangygInform.do",
            data : {"theater_id":theater_id},
            dataType:"json",
            error : function(){
            	alert("에러!");
            },
            success : function(data){	
            	var sangyg = data.sangyg;
            	
            	for(i = 0; i < sangyg.length; i++){
            		
					var str = "<option value='"+ sangyg[i].sangyg_id + "'>" + sangyg[i].sangyg_id +"관" + "</option>";
						str += "<input type='hidden' value='"+sangyg[i].sangyg_seats + "' name='sangyg_seat'/>";
					$('#sangyg').append(str);
				} 
            }
             
        });//$.ajax-> Sangyg 테이블을 사용하여 총 상영관 개수와 좌석 수를 가져온다.
	}); 
	$('#back').on('click',function(){
		
		location.href='<%=request.getContextPath()%>/showTheaterList.do';
	});

	
}); 
</script>
</head>
<body>
<div id="createTimes_wrap">
	<h1  id="createTimes_h1">새로운 시간표 생성</h1>
	<form name="frm" action="${contextPath}/createTimes.do" method="post">
	<table id="createTime_table">
		<tr>
			<td>영화선택</td>
			<td>
				<select id="movie" name="movie_id">
				<option value="">선택</option>
				<c:forEach var="movie" items="${movieList}">
					<option value="${movie.movie_id}">${movie.movie_title}</option>
				</c:forEach>
				</select>
			</td>			
		</tr>
		<tr>
			<td>영화관 선택</td>
			<td>
				<select id="location" name="theater_location">
					<option value="">선택</option>
					<c:forEach  var="location"  items="${locationList}">
						<option value="${location}">${location}</option>
					</c:forEach>
				</select>
	
				<select id='theater' name='theater_id'>
				</select>	
			</td>			
		</tr>
		<tr>
			<td>상영관 선택</td>
			<td>
				<select id='sangyg' name='sangyg_id'>
				</select>
			</td>			
		</tr>
		<tr>
			<td>날짜 선택 </td>
			<td>
				<select id='day' name='day'>
				</select>
		
				<select id='clock' name='hh'>
				</select>
		
				<select id='minutes' name='mm'>
				</select>
			</td>			
		</tr>
	</table>
	
	<div id="createTimes_btns">
		<button type="submit"  id="createTimes_sub">확인하기</button>
		<button type="button" id="back" >뒤로가기</button>
	</div>
	</form>
</div>
	
</body>
</html>