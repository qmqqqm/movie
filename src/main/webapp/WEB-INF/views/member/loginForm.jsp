<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
     얻어진 request객체를 이용하여   contextPath를 얻어
     변수에 저장
   <c:set var="변수명" value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>loginForm.jsp</h2>
   
   <form name="loginForm" id="loginForm" 
            method="post" action="${contextPath}/member/login.do">
      <table border="1" width="80%">
         <tbody>
            <tr>
               <th>아이디</th>
               <th>비밀번호</th>
            </tr>
            <tr>
               <td style="text-align:center;"><input type="text"     name="member_userid"  required="required"/></td>
               <td style="text-align:center;"><input type="password" name="member_pwd" required="required"/></td>
            </tr>
            <tr>
               <td colspan="2" style="text-align:center;">
                  <input type="submit"  value="로그인" />
                  <input type="reset"  value="취소" />
               </td>
            </tr>
         </tbody>
      </table>      
   </form>
   
</body>
</html>






