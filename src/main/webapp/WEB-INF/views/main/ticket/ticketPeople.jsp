<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.people{
width:100%;
height:500px;

border:1px solid black;

} 
.box{
	display:inline-block;
	width:18px;
	height:16px;
	border:1px solid black;
	margin: 2px 5px;
	text-align: center;
	font-size: 13px;
	padding-top: 3px;
	font-weight: 900;
}
.selectpeople{
width:5%;
float: left;

}
.selectpeoplenum{
width:50%;
float: left;
}
.title_peo{
display:inline-block;
font-size: 13px;
margin:5px 5px;

}
.screen{
display:inline-block;
width:65%;
margin 0 auto;
border:1px solid black;
text-align: center;
}
.info{
float: left;
}
.day{
width:10%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
}
.time{
width:35%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
} 
.bottombar{
	clear: both;
	height:100px;
	background:pink;
}
.title{
	text-align: center;
	font-size:15px;
	color:black;
	background: pink;
	padding:5px 0;
}
.bottombarmovie{
width:25%;
height:60px;
border-right: 1px solid white;
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
float: left;
}
.bottombarselect{
width:25%;
height:60px;
border-right: 1px solid white;
margin:7px 0;
padding-left:10px;
font-size:15px;
font-weight:900;
text-align:left;
float: left;
}
.bottombarpay{
width:25%;
height:60px;
margin : 20px 0;
font-size:25px;
font-weight:900;
padding:0 10px;
float: left;
}
.bottomcount{
width:21%;
height:60px;
margin-right:0;


float: right;
}
.title_stat{
display:inline-block;
width:5%;
margin:5px 5px;
}
.seatform{
margin:0 auto;
padding-left: 20%;
}

</style>


<div id="contaniner">
	<form name="frm" id="frm">
		<input type="hidden" name="movie_id" class="movie_id" value="${ticketDTO.movie_id}" />
		<input type="hidden" name="movie_title" class="movie_title" value="${ticketDTO.movie_title}" />
		<input type="hidden" name="theater_id" class="theater_id" value="${ticketDTO.theater_id}" />
		<input type="hidden" name="theater_name" class="theater_name" value="${ticketDTO.theater_name}" />
		<input type="hidden" name="times_time" class="times_time" value="${ticketDTO.times_time}" />
		<input type="hidden" name="ticket_date" class="ticket_date" value="${ticketDTO.ticket_date}" />
		<input type="hidden" name="sangyg_id" class="sangyg_id" value="${ticketDTO.sangyg_id}" />
		<input type="hidden" name="sangyg_name" class="sangyg_name" value="${ticketDTO.sangyg_name}" />
		<input type="hidden" name="times_seat" class="times_seat" value="${ticketDTO.times_seat}" />
	</form>
        <!-- LineMap -->
        <div id="navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="./main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        <li><a href="index.html">예매</a></li>
                        <li class="last">빠른예매</li>
                    </ul>
                </div>
                <div class="sect-special">
                    <ul> 
                        <li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../user/memberShip/ClubService.html" class="specialclub" title="새창">CLUB 서비스</a></li>
                       <!-- <li><a href="#" class="photi" title="새창">포토티켓</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

		<!-- Contents Area -->
		<div id="contents" style="height:1px;padding:0;"></div>
        
        <div class="people">
        <div class="title">인원/ 좌석</div>
        
        <div class="selectpeople"><span class="title_peo" >일반</span> <br><span class="title_peo" >청소년</span> </div>
        <div class="selectpeoplenum"><span id="ad1" class="box" onclick="adcount(this)">1</span><span id="ad2" class="box" onclick="adcount(this)">2</span><span id="ad3" class="box" onclick="adcount(this)")>3</span><span id="ad4" class="box" onclick="adcount(this)">4</span><span id="ad5" class="box" onclick="adcount(this)">5</span><span id="ad6" class="box" onclick="adcount(this)">6</span><span id="ad7" class="box" onclick="adcount(this)">7</span><span id="ad8" class="box" onclick="adcount(this)">8</span><br>
        <span id="ch1" class="box" onclick="chcount(this)">1</span><span  id="ch2" class="box" onclick="chcount(this)">2</span><span  id="ch3" class="box" onclick="chcount(this)">3</span><span  id="ch4" class="box" onclick="chcount(this)">4</span><span  id="ch5" class="box" onclick="chcount(this)">5</span><span  id="ch6" class="box" onclick="chcount(this)">6</span><span  id="ch7" class="box" onclick="chcount(this)">7</span><span  id="ch8" class="box" onclick="chcount(this)">8</span>
        </div>
        <div class="info">
        좌석 : <span id="select"></span><br>
        인원 : <span id="count"></span><br>
        </div>
        <div>
        
        <span class="screen">SCREEN</span><br>
        
    <div class="seatform">    
       <!--  상영관 시트수를 받아 좌석 출력  -->
        <script>
		stat=${stats};
		rows= stat/10;
		selectstat="";
		adcnt=0;
		chcnt=0;
		totalcnt=0;
		str=[];
		price=0;
		// noseat=${selectseat};
		//strseat=noseat.split(","); */
		// alert(${selectseat}); 
		for(i=65;i<65+rows;i++){
			
			document.write("<span class='title_stat'>"+String.fromCharCode(i)+"</span>");
			for(j=1;j<=10;j++){
				document.write("<span class='box' onclick='select(this)' id='"+String.fromCharCode(i)+j+"'>"+j+"</span>")
			}
			document.write("<br>")
		}
		</script>
		</div>
		
		
		<script>
		//예약좌석받아 css작업
		noseat='${selectseat}';
		re=noseat.replace("[","");
		rere=re.replace("]","");
		strseat=rere.split(",");	
		
		for(k=0;k<strseat.length;k++){
			document.getElementById(strseat[k]).style.background=blue;	
			alert("111");//for문집입불가
		}  
		
		//좌석선택
		function select(num){			
			
			
			if(totalcnt==0){
				alert("인원을선택하세요")			 
			}else if(totalcnt<str.length+1){
				
				alert("선택한인원에 맞게 좌석을 선택하세요")	;
				for(i=0;i<str.length;i++){
					document.getElementById(str[i]).style.background=""
				}
				num.style.background="";
				selectstat="";
				stat="";
				str=[];
				chk=0;
				price=0;
				document.getElementById('select').innerText="";
			}else{
				
				if(num.style.background!="red"){
					num.style.background="red";
					stat=num.getAttribute('id');
					
					}else{
							if(selectstat!=""){
								//str=selectstat.split(",");
								for(i=0;i<str.length;i++){
									document.getElementById(str[i]).style.background=""
								}
							}
							num.style.background="";
							selectstat="";
							stat="";
							str=[];	
							chk=0;
							price=0;
					}
					if(selectstat==""){					
						selectstat=stat;
						str[0]=selectstat;
						
					}else{
						selectstat=selectstat+","+stat;
						str=selectstat.split(",");
						
					}//else
					
					
			}//else
			chk=str.length;		
			document.getElementById('select').innerText=selectstat;
		
			bottom(chk,str)
		 
		}//select(num)
		
		function bottom(chk,str){
			document.getElementById('bottombarpay').remove();
			price=12000*chk;
			str="<div id='bottombarpay'> 일반석 "+selectstat+"<br/>"+"금액 : "+(12000*chk)+" </div>";
			$('#selectstat').append(str); 
			str=str;
			
		}
		//성인인원선택
		function adcount(count){	
			if(adcnt==0){
				adcnt=count.innerText;
				count.style.background="red";
			}else{		  
					if(count.style.background!="red"){
					document.getElementById("ad"+adcnt).style.background="";
					count.style.background="red";
					adcnt=count.innerText;		}else{
						count.style.background="";
						adcnt=0;
					}		
			}	
		
			
			total(); 
		}
		//청소년인원선택
		function chcount(count){	
			if(chcnt==0){
				chcnt=count.innerText;
				count.style.background="red";
			}else{				
				if(count.style.background!="red"){
					document.getElementById("ch"+chcnt).style.background="";
					count.style.background="red";
					chcnt=count.innerText;}else{
						count.style.background="";
						chcnt=0;
					}
				}	
		
			
			total(); 
		}
		//총선택한 인원
		function total(count){	
			
			totalcnt=Number(adcnt)+Number(chcnt);
			document.getElementById('count').innerText=totalcnt;
		}
		//결제페이지로 이동
		 function formsub(){
			 if(totalcnt==str.length){
			 document.getElementById('price').value=price;
			 document.getElementById('seat').value=selectstat;
			 document.getElementById('ticket_quantity').value=totalcnt;
			$("#priceform").submit();
			 }else if(totalcnt==0||totalcnt==null||str.length==0||str.length==null){
				 alert("인원과좌석을 선택하세요");
			 }else{
				 alert("인원수에 맞게 좌석을 선택하세요");
			 }
		} 
		</script>
		
        </div>
        </div>
        </div>
        
				<div id="formsub"></div>
        <div class="bottombar">
        <form id="priceform" action="ticketpayment.do" method="post">
				<input type="hidden" id="movie_id" name="movie_id" value="${movie_id}"/>
				<input type="hidden" id="movie_title" name="movie_title" value="${movie_title}"/>
				<input type="hidden" id="theater_id" name="theater_id" value="${theater_id}"/>
				<input type="hidden" id="theater_name" name="theater_name" value="${theater_name}"/>
				<input type="hidden" id="sangyg_id" name="sangyg_id" value="${sangyg_id}"/>
				<input type="hidden" id="sangyg_name" name="sangyg_name" value="${sangyg_name}"/>
				<input type="hidden" id="ticket_date" name="ticket_date" value="${ticket_date}"/>
				<input type="hidden" id="times_time" name="times_time" value="${times_time}"/>
				<input type="hidden" name="price" id="price" value="">
		        <input type="hidden" name="seat" id="seat" value="">
		        <input type="hidden" name="ticket_quantity" id="ticket_quantity" value="">
	</form>
        <div class="bottombarmovie">
        	${ticketDTO.movie_title}
        </div>
         <div class="bottombarselect">
        		극장선택 : <span id="selectmovie">${ticketDTO.theater_name}</span> <br>
         		날짜선택 : <span id="seletedate">${ticketDTO.ticket_date}</span> <br>
         		상영관선택 : <span id="selectsangyg">${ticketDTO.sangyg_name}</span> <br>
         		시간선택 : <span id="selecttime">${ticketDTO.times_time}</span> <br>
        </div>
         <div class="bottombarpay" id="selectstat" >
         <div id="bottombarpay">
         		좌석선택 > 결제
  		</div>
        </div>
       
         <div class="bottomcount"><img onclick="formsub()" src="/movie/resources/images/20210423_173910.png"/><!-- </a> --></div>
        </div>
        
		
		<%-- <c:forEach items="${selectseat}" var="noseat"> --%>
		
		<%-- </c:forEach> --%>
	<!-- /Contaniner -->





