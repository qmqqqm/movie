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
<c:set var="eventInform" value="${eventMap.eventInform}"/>
<c:set var="eventImage" value="${eventMap.imageList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 생성하기</title>

<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/event/modifyEvent.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>

<h1 id="modifyEvent_h1">Modify Event</h1>

<form action="${contextPath}/modifyEventInfo.do" name="frm_mod_event"   method="post"  enctype="multipart/form-data">
	<table id="modify_table">
		<input type="hidden" value="${eventInform.event_isshow}" name="event_isshow"/>
		<tr>
			<td>글번호</td>
			<td><span id="mEvent_id">${eventInform.event_id}</span>
				<input type="hidden" value="${eventInform.event_id}" name="event_id"/>
			</td>
		</tr>
		<tr>	
			<td>작성일</td>
			<td><span id="mEvent_wday">${eventInform.event_wday}</span>
				<input type="hidden" value="${eventInform.event_wday}" name="event_wday"/></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><select id="mEvent_category" name="event_category">
				<c:forEach  var="category"  items="${categoryList}">
						<option id ="cat" value="${category}">${category}</option>
				</c:forEach>
				</select>
				<script type="text/javascript">
					var choose = "${eventInform.event_category}";
					var option = document.getElementById("event_category").options;
							for(i = 0; i < option.length; i++){
								if(option[i].value == choose){
									option[i].selected = true;
									break;
									}
							}
				</script>
			</td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" name="event_title" id="mEvent_title" size="50" value="${eventInform.event_title}"></td>
		</tr>
		<tr>
			<td>기간</td>
			<td>시작일 &nbsp; : &nbsp; <input type="date" id="mEvent_start" name="event_start" value="${eventInform.event_start}"> <br><br>
				종료일 &nbsp; : &nbsp; <input type="date" id="mEvent_end" name="event_end" value="${eventInform.event_end}">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="mEvent_textarea" name="event_content"> ${eventInform.event_content}
				</textarea></td>
		</tr>	
		<tr>
			<td>이벤트 이미지</td>
			
			<td><div id="fileDiv">
				<c:forEach var="imageList" items="${eventImage}" varStatus="cnt">
					<c:choose>
						 <c:when test="${cnt.index == 0}"> <%--main image 일때 --%>
							main이미지:  ${imageList.event_image_filename} 
							<input type="hidden" name="main_image" value="${imageList.event_image_id}"/>
							<input type="file" name="main_image" id="f_main_image" />
						</c:when>
						<c:otherwise> <%--detail 이미지 일때 --%>
						<p>
							detail_ ${cnt.index} 이미지:  ${imageList.event_image_filename}  
							<input type="hidden" name="detail_image${cnt.index}" value="${imageList.event_image_id}"/>
							<input  type="file" name="detail_image${cnt.index}"/>
							<button type="button"  id="delete_${cnt.index}" name="delete_${cnt.index}">삭제</button>
							
						</p>
						</c:otherwise>
					</c:choose>
					
					
				</c:forEach></div>
				<br>
				<button type="button"  value="파일 추가" id="add">추가</button>
			</td>
		</tr> 
	</table>
	
	<div id ="modifyBtns">
		<button type="submit"  value="파일 수정 " id="modify">수정하기</button>
		<button type="button"  value="취소하기 " id="back">취소하기</button>
		
	</div>
</form>

<script>
var gfv_count = '${fn:length(imageList)+1}';

$(document).ready(function(){
	
	$("button[name^='delete']").on("click",function(e){
        e.preventDefault();
        alert("delete click 성공");
        fn_fileDelete($(this));
    })
    $("#add").on("click",function(e){
        e.preventDefault();
        alert("addclick 성공");
        fn_fileAdd($(this));
    })
    
    
    $("#back").on("click", function(){
    	location='<%=request.getContextPath()%>/adEventList.do';
    })
});

function fn_fileDelete(obj){
            obj.parent().remove();
        }

function fn_fileAdd(){
    var str = "<p>" + "detail_ "+ gfv_count+" 이미지:  "+
    			"<input  type='file' name='detail_image" + gfv_count + "' />"+
            	"<button type='button' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</button>" +
      		  "</p>";
    $("#fileDiv").append(str);
    $("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_fileDelete($(this));
    });
  
} 
</script> 
</body>
</html>