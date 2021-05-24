<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>
.mainmenu{
      position: absolute;
      top :70px;
      left:300px; 
      
      font-weight:900;
}
.find{
      position: absolute;
      top :62px;
      left:800px; 
}
span{
      font-size:18px;
      margin:20px;
      z-index: 900;
}

#sel{
position: absolute;
top: 7px;
left: 180px;
}


</style>

<div id="cgvwrap">
    <div class="cgv-ad-wrap" id="cgv_main_ad">
        <div id="TopBarWrapper" class="sect-head-ad">
             <div class="top_extend_ad_wrap">
             <img src="/movie/resources/images/main/0419_980x80.jpg"/>             
        </div>    
    </div> 
    
   <!-- Header -->
   <div id="header" style="width:1000px; margin:0 auto;">
      <div class="head">
         
            <!-- 서비스 메뉴 --> 
            <!-- 앱다운로드 레이어 팝업 -->



            <h1><a href="${contextPath}/main.do"><img src="/movie/resources/images/title/h1_cgv.png" alt="CGV" /></a></h1>

            <div class="sect-service">
            <h2>서비스 메뉴</h2>
                <ul class="util">
               <li>
                        <!-- 2019.09 수정 -->
                    
                  <!-- 앱 다운로드 레이어 팝업 2019.09 SMS 전송,하단 영역 제거 -->
                  <div class="app-downinfo v2">

                    </li>
               

            </ul>
                <ul class="gnb">
           
                  
                  <c:if test="${not empty MDTO}">                        
                     <li><a href="${contextPath}/member/loginOut.do"  class="logout" title="로그아웃" ><span>로그아웃</span></a></li>
                  </c:if>
                  <c:if test="${empty MDTO}">                  
                     <li><a href="${contextPath}/member/loginForm.do" class="login" ><span>로그인</span></a></li>
                  </c:if>
                  
                    <c:if test="${empty MDTO}">
               <li><a href="${contextPath}/member/joinForm.do" class="join" ><span>회원가입</span></a></li>
                    </c:if>
                

               <li><a href="${contextPath}/member/myPage.do" class="mycgv required-login" ><span>나의 늘봄극장</span></a></li>
               <li><a href="${contextPath}/clubService.do" title="새창" class="club specialclub"  ><span>CLUB 서비스</span></a></li>
               <!-- 2014.12.8 리뉴얼-->
               <li><a href="${contextPath}/support.do" class="customer" ><span>고객센터</span></a></li>
            </ul>
           </div>
            <!-- 서비스 메뉴 -->
            
            <div class="im-wrap"> <!-- Important wrap -->
            <h2><img src="/movie/resources/images/title/h2_cultureplex.png" alt="CULTUREPLEX" /></h2>
            <div class="mainmenu">   
            <a href="${contextPath}/movie/movieList.do"><span>영화</span></a> <a href="${contextPath}/theater.do"><span>극장</span></a> <a href="${contextPath}/ticketForm.do"><span >예매</span></a><a href="${contextPath}/giftShop.do"><span>기프트샵</span></a>   
            <c:if test="${MDTO.member_admin==1}">
                     <a href="${contextPath}/adminchk.do" class="admin"><span>운영자</span></a>
               </c:if>
            </div>
            <div class="find">
               
               <fieldset>
                  <legend>통합검색</legend>
                  <input type="text" title="통합검색" id="" name="" minlength="2" maxlength="20" />
                        <input type="hidden" id="header_ad_keyword" name="header_ad_keyword" />
                  <button type="button" class="" id="sel">검색</button>
                        <!-- <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Search_txt" width="0" height="0" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe> -->
               </fieldset>
               
            </div>      
            <!-- 서브 메뉴 -->
</div>
</div>
      </div>
   </div>
</div>












   <!-- /Header -->
   <!-- /Contaniner --> 
    










