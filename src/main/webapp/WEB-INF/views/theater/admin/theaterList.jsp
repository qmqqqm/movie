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
<title>영화관 LIST</title>
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/theater/theaterList.css" />
<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	function more_Content(id, cnt){
	
		
		var list_length = $("#" + id + " tr").length - 1;
		var aname = id + "_btn";
		var cellLength = list_length;
		
		$("#startCnt").val(cellLength);
		$("#viewCnt").val(cnt);
    	
		$.ajax({             
            type : "post",
            url : "./moreTheaterInform.do",
            data : {"startCnt":$("#startCnt").val(),
            		"viewCnt":$("#viewCnt").val()},
            dataType:"json",
            error : function(){
            	alert("에러!");
            },
            success : function(data){	
            	var list = data.theaterList;
  				
            	
            		if(list != ''){
            			$("#" + aname).attr('href',"javascript:more_Content('more_list', 10)");
            			getMoreList(list);
            		}else{
            			$("#" + id +"_div").remove();
            		}	
            	
            	}
            
             
        });//$.ajax
	}
	function getMoreList(list){
		var content="";
		var length = list.length;
		
		for(i = 0; i < length; i++){
			content += "<tr>";
			content += "<td>" + list[i].theater_id + "</td>";
			content += "<td>" + list[i].theater_location + "</td>";
			content += "<td>" + list[i].theater_name + "</td>";
			content += "<td>" + list[i].theater_address + "</td>";
			content += "<td>" + list[i].theater_phone + "</td>";
			content += "<td>" + list[i].theater_isshow + "</td>";
			content += "<td>" + list[i].image_id + "</td>";
			content += "<td><button type='button'" + "onclick='location.href='<%=request.getContextPath() %>/deleteTheater.do?theater_id=list[i].theater_id'" + ">삭제</button></td>";
			content += "<td><button type='button'" + "onclick='location.href='<%=request.getContextPath() %>/modifyTheaterForm.do?theater_id=list[i].theater_id'" + ">수정</button></td>";
			content += "<td><button type='button'" + "onclick='location.href='<%=request.getContextPath() %>/timeList.do?theater_id=list[i].theater_id&theater_name=list[i].theater_name'" + ">상영시간표</button></td>";
	 		content += "</tr>";
	 		
	 	
		}
		$("#more_list tr:last").after(content);
	}
</script>
</head>
<body>


        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">운영자</a>
                            </li>
                        
                            <li  class="last">
                             			극장 관리
                            </li>
                        
                        
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->
	<div class="cols-content">
<div class="col-aside">
    <h2>
   		운영자관리 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=''><a href="${contextPath}/adminchk.do">운영자 관리 메인<i></i></a></li>
            <li class=''><a href="${contextPath}/member/memberList.do">회원 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do">예매문의 관리<i></i></a></li>          
            <li class=''><a href="${contextPath}/adEventList.do">이벤트 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItemList.do">분실물 문의 관리<i></i></a></li>
            <li class='on'><a href="${contextPath}/showTheaterList.do">극장 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/movie/movieList.do">영화 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adminTicketForm.do">예매 관리<i></i></a></li>
        </ul>
    </div>
</div>		
		


<div id="theaterList_wrap">
	<h1 id="theaterList_h1">Theater List</h1>
	<div id="theaterList_createTh">
			<a href="<%=request.getContextPath()%>/createTheaterForm.do" id="createTh_a">새로운 영화관 추가</a>
			<a href="<%=request.getContextPath()%>/theaterImage.do" id="createTh_b">새로운 영화관 이미지 추가</a>	
	</div>
		
	<form>
		<input type="hidden" id="viewCnt" name="viewCnt" value="0" />
		<input type="hidden" id="startCnt" name="startCnt" value="0" />
		
		<table id="more_list" border="1">
			<thead>
				<tr>
					<th width="80">번호</th>
					<th width="100">지역</th>
					<th width="200">영화관명</th>
					<th width="800">주소</th>
					<th width="200">전화번호</th>
					<th width="100">노출여부</th>
					<th width="180">이미지번호</th>
					<th width="60">삭제</th>
					<th width="60">수정</th>
					<th width="250">상영시간표</th>
				</tr>
			</thead>
			<tbody>
				
				<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
				<c:forEach  var="theater"  items="${theaterList}">
				<tr>
	
					<td width="60">${theater.theater_id}</td>
					<td width="100">${theater.theater_location}</td>
					<td width="150">${theater.theater_name}</td>
					<td width="300">${theater.theater_address}</td>
					<td width="100">${theater.theater_phone}</td>
					<td width="60">${theater.theater_isshow}</td>
					<td width="60">${theater.image_id}</td>
					<td width="60"><button type="button" onclick="location.href='<%=request.getContextPath() %>/deleteTheater.do?theater_id=${theater.theater_id}'">삭제</button></td>
					<td width="60"><button type="button" onclick="location.href='<%=request.getContextPath() %>/modifyTheaterForm.do?theater_id=${theater.theater_id}'">수정</button></td>
					<td  width="70"><button type="button" onclick="location.href='<%=request.getContextPath() %>/timeList.do?theater_id=${theater.theater_id}&theater_name=${theater.theater_name}'">상영시간표</button></td>
				</tr>
			
				</c:forEach>
				
				</tbody>
		</table>	
		<div id="more_list_div">
			<a id = "more_list_btn" href="javascript:more_Content('more_list', 10)">더보기 </a>
	
		</div>
			
	
	</form>	
</div>
</div>

</body>
</html>