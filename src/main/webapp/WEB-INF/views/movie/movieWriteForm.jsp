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
#pkc{ width:100%; margin: 0 auto;  max-width: 900px; padding-top:10px; text-align:center;}
img{margin-right:20px}

#write{
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
</style>
<title></title>
</head>
<body>
<div id="pkc">
   <form action="${contextPath}/movie/movieWrite.do" method="post" enctype="multipart/form-data">
      제목<p/> <input type="text" name="movie_title" id="movie_title"  style="margin-bottom:20px" required><p/>
      상영시간<p/> <input type="text" name="movie_time" id="movie_time"style="margin-bottom:20px" required><p/>
      개봉일<p/> <input type="date" name="movie_Date" id="movie_Date" style="margin-bottom:20px" required><p/>
      마감일<p/> <input type="date" name="movie_endDate" id="movie_endDate"  style="margin-bottom:20px" required><p/>
      배우<p/> <input type="text" name="movie_actor" id="movie_actor"  style="margin-bottom:20px" required><p/>
      장르<p/> <input type="text" name="movie_genre" id="movie_genre"  style="margin-bottom:20px" required><p/>
      감독<p/> <input type="text" name="movie_foreman" id="movie_foreman"  style="margin-bottom:20px" required><p/>
      상영등급<p/>
         <select id="movie_rating" name="movie_rating"  style="margin-bottom:20px" >
                     <option value="전체" selected>전체</option>
                     <option value="12세">12세</option>
                     <option value="15세">15세</option>
                     <option value="성인">성인</option>
         </select>
      <!--  <input type="text" name="movie_rating" id="movie_rating"> --><p/>
      주요정보<p/> <textarea id="movie_mainInfo" name="movie_mainInfo" style="width:500px;height:400px; margin-bottom:20px" required></textarea>
      
       <div class="inputArea">
           <div style="padding-right:170px">영화 메인 이미지</div>
          <input type="file" id="movieImg" name="MainFile" style="margin-bottom:20px"/>
          <div class="select_img"><img  src="" /></div>
       </div>
       
       <div class="inputSubArea">
           <div style="padding-right:160px">영화 스틸컷 이미지</div>
          <input type="file" id="movieSubImg" name="SubFile" multiple/>
          <div id="select_SubImg" style="padding-left:10px; padding-right:10px;"></div>
      </div>
      <!-- <div class="inputSubArea">
         <label for="movieSubImg">영화 서브 이미지</label>
         <input type="file" id="movieSubImg" name="SubFile" accept="image/*" onchange="setThumbnail(event);" multiple/> 
         <div id="select_SubImg" style="padding-left:10px"></div>
      </div>    -->
      <div class="sq"><input type="submit" id="write" value="작성"/></div>
         
      
      
    </form>   
    
</div>         
</body>
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
   /*function setThumbnail(event) {

       for (var image of event.target.files) { 

           var reader = new FileReader(); 

           reader.onload = function(event) { 

               var img = document.createElement("img"); 

               img.setAttribute("src", event.target.result); 
               img.setAttribute("width","200");

               document.querySelector("div#select_SubImg").appendChild(img);  //새로 선택한 이미지 div에 출력

            }; 

            console.log(image); 

            reader.readAsDataURL(image); 

       } 

   } */

 </script>
</html>