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
<script type="text/javascript">

  var cnt=0;

  function fn_addFile(){    
        $("#d_file").append("<br>"+"<input  type='file'  class='detail_im'  name='detail_image"+cnt+"' />");
     cnt++;
  }
  
  //매개변수 obj에는 user가 폼을 통해 입력한 정보(상품정보+이미지파일등)가 담긴 form
  function fn_add_new_goods(obj){
	  //user가 입력한 첫번쨰 이미지명
	  for(i=0;i<$('.detail_im').length;i++){
		  var file = $('.detail_im').eq(i).val();
       if(file == null || file == undefined || file=="" ){
    	   alert("이미지를 다 채워주세요");
    	   return
       }
	  }//for
	  obj.submit();
   }
</script>

<%--  tiels관련xml문서에서 정의한 <put-attribute name="title"	value="~" />을 적용하는 부분  --%>
<title>극장 이미지 추가</title>
</head>
<body>
<form action="${contextPath}/admin/theaterImagePlus.do" method="post"  enctype="multipart/form-data">
	<h4>상품이미지</h4>
	            <table>
	               <tr>
	                  <td align="right">이미지파일 첨부</td>
	               <td align="left"><input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
	               <td>
	                  <div id="d_file">
	                  </div>
	               </td>
	               </tr>
	            </table>
	            <input  type="button" value="극장이미지 등록하기"  onClick="fn_add_new_goods(this.form)"/>
</form>
</body>
</html>