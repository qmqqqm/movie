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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script>
	$(function(){
		$("#loc").on("change",function(){
			$("#sang").empty();
			if($("#loc option").index($("#loc option:selected"))==0){
				return;
			};//if
			var location = $("#loc option:selected").val();
			
			$.ajax({             
	            type : "get",
	            url : "./theaterpopuploc.do",
	            data : {"location" :location},
	            dataType:"json",
	            error : function(){
	            	alert("에러!");
	            },
	            success : function(data){
	            	var a = data.theList
	            	for(i=0;i<a.length;i++){
	            	var str = "<option>"+a[i]+"</option>"
	            	$("#sang").append(str);
	            	}
	            }
	             
	        });
		})
		
		
	$("#btn").click(function() {
			var location = $("#sang option:selected").val().trim();
			for (i = 0; i < $(".sel").length; i++) {
				if($(".sel").eq(i).text()==location){
					alert("이미존재하는 극장입니다")
					return;
				}
				if (!$(".sel").eq(i).text()) {
					$(".sel").eq(i).text(location) //중복확인해서 못들어가게
					return;
				}//if
			}//for
		})
		
		$(".xbox").click(function(){
			var ind = $(".xbox").index(this)
			$(".sel").eq(ind).text("");
			for(i=ind; i<$(".sel").length;i++){
				$(".sel").eq(i).text($(".sel").eq(i+1).text());
			}
			
		})
		
		$("#can").click(function(){
			window.close();
		})
		
		$("#regend").click(function(){
			//값을 부모에게 보내기
			for(i=0; i<$(".sel").length;i++){
			$(opener.document).find(".bookmark").eq(i).text($(".sel").eq(i).text())
			}
			//값을 db에보내기 ~~~~~~~~~~
			//세션에서 유저번호와 현재의 값들을 아작스를 통해 보내고 테이블에 저장
			//본창에 다시 들어 갈때는 컨트롤러에서 값을 받아서 뿌려주기
			var member_id = $("#member_id").val();
			var bookmark_fir = $(".sel").eq(0).text();
			var bookmark_se = $(".sel").eq(1).text();
			var bookmark_th = $(".sel").eq(2).text();
			var bookmark_fo = $(".sel").eq(3).text();
			var bookmark_fiv = $(".sel").eq(4).text();
			
			$.ajax({             
		            type : "get",
		            url : "./theaterajxPopUpreg.do",
		            data : {"member_id" : member_id,
		            		"bookmark_fir" : bookmark_fir,
		            		"bookmark_se" : bookmark_se,
		            		"bookmark_th" : bookmark_th,
		            		"bookmark_fo" : bookmark_fo,
		            		"bookmark_fiv" : bookmark_fiv
		            		},
		            dataType:"json",
		            error : function(){
		            	alert("등록완료")
					window.close();
		            },
		            success : function(data){	
		               
					window.close();
		            }
		             
		        });//$.ajax
			
		})
		
	})//$(function()
</script>
<style type="text/css">
.sel{
display: inline-block;
width: 200px;
height: 50px;
border: 1px solid black;
overflow: auto;
}

#contain{
width: 800px;
height: 110px;     
}

#btncon{
position: relative;
top: 100px;
text-align: center;
width: 600px;
height: 110px;
}

.xbox{
position:relative;
right:32px;
bottom:25px;
padding: 10px 10px 20px 10px;
background: pink;
color:white;
}
</style>
<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>즐겨찾기 팝업창</title>
</head>
<body>
<div>
<h3 style="background: pink; color: white; margin: 0px 0px 10px 0px; padding: 5px;">자주가는 늘봄극장 설정</h1>
</div>
<div>
<div>영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다</div>
	<select id="loc">
	<option>지역선택</option>
		<c:forEach items="${locationList}" var="locationList">
			<option>${locationList}</option>
		</c:forEach>
	</select>
	
	<select id="sang">
	<option>늘봄극장 선택</option>
	</select>
	
	<button id="btn" style="background: pink; color: white;">자주가는 늘봄극장 추가</button>
</div>
<c:if test="${not empty selectBookMark}">
<div id="contain">
<h4>${memberDTO.member_name}님이 자주가는 늘봄극장</h4>
	<div class="sel">${selectBookMark.bookmark_fir}</div>
	<span class="xbox">x</span>
	<div class="sel">${selectBookMark.bookmark_se}</div>
	<span class="xbox">x</span>
	<div class="sel">${selectBookMark.bookmark_th}</div>
	<span class="xbox">x</span>
	<div class="sel">${selectBookMark.bookmark_fo}</div>
	<span class="xbox">x</span>
	<div class="sel">${selectBookMark.bookmark_fiv}</div>
	<span class="xbox">x</span>
</div>
</c:if>
<c:if test="${empty selectBookMark}">
<div id="contain">
<h4>${memberDTO.member_name}님이 자주가는 늘봄극장</h4>
	<div class="sel"></div>
	<span class="xbox">x</span>
	<div class="sel"></div>
	<span class="xbox">x</span>
	<div class="sel"></div>
	<span class="xbox">x</span>
	<div class="sel"></div>
	<span class="xbox">x</span>
	<div class="sel"></div>
	<span class="xbox">x</span>
</div>
</c:if>
<input type="hidden" value="1<%-- ${memberDTO.member_id} --%>" id="member_id">
<div id="btncon">
<button style="background: window; color: gray; margin: 0px 10px 0px 0px;" id="can">취소</button>
<button style="background: red; color: white;" id="regend">등록</button>
</div>
</body>
</html>