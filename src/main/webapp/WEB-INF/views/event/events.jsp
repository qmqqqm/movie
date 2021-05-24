<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Event</title>
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/event/events.css" />
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
function more_Content(id, cnt, cate){
	
	var list_length = $("#" + id).children('div').length;
	
	var cellLength = list_length;
	
	$("#startCnt").val(cellLength);
	$("#viewCnt").val(cnt);
	
	$.ajax({             
        type : "post",
        url : "./moreEventInform.do",
        data : {"startCnt":$("#startCnt").val(),
        		"viewCnt":$("#viewCnt").val(),
        		"category" : cate},
        dataType:"json",
        error : function(){
        	alert("에러!");
        },
        success : function(data){	
			
        	var list = data.eventInform;
        		if(list != ''){
        			getMoreList(list, id);
        		}else{
        			$("#more_list_div").empty();
        			$("#more_list_div").removeAttr( 'style' );
        		}	
        	
        	}
        
         
    });//$.ajax
}
function getMoreList(list, id){
	
	var content="";
	var length = list.length;
	
	
	for(i = 0; i < length; i++){
		content += "<div id='eventInfo'>";
		content += "<img src='${contextPath}/eventList_image.do?event_id="+list[i].event_id+"&fileName="+list[i].event_image_filename+"'/><br>";
		content += "<div class='events_title'>" + list[i].event_title + "</div>";
		content += "<div class='events_period'>" + list[i].event_start + " ~ " + list[i].event_end + "</div>";
		content += "</div>";
		
	}
	$("#" + id).children('div:last').after(content);

}
	
$(function (){
	
	
	
	//이벤트 종류를 누르면 해당하는 이벤트 보여주기
	$(".categoryBtn").on("click",function (){
		var category = $(this).text();

		$("#ul_category").find('span').removeClass('on');
		$(this).children("span").addClass("on");

		$.ajax({             
	        type : "post",
	        url : "./eventInform.do",
	        data : {"category" : category},
	        dataType:"json",
	        error : function(){
	        	alert("에러!");
	        },
	        success : function(data){	
				
				$("#main_info").empty();
				$("#more_list_div").empty();
	        	var list = data.events;
	        	
	        	
	        	var content ="";
				content += "<h2 id='events_h2Category'>"+category+"</h2>";
				for(i = 0; i < list.length; i++){
	        	content += "<div id='eventInfo'>";
	        	content += "<a href='${contextPath}/eventDetail.do?event_id=" + list[i].event_id + "'>";
	        	content += "<img src='${contextPath}/eventList_image.do?event_id="+list[i].event_id+"&fileName="+list[i].event_image_filename+"'/><br>";
	        	content += "<div class='events_title'>"+  list[i].event_title + "</div>";
	        	content += "<div class='events_period'>" + list[i].event_start  + " ~ " + list[i].event_end +"</div> ";
	        	content += "</a>";
	        	content += "</div>";
	        	}
				
				$("#main_info").append(content);
				$("#more_list_div").append(
						"<a id ='more_list_btn'href="+ "javascript:more_Content('main_info',6,'" + category + "')>더보기 </a>"
				);
				$("#more_list_div").css({"text-align":"center", "height":"40px", "margin-top":"15px", "background":"pink"
										," display":"absolute"});
			
	        }
	        
	         
	    });//$.ajax
	   
	});//$(".categoryList").on("click",function)
	
	 $("#category_2").trigger("click");// 기본 설정
	
});


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
                                <a href="index.html">고객센터</a>
                            </li>
                        
                            <li class="last"> 이벤트  </li>
                    </ul>
                </div>
            </div>
          </div>
                
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
		            <li class='on'><a href="${contextPath}/events.do">이벤트<i></i></a></li>
		            <li class=''><a href="${contextPath}/lostItem.do">분실물 문의<i></i></a></li>
		            <li class=''><a href="${contextPath}/list.do">자유게시판<i></i></a></li>            
		          
		            
		          
		        </ul>
		    </div>
		  
		</div><!-- col-aside -->
	
		<div id="events_content">
			<form>
				<input type="hidden" id="viewCnt" name="viewCnt" value="0" />
				<input type="hidden" id="startCnt" name="startCnt" value="0" />
			</form>
			
				<h1 id="events_h1">EVENT</h1>
			
				<div id="events_menudiv">
					<table id="events_menu">
						<tr>
							<td>
								<ul id="ul_category">
									<c:forEach  var="category"  items="${categoryList}" varStatus="cnt">
										<li><button type="button" id="category_${cnt.index}"class="categoryBtn" value="${category}"><span class="">${category}</span></button></li>
									</c:forEach>
								</ul>
							</td>	
						</tr>
					</table>
				</div>
				
				<hr/>
				
				<div id="main_info">	
				</div>
				
				<div id="more_list_div">
				</div>
			
		</div><!-- events_content div 마감 -->
	</div><!-- cols-content  -->
</div>
</body>
</html>