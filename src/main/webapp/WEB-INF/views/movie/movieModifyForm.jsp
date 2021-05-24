<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
   #pkc{ width:100%; margin: 0 auto;  max-width: 1000px; padding-top:10px; text-align:center;}
   #modi{
   background: pink;
   color: white;
   padding: 10px;
   font-size:13px
   }
   .sp{
   margin-top:100px;
   margin-left: 230px;
   display: inline-block;
   
   }
   .mvDetailImg{width:300px; margin : 10px 10px 10px 10px; }
   .inputArea{text-align:center}
   #select_SubImg > img{margin-right:20px;}
</style>
<title></title>
</head>
<body>
<div id="pkc">
   <form id="frm" action="${contextPath}/movie/movieMoidfy.do" method="post" enctype="multipart/form-data" onsubmit="return confirm('수정완료하시겠습니까?');">
            영화번호<p/>
            <input type="text" id="movie_id" name="movie_id" value="${map.movieDetail.movie_id }" style="margin-bottom:20px" readonly /><p/>
         
            영화제목<p/>
            <input type="text" id="movie_title" name="movie_title" value="${map.movieDetail.movie_title}" style="margin-bottom:20px"/><p/>
      
            상영시간<p/>
            <input type="text" id="movie_time" name="movie_time" value="${map.movieDetail.movie_time}" style="margin-bottom:20px"/><p/>
         
            개봉일<p/>
            <input type="text" id="movie_Date" name="movie_Date" value="${map.movieDetail.movie_Date}"  style="margin-bottom:20px"/><p/>
            
            감독<p/>
            <input type="text" id="movie_foreman" name="movie_foreman" value="${map.movieDetail.movie_foreman}" style="margin-bottom:20px"/><p/>
            
            배우<p/>
            <input type="text" id="movie_actor" name="movie_actor" value="${map.movieDetail.movie_actor}" style="margin-bottom:20px"/><p/>
            
            장르<p/>
            <input type="text" id="movie_genre" name="movie_genre" value="${map.movieDetail.movie_genre}" style="margin-bottom:20px"/><p/>
            
            상영등급<p/>
            <select id="movie_rating" name="movie_rating" style="margin-bottom:20px">
               <c:choose>
                  <c:when test="${map.movieDetail.movie_rating == '전체'}">
                     <option value="${map.movieDetail.movie_rating}" selected>${map.movieDetail.movie_rating}</option>
                     <option value="12세">12세</option>
                     <option value="15세">15세</option>
                     <option value="성인">성인</option>
                  </c:when>
                  <c:when test="${map.movieDetail.movie_rating == '12세'}">
                     <option value="${map.movieDetail.movie_rating}" selected>${map.movieDetail.movie_rating}</option>
                     <option value="전체">전체</option>
                     <option value="15세">15세</option>
                     <option value="성인">성인</option>
                  </c:when>
                  <c:when test="${map.movieDetail.movie_rating == '15세'}">
                     <option value="${map.movieDetail.movie_rating}" selected>${map.movieDetail.movie_rating}</option>
                     <option value="전체">전체</option>
                     <option value="12세">12세</option>
                     <option value="성인">성인</option>
                  </c:when>
                  <c:when test="${map.movieDetail.movie_rating == '성인'}">
                     <option value="${map.movieDetail.movie_rating}" selected>${map.movieDetail.movie_rating}</option>
                     <option value="전체">전체</option>
                     <option value="12세">12세</option>
                     <option value="15세">15세</option>
                  </c:when>
               </c:choose>
            </select><p/>
            
               <%-- <input type="text" id="movie_rating" name="movie_rating" value="${map.movieDetail.movie_rating}"/> --%>
            주요정보<p/>
            <textarea id="movie_mainInfo" name="movie_mainInfo" style="width:500px;height:400px" style="margin-bottom:20px">${map.movieDetail.movie_mainInfo}</textarea><p/>
             <div id="inputArea">
               영화 메인 이미지<p/>
               <input type="file" id="movieImg" name="MainFile" style="margin-bottom:20px"/>
               <div class="select_img">
                     <img  src="">
               </div>
             </div>
                  <div class="ex_select_img" style="padding-right:300px; margin-bottom:20px">
                     <span id="x" style="cursor:pointer;"> 
                        <img style="width:20px; padding:0 0 20px 300px" src="../resources/img/x.png"/>
                        <img class="mvImg" src="${contextPath}/thumbnails.do?movie_id=${map.movieDetail.movie_id}&movieImage_fileName=${map.movieDetail.movieImage_fileName}">
                        <input type="hidden" name="movieImage_fileName" value="" />
                     </span>
                  </div>
                  
                  
             <div class="inputSubArea">
               영화 스틸컷 이미지<p/>
                <input type="file" id="movieSubImg" name="SubFile" style="margin-bottom:20px; margin-bottom:20px" multiple/>
            </div>
                   <div id="select_SubImg" style="padding-left:10px; padding-right:10px;"></div>
                   <div id="image" >   
                     <c:forEach items="${map.movieDetailImg}" var="movieDetail">
                        <div class="sub_x" style="cursor:pointer;" id="${movieDetail.movieImage_fileName}"> 
                           <img style="width:20px; padding:0 0 20px 300px; " src="../resources/img/x.png" />
                           <img  style="padding-right:300px" class="mvDetailImg" src="${contextPath}/thumbnails.do?movie_id=${movieDetail.movie_id}&movieImage_fileName=${movieDetail.movieImage_fileName}">
                           <input type="hidden" id="${movieDetail.movieImage_fileName}" name="sub_movieImage_fileName" value="" />
                        </div>
                     </c:forEach>
                  </div>
            <!-- <div class="inputSubArea">
               <label for="movieSubImg">영화 서브 이미지</label>
               <input type="file" id="movieSubImg" name="SubFile" accept="image/*" onchange="setThumbnail(event);" multiple/> 
               <div id="select_SubImg" style="padding-left:10px"></div>
            </div>    -->
            <span class="sq"><input type="submit" value="수정" id="modi"/></span>
   </form>   
</div>   
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>      
 <script>
  $("#movieImg").change(function(){
      if(this.files && this.files[0]) {
          var reader = new FileReader;
          reader.onload = function(data) {
              $(".select_img img").attr("src", data.target.result).width(200);        
          }
          reader.readAsDataURL(this.files[0]);
      }
  });
  
    $("#movieSubImg").change(function(){
     for(i=0;i<this.files.length;i++){
         if(this.files[i]) {
             var reader = new FileReader;
             reader.onload = function(data) {
                var img = document.createElement("img"); 
                 img.setAttribute("src", event.target.result); 
                   img.setAttribute("width","200"); 
                   
                   document.querySelector("div#select_SubImg").appendChild(img);
             }
            }
             reader.readAsDataURL(this.files[i]);
      }
  }); 
  $("#movieSubImg").change(function(){
        document.querySelector("div#select_SubImg").innerHTML = '';  // 앞서 선택한 이미지 삭제
  }); 
  $(function(){
     $("#x").click(function(){
        $(".mvImg").hide();
        $("#x").hide();
        $("input[type=hidden][name=movieImage_fileName]").val("${map.movieDetail.movieImage_fileName}");
        
     })
     $(".sub_x").click(function(data){
        $(this).hide();
        var name = $(this).attr("id");
        $(this).children("input[type=hidden]").val(name);
     })
     $("#movieImg").click(function(){
        alert("메인이미지는 꼭 한개의 이미지만 있어야 합니다.")
     });
  });
 </script>      
</body>
</html>