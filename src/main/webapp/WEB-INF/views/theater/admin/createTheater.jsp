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
<title>새로운 영화관 만들기</title>
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

	function add(){
		var location = prompt('지역을 추가하세요','지역명');
		alert(location);
		
		var op = new Option();
		op.value=location;
		op.text=location;
		
		document.forms["frm"].theater_location.add(op);
	}

	function del(){
		
		var loc = document.getElementById("theater_location");
		var locIndex = document.getElementById("theater_location").options.selectedIndex;
		
		loc.options[locIndex].remove();
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
	<form name="frm" action="${contextPath}/createTheater.do" method="post">
		<table id="createTheater">
			<caption>New 영화관</caption>
			<tr>
				<td width="20%">지역</td>
				<td width="30%">
					<select name="theater_location" id="theater_location">
						<c:forEach  var="location"  items="${locationList}">
							<option class="location">${location}</option>
						</c:forEach>
					</select>
					<button type="button" onclick="add()">추가</button>
					<button type="button" onclick="del()">삭제</button>
				</td>
			</tr>
			<tr>
				<td width="20%">이름</td>
				<td width="30%">
					<input type="text" size="40" name="theater_name"/>
				</td>
			</tr>
			<tr>
				<td width="20%">주소</td>
				<td width="30%">
					<input type="text" size="40" name="theater_address"/>
				</td>
			</tr>
			<tr>
				<td width="20%">전화번호</td>
				<td width="30%">
					<input type="text" size="40" name="theater_phone"/>
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
<!-- 			</tr>
				<td>상영관</td>
				<td>
					<label><input type="checkbox" name="sangyg_id" value="1/100"/>1관(100석)</label>
					<label><input type="checkbox" name="sangyg_id" value="2/90"/>2관(90석)</label>
					<label><input type="checkbox" name="sangyg_id" value="3/80"/>3관(80석)</label>
					<label><input type="checkbox" name="sangyg_id" value="4/70"/>4관(70석)</label>
					<label><input type="checkbox" name="sangyg_id" value="5/60"/>5관(60석)</label>
				</td>
			<tr> -->
				<td colspan="2">
					<button type="submit">확인하기</button>
					<button type="button" onClick="location='<%=request.getContextPath()%>/showTheaterList.do'">취소하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>