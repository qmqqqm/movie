<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/movieList.css" rel="stylesheet" type="text/css">

<title></title>
<style>

   ul.mvList {
    list-style: none;
    margin:0 auto;
    padding: 0px;
  
    max-width: 1000px;
    width: 100%;
}
  
ul.mvList li {
    display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    /* border: 1px solid #efefef; */
    font-size: 12px;
    /* cursor: pointer; */
}

#WriteForm{margin: 0 auto; max-width: 900px; width: 100%; text-align:right; font-size: 15px; color:white;   }

#write{background:pink; border-radius: 15px; padding:0px 10px 0px 10px; }


.mvImg{width:300px}

#mvNo{background:pink; color:white; font-size:20px; text-align:center;font-weight:bold}

#mvtitle{ color:black; font-size:20px; font-weight: bold;padding-top:10px}

.name{font-weight:bold}
.name-info{font-size:13px}

#tiket{background:pink; margin: 0 0 50px 90px; color:white; font-size:14px; padding: 5px 15px 7px 0px; border-radius: 15px;}

.tiketImg{width:80px}

#WriteForm{margin: 0 auto; max-width: 900px; width: 100%; text-align:right; font-size: 15px; color:white;   }

#write{background:pink; border-radius: 15px; padding:0px 1px 0px 10px; }

.writeIcon{width:15px;}
.pkc-info{max-width: 300px;  width: 100%;  }

</style>
<c:if test="${MDTO.member_admin==1}">
   <style>
      ul.mvList {
             list-style: none;
             margin:0 auto 0 10px ;
             padding: 0px;
             max-width: 850px;
             width: 100%;
             position:relative;
             left:200px;
             bottom:360px;
      }
      #WriteForm{
            position:relative;
             bottom:360px;
      }
      .pkc-info{margin-left:55px}
   </style>
</c:if>
</head>
<body>
<c:if test="${MDTO.member_admin==1}">
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">운영자</a>
                            </li>
                        
                            <li  class="last">
                                영화 관리
                            </li>
                        
                        
                    </ul>
                </div>
                <div class="sect-special">
                    <ul>                      
                        <li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../user/memberShip/ClubService.html" title="새창" class="specialclub">Club서비스</a></li>
                      
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

      <!-- Contents Area -->
      <div id="contents" class="">
            
            <!-- Contents Start -->
         
<!-- Contents Area -->
<div id="contents">
   <!-- Contents Start -->
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
            <li class=''><a href="${contextPath}/showTheaterList.do">극장 관리<i></i></a></li>            
            <li class='on'><a href="${contextPath}/movie/movieList.do">영화 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adminTicketForm.do">예매 관리<i></i></a></li>
        </ul>
    </div>
   
</div>      
      </div>
   </div>
</c:if>
<div id="WriteForm">
   <c:if test="${memberDto.member_admin==1}">
      <a href="${contextPath}/movie/movieWriteForm.do">
         <span id="write">작성 <img class="writeIcon" src="../resources/img/write.png"/>
         </span>
      </a>
   </c:if>      
</div>
<div id="pkc">
   <ul class="mvList">
      <c:forEach  var="mvList"  items="${mvList}">
      <li>
         <div class="pkc-info">
            <div id="mvNo">NO. ${mvList.rownum}</div>
            <div><a href="${contextPath}/movie/movieDetail.do?movie_id=${mvList.movie_id}"><img class="mvImg" src="${contextPath}/thumbnails.do?movie_id=${mvList.movie_id}&movieImage_fileName=${mvList.movieImage_fileName}"></a></div>
            <div id="mvtitle">${mvList.movie_title}</div>
            <fmt:parseDate value="${mvList.movie_Date}" var="movie_Date" pattern="yyyy-MM-dd"/>
            <p style="text-align:center; margin-top:10px"><span class="name">상영시간 </span> : <span class="name-info"> ${mvList.movie_time} 분</span>  </p>
            <p style="text-align:center; margin-top:10px"><span class="name">개봉일 </span> : <span class="name-info"><fmt:formatDate value="${movie_Date}" pattern="yyyy-MM-dd"/> </span> </p>
            <a href="#"><span id="tiket"><img class="tiketImg" src="../resources/img/tiket.png">예매</span></a>
         </div> 
      </li>
      </c:forEach>
   </ul>
</div>

</body>
</html>