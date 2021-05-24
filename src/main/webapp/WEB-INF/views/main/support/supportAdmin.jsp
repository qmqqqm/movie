<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
                                메인
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
            <li class='on'><a href="${contextPath}/adminchk.do">운영자 관리 메인<i></i></a></li>
            <li class=''><a href="${contextPath}/member/memberList.do">회원 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/ticketBoardList.do">예매문의 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adEventList.do/">이벤트 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/lostItemList.do">분실물 문의 관리<i></i></a></li>
            <li class=''><a href="${contextPath}/showTheaterList.do">극장 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/movie/movieList.do">영화 관리<i></i></a></li>            
            <li class=''><a href="${contextPath}/adminTicketForm.do">예매 관리<i></i></a></li>
        </ul>
    </div>
   
</div>		
			
		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->
<script type="text/javascript">
//<![CDATA[

    (function ($) {
        $(function () {
            $('#btn_search').on('click', function () {
                if ($('#searchtext').val() == "") {
                    alert("검색어를 입력해 주세요.");
                    $('#searchtext').focus();
                    return false;
                } else {
                    Search();
                }
            });
			
			$('#searchtext').keypress(function(event){
				if(event.which == 13){
					if ($('#searchtext').val() == "") {
						alert("검색어를 입력해 주세요.");
						$('#searchtext').focus();
						return false;
					} else {
						Search();
					}
				}
			});

            function Search() {
                location.href = "/support/faq/default.aspx?searchtext=" + escape($("#searchtext").val());
                //return false;
            }

            $('.c_qu').children('a').on("click", function () {
                location.href = "/support/faq/default.aspx?searchtext=" + escape($(this).html());
                //return false;
            });

            $('.email_inquiry').on('click', function () {
                location.href = "./events.do";
            });

            $('.my_advice').on('click', function () {
                var openNewWindow = window.open("../user/login/index9824.html?g=1#contaniner", "_blank");
                if (openNewWindow)
                    openNewWindow.submit();
                else
                    alert("팝업이 허용되어 있지 않습니다.");
                //openNewWindow.focus();
                return false;

            });

            $('.talk_inquiry').on('click', function () {

                var popupWidth = 600;
                var popupHeight = 600;

                // 듀얼 모니터 기준
                var _left = (screen.availWidth - popupWidth) / 2;
                if( window.screenLeft < 0){
                    _left += window.screen.width*-1;
                }
                else if ( window.screenLeft > window.screen.width ){
                    _left += window.screen.width;
                }

                var _top= (screen.availHeight - popupHeight) / 2 - 10;

                var openNewWindow = window.open("https://cgv.enomix.co.kr/sharedfront/jsp/view/chatWindow.jsp?channelId=pcweb", "cgvTalk", "width="+popupWidth+",height="+popupHeight+",resizable=yes, toolbar=no, menubar=no, status=no, scrollbars=yes,left="+ _left + ", top="+ _top);
                if (openNewWindow)
                    openNewWindow.submit();
                else
                    alert("팝업이 허용되어 있지 않습니다.");
                //openNewWindow.focus();
                return false;
            });

        });
    })(jQuery);

//]]>
</script>

            <!--/ Contents End -->

		</div>
		<!-- /Contents Area -->
	</div>
	<!-- /Contaniner --> 
    <div class="com_pop_wrap">
		<div class="com_pop_fog"></div>
	</div>