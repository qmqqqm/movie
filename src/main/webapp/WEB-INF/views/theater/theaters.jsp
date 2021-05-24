<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaters</title>
<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/theater/theaters.css" />

<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function (){
   var id = "";
   var ischk="";
   var imgthe = "";
   
   //지역을 누르면 지역별 영화관 생성
   $(".location").on("click",function (){
      $("#theaterName_ul").empty();
      
      $("#theater_location_ul").find('span').removeClass('locationOn');
      $(this).children("span").addClass("locationOn");
      
      
      <c:forEach  var="theaters"  items="${theaters}" varStatus="cnt">
         if ($(this).text() == "${theaters.theater_location}") { 
            var str = "<li class='theaterName_li'><button type='button' name='th_name' id='th${cnt.index}'>" + "${theaters.theater_name}" + "</button></li>";
             $("#theaterName_ul").append(str);
            } 
      </c:forEach>
   }); //$(".location").click()
   
   //영화관을 선택하면,
   $(document).on("click","button[name='th_name']",function(){
      $("#th_inform").empty();

      
      
      var theater = $(this).text();
      <c:forEach  var="theaters"  items="${theaters}">
         if (theater == "${theaters.theater_name}") { 
             var theater_inform = "<p id='th_address'> - ${theaters.theater_address} </p>" + "<br>" + 
                               "<p id='th_phone'> - ${theaters.theater_phone} </p>" + "<br>";
             
             $("#th_inform").append(theater_inform);
             
             id = ${theaters.theater_id};
             
             $.ajax({             
                  type : "get",
                  url : "./theaterInform.do",
                  data : {"id" :"${theaters.theater_id}"},
                  dataType:"json",
                  error : function(){
                     alert("에러!");
                  },
                  success : function(data){   
                     var im = data.theaterImageDTO;
                     var fol = im.image_id;
                     var theimgname = im.filename;
                     imgthe = "<spring:url value ='/images/"+fol+"/"+theimgname+"'/>";
                     $("#im").css({"display":"block"});
                  $("#theImg").attr("src",imgthe); //이미지 변환
                     var i = data.totSangygDTO;
                     var s = "<p id='th_totSangyg'> - " + i.totSangyg_id + " 관 / ";
                        s += i.totSangyg_seats + " 석 </p><br>";
                      $("#th_inform").append(s);
                  }
                   
              });//$.ajax-> Sangyg 테이블을 사용하여 총 상영관 개수와 좌석 수를 가져온다.
         } 
      </c:forEach>
      
      //상영시간표 날짜 계산하기
      $("#theaters_cal_ul").empty();
      var today = new Date();
      var date ="<li class='theaters_cal_li'><button type='button' class='days_btn'>-</button></li>";
      for(var i = 0; i < 7; i++)
      {
         var day = today.getDate()+i;
         date += "<li class='theaters_cal_li'><button type='button' name='days' class='days_btn' id='days_" + i + "'>" + day + "</button></li>";
         
      }
      date += "<li class='theaters_cal_li'><button type='button' class='days_btn'>+</button></li>";
      $("#theaters_cal_ul").append(date);
   });// 영화관을 선택하면!!
   
   //날짜를 누르면 해당 영화관, 날짜에 맞는 상영시간표 나오는 function
   $(document).on("click","button[name='days']",function(){   
      var day = $(this).text();
      var movie_list=null;
      
      $("#theaters_mainTimes").empty();
   
      $.ajax({
            type : "get",
            url : "./theaterTimes.do",
            data : {"id" :id, "day": day},
            dataType:"json",
            error : function(){
               alert("에러!");
           },
            success : function(data){
     
               var time = data.times;
               var movie = data.movieInform;
               var sangyg = data.sangygInform;
               
                     //6,2,3
               var movieInform = "";
               var sangygInfrom ="";
               
               for(i = 0; i < movie.length; i++){
                  //영화 정보 가져오기
                  var movieInform = "";
                  movieInform += "<div id = 'movieInform_"+ i + "'class='movieInform'>";
                  movieInform += "<span id='movie_rating' class='movie_inform'>" + movie[i].movie_rating + "</span>";
                  movieInform += "<span id='movie_title' class='movie_inform'><a href=''>"+ movie[i].movie_title + "</a></span> ";
                  movieInform += "[상영중]<span id='movie_genre' class='movie_inform'>" + movie[i].movie_genre + " </span> / ";
                  movieInform += "<span id='movie_time' class='movie_inform'>" + movie[i].movie_time + "</span> 분  / ";
                  movieInform += "<span id='movie_date' class='movie_inform'>" + movie[i].movie_Date + " </span> 개봉 <br></div>";
                  
                  $("#theaters_mainTimes").append(movieInform);
                  
                  var timeid_list = new Array();//같은영화의 times_id를 저장해두는 list
                 var sangygid_set = new Set();//같은영화의 sangyg_id 저장해두는 set
                  for(j = 0; j < time.length; j++){
                     if(time[j].movie_id == movie[i].movie_id){
                        timeid_list.push(time[j].times_id);
                        sangygid_set.add(time[j].sangyg_id);
                     }   
                  }
                 
                 //상영관 별로 정보 저장
                 for (var value of sangygid_set) {
                    //상영관 정보 저장하기
                    var sangygInform ="";
                    for(j=0; j<sangyg.length; j++){
                       if(sangyg[j].sangyg_id == value){
                             sangygInform += "<div id='sangyg_ "+ j +"' class='sangygInFormj'>"
                             sangygInform += "<img src='./resources/images/common/ico/ico_arrow03.png' class='sangygIco'/>";
                             sangygInform += "<span id='sangyg_name' class='sangygInform'>" + sangyg[j].sangyg_name + "&nbsp;&nbsp;&nbsp;&nbsp; | </span>";
                             sangygInform += "<span id='sangyg_id' class='sangygInform'>" + sangyg[j].sangyg_id + "관  &nbsp;&nbsp;&nbsp;&nbsp; | </span>";
                             sangygInform += "총 <span id='sangyg_seat' class='sangygInform'>" + sangyg[j].sangyg_seats + "석</span><br>";
                       }   
                       sangygInform += "</div>"
                    }//for(j=0; j<sangyg.length; j++)
                    
                    $("#theaters_mainTimes").append(sangygInform);
                    
                    //상영관 별로 시간 정보 저장하기
                    var timeInform="<ul class='times_ul'>";
                    for(z = 0; z < time.length; z++)
                    {
                       if(time[z].movie_id == movie[i].movie_id && time[z].sangyg_id == value){
                          timeInform += "<li class='times_li'><button class='timeBtn'><em>" + moment(time[z].times_time).format("HH:mm") + "</em><br><span class='times_seat'>" + time[z].times_seat + "석 </span></button></li>";
                       }
                    }
                    timeInform += "</ul>";
                    $("#theaters_mainTimes").append(timeInform);
                    
               }   
              
               }//for(i = 0; i < movie.length; i++)
            }//success
        })//ajax
   });//날짜를 누르면 해당 영화관, 날짜에 맞는 상영시간표 나오는 function      
      
   //플러스 버튼 클릭시 즐겨찾기 추가 팝업창나옴
   $("#reg").click(function(){
      if($("#login").val()==null||$("#login").val()==undefined||$("#login").val()==""){
         alert("로그인해주세요");
         return;
      } 
      window.open("./theaterpopup.do","pop","width=1000,height=600,left=600");
   })
   
   //즐겨찾기된 것을 누르면 해당 위치까지 클릭됨
   $(".bookmark").on("click",function (){
      var mark = $(this).text();
      //값을 뽑아서 
      //해당 값을 가져온 값과 확인해서 영화관 번호 알아내기
      <c:forEach  var="theaters"  items="${theaters}">
         if(mark == "${theaters.theater_name}"){
            var cliloc = "${theaters.theater_location}"
         }
      </c:forEach>
      for(j=0;$(".location").length;j++){
         if($(".location").eq(j).text()==cliloc){
            var locid = "#lo"+j
            $(locid).trigger("click");
            break;
         }
      }
      for(i=0;$("button[name='th_name']").length;i++){
         if($("button[name='th_name']").eq(i).text()==mark){
            $("button[name='th_name']").eq(i).trigger("click");
            break;
         }
      }
   })
   
   //trigger
   $('#lo0').trigger('click');
   $('#th0').trigger('click');
   $('#days_0').trigger('click');

});//전체 function
</script>
</head>
<body>
<input type="hidden" value="${memberDTO.member_id}" id="login">

<div id="theaters_theater_wrap">
   <div id="theaters_theater">
      <c:if test="${empty selectBookMark}">
      <div id="theaters_often">
            <div id="theaters_often_span">자주가는 늘봄극장</div> 
         <ul id="theaters_often_ul">   
            <li class="theaters_often_li"><span class="bookmark"><span class="mini">1</span></span></li>
            <li class="theaters_often_li"><span class="bookmark"><span class="mini">2</span></span></li>
            <li class="theaters_often_li"><span class="bookmark"><span class="mini">3</span></span></li>
            <li class="theaters_often_li"><span class="bookmark"><span class="mini">4</span></span></li>
            <li class="theaters_often_li"><span class="bookmark"><span class="mini">5</span></span></li>
            </ul>
         <button id="reg">+</button>
      </div>
      </c:if>
      
      <c:if test="${not empty selectBookMark}">
      <div id="theaters_often">
         <div id="theaters_often_span">자주가는 늘봄극장</div>
         <ul id="theaters_often_ul">  
             <li class="theaters_often_li"><span class="bookmark">${selectBookMark.bookmark_fir}</span></li>
             <li class="theaters_often_li"><span class="bookmark">${selectBookMark.bookmark_se}</span></li>
             <li class="theaters_often_li"><span class="bookmark">${selectBookMark.bookmark_th}</span></li>
             <li class="theaters_often_li"><span class="bookmark">${selectBookMark.bookmark_fo}</span></li>
             <li class="theaters_often_li"><span class="bookmark">${selectBookMark.bookmark_fiv}</span></li>
         </ul>
         <button id="reg">+</button>
       </div>
      </c:if>
      

      <div id="theater_location">
         <ul id="theater_location_ul">
            <c:forEach  var="location"  items="${location}" varStatus="i">
               <li class="theater_location_li"><button type="button" id="lo${i.index}" class="location"><span class="">${location}</span></button></li>
            </c:forEach>
         </ul>
      </div>
      
      
      
      <div id="theater_theaterName">
         <ul id = "theaterName_ul"></ul>
      </div>
   </div>
</div>   

   <div id="theater_inform_wrap">
      <h1 id="theaters_theaterH1">Theater</h1>

      <div id="im">
         <img id="theImg" src=""/>
      </div>
      
      <div id="th_inform"></div>
   
   </div>
   
   <div id="theater_times_wrap">
      <h1 id="theaters_timesH1">상영시간표</h1>
      <ul id="theaters_cal_ul"> </ul>
      <div id="theaters_mainTimes"> </div>
   </div>
   
   
   
</body>
</html>