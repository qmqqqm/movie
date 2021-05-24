<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("select[name='emailSiteSelect']").change(function(){
		var idxSelect = $("select[name='emailSiteSelect'] option").index( $("select[name='emailSiteSelect'] option:selected"));
		 selectVal=$("select[name='emailSiteSelect']").val();
			if(idxSelect==6){
				$("input[name='emailSite']").prop('value',"");
				$("input[name='emailSite']").attr('readonly',false);
			}else{
				$("input[name='emailSite']").prop('value',selectVal);
				$("input[name='emailSite']").attr('readonly',true);
			}
		});
	$("#joingFrm").submit(function(){
			
			if(!$("input[name='member_email']").val()){
				alert("이메일 필수입력입니다");
				$("input[name='member_email']").focus();//포커스위치
				return false;//함수종료
			}
			var idx = $("select[name='emailSiteSelect'] option").index( $("select[name='emailSiteSelect'] option:selected"));
			if(idx<1){
				alert("사이트주소를 선택해주세요");
				$("select[name='emailSiteSelect']").focus();//포커스위치
				return false;//함수종료
			}
			
	});

});
</script>
<title>회원가입</title>
</head>
<body>
	<h2>joinForm.jsp</h2>
	<hr/>
	<form name="joingFrm" id="joingFrm" method="GET"
				action="${contextPath}/member/joinMember.do">
		<table border="1" width="400">
			<caption>회원가입</caption>
			<tr>
				<th width="150"><h2>아이디</h2></th>
				<td width="250" style="padding-right: 190px">
					<input type="text" name="member_userid" id="member_userid" required="required" />
				</td>
			</tr>
			<tr>
				<th width="150"><h2>비밀번호</h2></th>
				<td width="450" id="member_pwd" style="padding-top: 15px; padding-right: 190px">
					<input type="password" name="member_pwd" id="member_pwd" required="required" />
				</td>
			</tr>
			<tr>
				<th width="150"><h2>이름</h2></th>
				<td width="450" style="padding-top: 15px; padding-right: 190px">
					<input type="text" name="member_name" id="member_name" required="required" />
				</td>
			</tr>
			<tr>
				<th width="150"><h2>주민번호</h2></th>
				<td width="450" style="padding-top: 15px; padding-right: 190px">
					<input type="text" name="member_jumin" id="member_jumin" required="required" />
				</td>
			</tr>
			<tr>
				<th width="150"><h2>번호</h2></th>
					<td width="450" style="padding-top: 5px; padding-left: 73px;">
						<select name="ponnumber1">
						   <option selected value="010">010</option>
						   <option value="011">011</option>
						   <option value="016">016</option>
						   <option value="019">019</option>
					   </select>
						&nbsp;-&nbsp;&nbsp;<input type="text" name="member_tel" maxlength="4"/>
						&nbsp;-&nbsp;&nbsp;<input type="text" name="member_tel2" maxlength="4"/>
						<input type="hidden" name="ponnumber" />
						<c:if test="${errors.ponnumber}">번호를 입력학세요.</c:if>
					</td>
			</tr>
			<tr>
				<th width="150"><h2>email</h2></th>
				<td width="450" style="padding-top: 15px; padding-left: 100px;"><input type="text" name="member_email" value="">&nbsp;@  
										<input type="text" name="emailSite" readonly>	
										 <select name="emailSiteSelect">
									 		<option>선택하세요</option>
										   <option value="naver.com">naver.com</option>
										   <option value="daum.net">daum.net</option>
										   <option value="gmail.com">gmail.com</option>
										   <option value="nateon.com">nateon.com</option>
										   <option value="hanmail.com">hanmail.com</option>
										   <option>직접입력</option>
									   </select>
									   <input type="hidden" name="email">
									   <c:if test="${errors.email}">email를 입력하세요.</c:if>
								</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top: 15px; text-align:center;">
					<input type="submit" style="padding-top: 5px; padding-right: 190px; font-size: 15px; color: blue;" value="회원가입" />
					<input type="reset" style="font-size: 15px; color: red;" value="취소" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









