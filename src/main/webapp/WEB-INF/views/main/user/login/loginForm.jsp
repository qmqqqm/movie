<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <style>

</style>
<!-- Contaniner -->
	<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">회원서비스</a>
                            </li>
                        
                            <li  class="last">
                                로그인
                            </li>
                        
                        
                    </ul>
                </div>
                <div class="sect-special">
                    <ul>                      
                        <li><a href="../vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../memberShip/ClubService.html" title="새창" class="specialclub">Club서비스</a></li>
                      
                    </ul>
                </div>
            </div>
        </div>


<!-- 실컨텐츠 시작 -->
<div class="wrap-login">
    <div class="sect-login">
        <ul class="tab-menu-round">
            <li class="on">
                <a style="background: pink; color: white;">로그인</a>
            </li>
        </ul>
        <div class="box-login">
            <h3 class="hidden">회원 로그인</h3>
            <form id="form1" method="post" action="${contextPath}/member/login.do" novalidate="novalidate" >
            <fieldset>
                <legend>회원 로그인</legend>
                <p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
                <div class="login">
                    <input type="text" title="아이디" id="txtUserId" name="member_userid" data-title="아이디를 " data-message="입력하세요." required="required" />
                    <input type="password" title="패스워드" id="txtPassword" name="member_pwd" data-title="패스워드를 " data-message="입력하세요." required="required" />
                </div>
                <button type="submit" id="submit" title="로그인" style="background: pink; color: white;">로그인</button>
            </fieldset>
            </form>           
        </div>
    </div>   
    
  
</div>
<!-- 실컨텐츠 끝 --> 

<!-- LogIn -->
<form name="loginform" id="loginform" method="post" action="https://www.cgv.co.kr/user/login/login.aspx" novalidate="novalidate">
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="password" id="password" />
    <input type="hidden" name="id_save" id="id_save" />
	<input type="hidden" name="returnURL" value="../../default.html" />
</form>
<!-- //LogIn -->

<script type="text/javascript" src="../../../img.cgv.co.kr/R2014/js/system/crypto.js"></script>
<script type="text/javascript">
//<![CDATA[
    (function ($) {
        $(function () {         



            // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
            var userInputId = getCookie("cgv.cookie.UserID_RE=UserID_RE");
            $("input[name='txtUserId']").val(userInputId);

            if (userInputId != '') {
                $("#loginSet").prop('checked', true);
                $("#loginSet").attr('checked', true);
            }

            $("#loginSet").change(function () {
                if ($("#loginSet").is(":checked")) {
                    if ($("input[name='txtUserId']").val() == '') {
                        alert("아이디를 입력하세요.");
                        $("#loginSet").prop('checked', false);
                        $("#loginSet").attr('checked', false);                   
                        return false;
                    }

                    setCookie("cgv.cookie.UserID_RE=UserID_RE", $("#txtUserId").val(), 7);
                }
                else {
                    setCookie("cgv.cookie.UserID_RE=UserID_RE", "", -1);
                    $("input[name='txtUserId']").val('');
                }
            });

            function setCookie(cookieName, value, exdays) {

                var exdate = new Date();
                exdate.setDate(exdate.getDate() + exdays);
                var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
                document.cookie = cookieName + "=" + cookieValue;
            }

            function deleteCookie(cookieName) {
                var expireDate = new Date();

                expireDate.setDate(expireDate.getDate() - expireDate.getDate());
                document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
            }

            function getCookie(cookieName) {
                cookieName = cookieName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cookieName);
                var cookieValue = '';
                if (start != -1) {
                    start += cookieName.length;
                    var end = cookieData.indexOf(';', start);
                    if (end == -1) end = cookieData.length;
                    cookieValue = cookieData.substring(start, end);
                }
                return unescape(cookieValue);
            }
        });
    })(jQuery);
//]]>
</script>
</div>
            <!--/ Contents End -->









