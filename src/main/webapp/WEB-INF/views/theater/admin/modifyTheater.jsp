<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 정보 수정 </title>
<style>
#createTheater{
	text-align:center;
	margin:0 auto;
	width:50%;
}
table,tr,td{
	border:1px solid;
}
td{
	padding:10px;
}

#imgshow {
  width: 300px;
  height: 300px;
  object-fit:cover;
}

</style>

<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	window.onload = function(){
 
		var choose = "${theaterInform.theater_location}";
		
		for(var k=0; k<$(".imgs").length;k++){
			if($(".imgs").eq(k).val()==$("#image_id").val()){
				$(".imgs").eq(k).prop("selected",true);
				
				var imgNum = $("#imgsel option:selected").val();
				var indNumber = $("#imgsel option:selected").index();
				var filename = $(".filenames").eq(indNumber).val();
				var imgname = "<spring:url value ='/images/"+imgNum+"/"+filename+"'/>"
				$("#imgshow").attr("src",imgname);
				
			}
		}
	
		<c:forEach  var="location"  items="${locationList}">
			var op = new Option();
			op.value="${location}";
			op.text="${location}";
			
			document.forms["frm"].theater_location.add(op);
		</c:forEach>
		
		var option = document.getElementById("theater_location").options;
		for(i = 0; i < option.length; i++){
			if(option[i].value == choose){
				option[i].selected = true;
				break;
				}
		}
		
		
	}

</script>


<script>
$(function(){
	$("#imgsel").change(function(){
		
		var imgNum = $("#imgsel option:selected").val();
		var indNumber = $("#imgsel option:selected").index();
		var filename = $(".filenames").eq(indNumber).val();
		var imgname = "<spring:url value ='/images/"+imgNum+"/"+filename+"'/>"
		$("#imgshow").attr("src",imgname);
	})
})
</script>
</head>
<body>
	<form name="frm" action="${contextPath}/modifyTheater.do" method="post">
		<table id="createTheater">
			<caption>영화관 수정하기</caption>
			<input type="hidden" name="theater_id" value="${theaterInform.theater_id}"/>
			<tr>
				<td width="20%">지역</td>
				<td width="30%">
					<select name="theater_location" id="theater_location">
						<%-- 1<option class="location">${location}</option> --%>
					</select>
				</td>
			</tr>
			<tr>
				<td width="20%">이름</td>
				<td width="30%">
					<input type="text" size="40" name="theater_name" value="${theaterInform.theater_name}"/>
				</td>
			</tr>
			<tr>
				<td width="20%">주소</td>
				<td width="30%">
					<input type="text" size="40" name="theater_address" value="${theaterInform.theater_address}"/>
				</td>
			</tr>
			<tr>
				<td width="20%">전화번호</td>
				<td width="30%">
					<input type="text" size="40" name="theater_phone" value="${theaterInform.theater_phone}"/>
				</td>
			</tr>
			<tr>
				<td width="20%">노출여부<br>소문자로  n 또는  y</td>
				<td width="30%">
					<input type="text" size="40" name="theater_isshow" value="${theaterInform.theater_isshow}"/>
				</td>
			</tr>
			<tr>
			<td width="20%">극장이미지선택</td>
				<td width="30%">
					<select id="imgsel" name="Image_id">
						<c:forEach items="${theaterImageList}" var="theaterImag">
							<option class="imgs" value="${theaterImag.image_id}">${theaterImag.image_id}</option>
						</c:forEach>
					</select>
						<c:forEach items="${theaterImageList}" var="theater">
							<input class="filenames" type="hidden" value="${theater.filename}"/>
						</c:forEach>
				</td>
			</tr>
			<tr id="imgBox">
				<td width="100px">극장이미지 미리보기</td>
				<td width="350px">
					<img id="imgshow" src="<spring:url value ='/images/1/1.jpg'/>"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" id="image_id" value="${theaterInform.image_id}">
					<button type="submit">확인하기</button>
					<button type="button" onClick="location='<%=request.getContextPath()%>/showTheaterList.do'">취소하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>