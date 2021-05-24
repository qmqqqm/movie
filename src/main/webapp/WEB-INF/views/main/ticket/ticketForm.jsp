<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.movie {
	width: 26%;
	height: 500px;
	float: left;
	border: 1px solid black;
	margin: 10px 1px;
}

.theaters {
	width: 26%;
	height: 500px;
	float: left;
	border: 1px solid black;
	margin: 10px 1px;
}

.local {
	float: left;
	width: 40%;
}

.localsub {
	width: 55%;
	float: left;
}

.day {
	width: 10%;
	height: 500px;
	float: left;
	border: 1px solid black;
	margin: 10px 1px;
}

.time {
	width: 35%;
	height: 500px;
	float: left;
	border: 1px solid black;
	margin: 10px 1px;
}

.bottombar {
	clear: both;
	height: 100px;
	background: pink;
}

.title {
	text-align: center;
	font-size: 15px;
	font-weight: 400;
	color: black;
	background: pink;
	padding: 5px 0;
}

.bottombarmovie {
	width: 25%;
	height: 60px;
	border-right: 1px solid white;
	margin: 20px 0;
	font-size: 25px;
	font-weight: 900;
	text-align: center;
	float: left;
}

.bottombarselect {
	width: 25%;
	height: 60px;
	border-right: 1px solid white;
	margin: 20px 0;
	font-size: 25px;
	font-weight: 900;
	text-align: center;
	float: left;
}

.bottombarpay {
	width: 25%;
	height: 60px;
	margin: 20px 0;
	font-size: 25px;
	font-weight: 900;
	padding: 0 10px;
	float: left;
}

.bottomcount {
	width: 21%;
	height: 60px;
	margin-right: 0;
	float: right;
}

.location {
	font-size: 17px;
	text-align: right;
	margin: 0px 10px 0 0;
	cursor: pointer;
}

.local {
	text-align: right;
	padding: 10px 10px 0px 0px;
}

.theater_names>span {
	text-aling: right;
	margin: 0 0 10px 0;
}

#day_name {
	font-size: 15px;
	text-align: center;
	margin: 0px 3px 3px 0px;
	pointer-events: none;
}

.dayCho {
	padding: 15px 0px 15px 0px;
	font-weight: 400;
	font-size:15px;
}

.theater_names {
	font-weight: 400;
	margin: 0px;
	cursor: pointer;
	padding: 10px 0px 0px 0px;
}

.theaterCss span {
	margin: 0px;
	overflow: hidden;
}

.theaterCss {
	padding: 9px 0px 9px 3px;
	margin: 6px 0px 0px 105px;
	width: 139px;
	font-size:15px;
	height: 20px;
	overflow: hidden;
	text-overflow:ellipsis; 
	white-space:nowrap;
	

}

.localCss {
	padding: 9px 0px 9px 0px;
	background-color: pink;
	margin: 6px 0px 0px 10px;
	width: 90px;
	height: 20px;
	font-weight: 400;
}

.nalbottom {
	overflow: auto;
	height: 470px;
}

.movie_names {
	padding: 10px 0px 0px 0px;
}

.movie_name_css {
	font-size: 15px;
	font-weight: 400;
	padding: 9px 0px;
	margin: 6px 10px 0px 10px;
/* 	border-bottom: 1px solid black; */
/* 	border-top: 1px solid black; */
	height: 20px;
}

.movie_title_css {
	font-size: 18px;
	font-weight: 400;
	padding: 9px 0px;
	margin: 6px 0px 0px 10px;
}
.dayCss{
	padding:5px;
	pointer-events: none;
}

.times{
	padding:10px;
	margin:10px;
}
/* .timesparent{ */
/* 	width:140px; */
/* 	height 30px; */
/* 	margin:0px; */
/* 	padding:5px; */
/* } */
</style>
<script src="/webjars/jquery/2.2.1/jquery.min.js"></script>
<script>
$(function() {

	/* 극장위치 선택  */
	$(".location").on("click",function(){
		$.ajax({
			type : "POST",
			url : "./theaterchoice.do",
			data : {
				'name' : $(this).text()
			},
			dataType : "json",
			success : function(theater) {
				$("#theater_name").empty();
				$(".dayCho").css('background','');
				$(".dayCho").css('fontWeight','');
				$("#sangyg_name").empty();
				for (var i = 0; theater.theaterchoice.length; i++) {
					var h = theater.theaterchoice[i].theater_name; //극장이름
					var k = theater.theaterchoice[i].theater_id; //극장 아이디 값
					var str = "<div class='theaterCss'><span onclick='selecttheater(this)' id='theater_"+k+"'>"+h+"</span></div>"
					$("#theater_name").append(str);
				}
			},//success
			error : function(xhr, status, error) {
				alert("11111111");
			}//error  
		});//ajax
	})//on

		//오늘 날짜
		var today = new Date();

		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1; // 월
		var date = today.getDate(); // 날짜
		var dayA = today.getDay(); // 요일

		var day1 = year + '-' + month + '-' + date;

		//20일 후 날짜
		var oneMonthLater = new Date(today.setDate(today.getDate() + 20));

		var year2 = oneMonthLater.getFullYear(); // 년도
		var month2 = oneMonthLater.getMonth() + 1; // 월
		var date2 = oneMonthLater.getDate(); // 날짜
		var dayB = oneMonthLater.getDay(); // 요일

		var day2 = year2 + '-' + month2 + '-' + date2;

		//	 	var res_day = [];
		var dayTxt = [ "일", "월", "화", "수", "목", "금", "토" ];
		var ss_day = new Date(day1);
		var ee_day = new Date(day2);
		var monthTxt = '';
		while (ss_day.getTime() <= ee_day.getTime()) {
			var _mon_ = (ss_day.getMonth() + 1);

			if (monthTxt != _mon_) {
				monthTxt = _mon_;
				var innerHtml = "<div><div><span style='font-size:30px; font-weight:800;'>"
						+ _mon_ + "</span>" + "</div></div>";
				$(".reserve-date").append(innerHtml);
			}

			_mon_ = _mon_ < 10 ? '0' + _mon_ : _mon_;
			var _day_ = ss_day.getDate();
			_day_ = _day_ < 10 ? '0' + _day_ : _day_;
			var todayTxt = ss_day.getFullYear() + '-' + _mon_ + '-' + _day_
					+ '-' + dayTxt[ss_day.getDay()];
			var todayTxtList = todayTxt.split("-");

			var todayYearTxt = todayTxtList[0];
			var todayMonthTxt = todayTxtList[1];
			var todayDateTxt = todayTxtList[2];
			var todayDayTxt = todayTxtList[3];

			var innerHtml2 = "<div class='dayCss'>";
			innerHtml2 += "<p class='dayCho' onclick='selectday(this)' style='pointer-events: none;'";
			innerHtml2 += "id='" + todayYearTxt + todayMonthTxt + todayDateTxt
					+ "');";
			innerHtml2 += ">" + todayDayTxt + " " + todayDateTxt + "</p>";
			innerHtml2 += "</div>";

			$(".reserve-date").append(innerHtml2);

			ss_day.setDate(ss_day.getDate() + 1);
		}

	});//jqury

	// 선택한 영화이름 담는 전역변수
	var selectmoviename;
	//선택한 극장이름 담는 전역변수
	var selecttheatername;
	//선택한 날자 담는 전역변수
	var selectdayname;
	//선택한 영화 아이디 담는 전역변수
	var selectmovieid;
	//선택한 극장 아이디 담는 전역변수
	var selecttheaterid;
	//극장 css처리용 div id담는 전역변수 
	var theaterid;
	//날짜 css처리용
	var dayname;

	//유저가 영화클릭시실행
	function selectmovie(movie) {
		var moviename = "";
		var movieid = 0;
		$("#sangyg_name").empty();
		$("#sangyg_name").empty();
		moviename = movie.innerText;
		movieid = movie.getAttribute('id');
		$(".theater_names").css('font-weight', ''); //추가
		$(".theater_names").parent().css('background', ''); //추가
		$(".dayCho").css('background', ''); //추가
		$(".dayCho").css('font-weight', ''); //추가
		$(".movie_title_css").css('font-weight', ''); //추가
		if (selectmovieid == null) {
			// 		movie.style.color="red";
			$(movie).parent().css('background', 'pink'); //추가
			selectmovieid = movieid;
		} else {
			// 		document.getElementById(selectmovieid).style.color="";
			$(document.getElementById(selectmovieid)).parent().css(
					'background', ''); //추가
			selectmovieid = movieid;
			// 		movie.style.color="red";	
			$(movie).parent().css('background', 'pink');
		}
		selectmoviename = moviename;
		userSelect();
		$(".movie_id").val(movieid);
		$(".movie_title").val(moviename);
		$(".bottombarmovie").html(moviename); //영화 선택시 하단 영역에 영화 이름 추가
	}
	//유저가 극장클릭시실행
	function selecttheater(theater) {
		var theatername = "";//극장명 담을 임시변수
		$("#sangyg_name").empty();
		theatername = theater.innerText; // html 극장명 변수에 담기
		if (selecttheaterid == null || selecttheaterid == undefined
				|| selecttheaterid == "") { //유져가 선택한 극장 아이디가 없으면
		// 		theater.style.color="red"; //선택한 극장 글자를 빨간색으로 변경
			$(theater).parent().css('background', 'pink'); //추가
			theaterid = theater.getAttribute('id'); //유져가 선택한 극장명 아이디값을 임시 아이디 저장소에 저장
			id = theaterid.split('_'); // 디비 아이디 추출릉위해 theater_id 로 태그 아이디 지정 하여 스플릿
			selecttheaterid = id[1]; // 뒷에값이 디비 아이디이므로 뒤엤값 유져가 선택한 id값저장소에 저장
		} else {
			$("#theater_name").children().css('color', '');
			$(".theater_names").parent().css('background', ''); //추가
			$(".dayCho").css('background','');
			theaterid = theater.getAttribute('id'); //유져 선택한 태그 아이디 변수에 저장
			id = theaterid.split('_'); //디비 아이디추출위해 불리
			selecttheaterid = id[1]; // 디비아이디 추출후 유져 선택변수에 저장
			// 		theater.style.color="red"; // 유져 선택한 태그 글씨색 빨간색으로 변경
			$(theater).parent().css('background', 'pink'); // 추가
		}
		selecttheatername = theatername;
		
		userSelect();
		$(".theater_id").val(selecttheaterid);
		$(".theater_name").val(selecttheatername);
		$(".bottombarselect").html(selecttheatername);
	}
	//유저가 날짜 클릭시실행
	function selectday(day) {
		if (selectdayname == null) {
			// 		day.style.color="red";
			$(day).css('background', 'pink'); //추가
			dayname = day.getAttribute('id');
			selectdayname = dayname;
		} else {
			// 		document.getElementById(dayname).style.color="";
			$(document.getElementById(dayname)).css('background', '');//추가
			dayname = day.getAttribute('id');
			selectdayname = dayname;
			// 		day.style.color="red";
			day.style.background = "pink";
		}

		userSelect(); //아작스 함수 호출
	}

	/* function test(){
	 alert(selectmoviename);
	 alert(selecttheatername);
	 alert(selectdayname);
	 } */

	//유져가 클릭한 값들처리를 위한 아작스
	function userSelect() {
		$.ajax({
					type : "POST",
					url : "./userSelect.do",
					// 전역변수에 유저가 선택한 값 파라미터 전달
					data : {
						'selectmovieid' : selectmovieid,
						'selecttheaterid' : selecttheaterid,
						'selectdayname' : selectdayname
					},
					dataType : "json",
					success : function(theater) {
						//확인용
						//alert(theater.theaterchoice);
						//         	$("#movie_name").empty();
						//         	$("#theater_name").empty();
						//         	$("#day_nSame").empty();
						//$("#sangyg_name").empty();
						//	$(".reserve-date").empty();
						//여긴 진입 완료
						for (var i = 0; theater.theaterchoice.length; i++) {
							var theatername = theater.theaterchoice[i].theater_name;
							var theaterid = theater.theaterchoice[i].theater_id;
							var moviename = theater.theaterchoice[i].movie_title;
							var movieid = theater.theaterchoice[i].movie_id;
							var dayname = theater.theaterchoice[i].times_time;
							var sangygname = theater.theaterchoice[i].sangyg_name;
							var sangygid = theater.theaterchoice[i].sangyg_id;
							document.getElementById(movieid).style.fontWeight = "1000"; //변경

							document.getElementById('theater_' + theaterid).style.fontWeight = "1000"; //변경
							document.getElementById('theater_' + theaterid).style.pointerEvents = "auto";
							$(".location").css('pointer-events', 'auto');
							day = dayname.substring(0, 10);
							imsi = day.split("-")
							dayid = imsi[0] + imsi[1] + imsi[2];
							document.getElementById(dayid).style.fontWeight = "1000"; //변경
							document.getElementById(dayid).style.pointerEvents = "auto";
							
							//var strmoviename = "<div class='theaterCho' ><span onclick='selectmovie(this)' id='${movie.movie_id}'> "+moviename+"</span><br/><input class='theaterCode' type='hidden' value='"+selectmovieid+"'></div>"
							//var strtheatername = "<span onclick='selecttheater(this)' id='theater_${theaters.theater_id}'>" +theatername+"</span><br><input class='theaterCode' type='hidden' value='"+selecttheaterid+"'>"
							//var strdayname = "<div class='theaterCho' ><span class='theaterTxt' onclick='selecttheater(this)'>"+dayname+"</span><input class='theaterCode' type='hidden' value='"+dayname+"'></div>"
							var strsangygname = "<span class='theaterTxt' >"+ sangygname+ "</span><input class='theaterCode' type='hidden' value='"+sangygname+"'><br/>"
							// var strdaytime = "<span class='times' onclick='timeClick()'>"+dayname.substring(10,16)+"<input class='timeCode"+i+"' type='hidden' value='"+dayname+"'></span><br/>"
							//$("#movie_name").append(strmoviename);

							// $("#theater_name").append(strtheatername);

							// $(".reserve-date").append(strdayname);

							$(".sangyg_name").val(sangygname);
							//                  $("#sangyg_name").append(strdaytime);
						}

					},//success
					error : function(xhr, status, error) {
						alert("11111111");
					}//error  
				});//ajax

	}

	//유저가 영화, 극장, 날짜 선택 후 시간 출력 AJAX
	$(function() {
		$("#day_name")
				.on(
						"click",
						function() {
							alert("selectdayname = " + selectdayname);
							$
									.ajax({
										type : 'post',
										url : './selectTime.do',
										data : {
											'movie_id' : selectmovieid,
											'theater_id' : selecttheaterid,
											'times_time' : dayname
										},
										dataType : 'json',
										success : function(xml) {
											$("#sangyg_name").empty();
											for (var i = 0; i < xml.time.length; i++) {
												var times = xml.time[i].times_time;
												var sangyg_id = xml.time[i].sangyg_id;
												var times_seat = xml.time[i].times_seat;
												var sangyg_name = xml.time[i].sangyg_name;
												var strdaytime = "<div class='timesDiv' style='font-size:15px; margin-bottom: 20px;'><span class='times' onclick='timeClick(this)'>"+times+times_seat+"석<input class='timeCode"+(i+1)+"' type='hidden' value='"+dayname+","+times+"'></span></div>"
												$("#sangyg_name").append(strdaytime);
												$(".sangyg_id").val(sangyg_id);
												$(".times_seat").val(times_seat);
											}
										},
										error : function(xml) {
											alert("에러");
										}
									});
						});
	});
	function timeClick(time) {
		
		$(".times").css("background", "");
		$(".timesDiv").css("fontWeight", "");
		for (var i = 0; i < $(time).length; i++){
			var timeData1 = $(time);
			var timeData = timeData1.children().val();
			time = timeData.split(",");

			$(".ticket_date").val(time[0]);
			$(".times_time").val(time[1]);
			
			$(timeData1).css("background", "pink");
			$(timeData1).parent().css("fontWeight", "1000");
		}
		}

	function choice_Check() {
		if (selectmoviename == null) {
			alert("영화를 선택하세요.");
			return false;
		} else if (selecttheatername == null) {
			alert("극장을 선택하세요.");
			return false;
		} else if (selectdayname == null) {
			alert("상영 날짜를 선택하세요.");
			return false;
		}
		document.formData.submit();
	}
	
	
	function theaterLocationClick(location) {
		var locationName = $(location).text();
		var locationFrm = $(".theater_location").val();
		$(".theater_location").val(locationName);
			$(".localCss").css('background', 'pink');
			$(".localCss").css('fontWeight', '400');
		if (locationFrm!=null) {
			$(location).parent().css('background', 'none');
			$(location).parent().css('fontWeight', '1000');
		}
	}
	
	//처음 화면 시작시에 서울 백그라운드 지우는 곳
	$(function(){
		var a = $('.local').children().text();
		tc= a.split("");
		loc = tc[0]+tc[1];
		kkk = $(".localCss").children().first().text()
		if(kkk==loc){
			$(".localCss").children().first().parent().css('background','none');
			$(".localCss").children().first().parent().css('fontWeight','1000');
		}
		});
</script>
<div id="contaniner">
	<form name="formData" id="formData" action="${contextPath}/goData.do"
		method="post" onsubmit="return false">
		<input type="hidden" name="movie_id" class="movie_id" value="" /> 
		<input type="hidden" name="movie_title" class="movie_title" value="" />
		<input type="hidden" name="theater_id" class="theater_id" value="" /> 
		<input type="hidden" name="theater_name" class="theater_name" value="" /> 
		<input type="hidden" name="times_time" class="times_time" value="" /> 
		<input type="hidden" name="ticket_date" class="ticket_date" value="" /> 
		<input type="hidden" name="sangyg_id" class="sangyg_id" value="" /> 
		<input type="hidden" name="sangyg_name" class="sangyg_name" value="" /> 
		<input type="hidden" name="times_seat" class="times_seat" value="" /> 
		<input type="hidden" name="theater_location" class="theater_location" value="서울" /> <!-- css용 -->
	</form>

	<!-- LineMap -->
	<div id="navigation_line" class="linemap-wrap">
		<div class="sect-linemap">
			<div class="sect-bcrumb">
				<ul>
					<li><a href="./main.do"><img alt="home"
							src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
					<li><a href="index.html">예매</a></li>
					<li class="last">빠른예매</li>
				</ul>
			</div>
			<div class="sect-special">
				<ul>
					<li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
					<li><a href="../user/memberShip/ClubService.html"
						class="specialclub" title="새창">CLUB 서비스</a></li>
					<!-- <li><a href="#" class="photi" title="새창">포토티켓</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- //LineMap -->

	<!-- Contents Area -->
	<div id="contents" style="height: 1px; padding: 0;"></div>
	<p onclick="test() ">변수설정테스트</p>
	<div class="movie">
		<div class="title">영화</div>
		<div id="movie_name" class="movie_names">
			<c:forEach items="${movieList.movies}" var="movie">
				<div class="movie_name_css">${movie.movie_rating}<span
						onclick="selectmovie(this), movieClick()" id="${movie.movie_id}"
						class="movie_title_css">${movie.movie_title}</span>
				</div>
			</c:forEach>
		</div>

	</div>
	<div class="theaters">
		<div class="title">지역</div>
		<div class="local">
			<c:forEach items="${movieList.location}" var="theaters" varStatus="status">
				<div class="localCss"><span class="location" style="pointer-events: none;" onclick="theaterLocationClick(this)">${theaters.theater_location}</span></div>
			</c:forEach>
		</div>

		<c:if test="${theaterchoice==null}">
			<div id="theater_name" class="theater_names">
				<c:forEach items="${movieList.theater}" var="theaters" varStatus="status">
					<div class='theaterCss'>
						<span class="theater_names" style="pointer-events: none;" onclick="selecttheater(this)" id="theater_${theaters.theater_id}">${theaters.theater_name}</span>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${theaterchoice!=null}">
			<div class="theater_names" id="theater_name"></div>
		</c:if>
	</div>

	<div class="day">
		<div class="title" id="nal">날짜</div>
		<div class="nalbottom">
			<div style="text-align: center; padding: 15px 0px 0px 0px;">
				<span style="font-size: 10px; font-weight: 800;">2021</span>
			</div>
			<div id="day_name" style="height: 450px;">
				<div class="reserve-date" style="pointer-events: none;"></div>
			</div>
		</div>
	</div>
	<div class="time">
		<div class="title">시간</div>
		<div>
			<div id="sangyg_name" style="margin:30px 0px 0px 0px;"></div>
		</div>
	</div>
</div>
<div class="bottombar">
	<div class="bottombarmovie">영화선택</div>
	<div class="bottombarselect">극장선택</div>
	<div class="bottombarpay">좌석선택 > 결제</div>
	<div class="bottomcount">
		<button type="submit" form="formData" onClick="choice_Check()">
			<img src="/movie/resources/images/20210423_170823.png" />
		</button>

	</div>
</div>
<!-- /Contaniner -->





