<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%-- pageContext를 이용하여 request객체를 얻고 얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
 		<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/module.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/common.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="${contextPath}/resources/css/print.css" /> 
		<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />

    <script type="text/javascript" src="${contextPath}/resources/js/extraTheaters.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.config.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.paging.min.js"></script>
    
    
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.utils.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.utils.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.init.js"></script>
		

    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/silverlight_link.js"></script>
		<script src="${contextPath}/resources/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/slick.css" />
		<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/slick-theme-custom.css" />

    <script type="text/javascript" src="${contextPath}/resources/js/icheck/login.timer.js"></script>
    <script src="${contextPath}/resources/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/icheck/iCheck.css" />
    <!-- 2020.05.07 감정지수/프리에그 프로젝트 추가 -->
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/preegg.css" />
   
   
   <script type="text/javascript">
        //<![CDATA[

        _TRK_CP = "/홈";

        app.config('staticDomain', 'https://img.cgv.co.kr/R2014/')
            .config('imageDomain', 'https://img.cgv.co.kr/')
            .config('isLogin', 'False');

        // AD FLOAT
        // 암호화 할 문자열과 키값(상수값)을 매개변수로 받는다.
        function EncryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // key 값을 원하는 대로 연산을 한다
                output += String.fromCharCode(str.charCodeAt(i) + parseInt(key) + 123 + i);
            }
            return output;
        }
        // 복호화
        // 암호화 된 문자열과 키값(상수값)을 매개변수로 받는다.
        function DecryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // 암호화시 사용한 연산과 같아야 한다.
                output += String.fromCharCode(str.charCodeAt(i) - (parseInt(key) + 123 + i));
            }

            return output;
        }

        function getCookieVal(offset) {
            var endstr = document.cookie.indexOf(";", offset);
            if (endstr == -1) endstr = document.cookie.length;
            return unescape(document.cookie.substring(offset, endstr));
        }
        function GetCookieAd(name) {
            var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) { //while open
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
                    return getCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
                if (i == 0) break;
            } //while close
            return null;
        }
        function setCookieAD(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000));
            document.cookie = name + "=" + escape(value) + "; expires=" + todayDate.toGMTString() + "; path=/; domain=cgv.co.kr";
        }
        function CloseAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("index.html");

            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);
            var CookieUrl = ArrAdUrl[3];

            CookieUrl = EncryptAD(CookieUrl, "15442280");
            setCookieAD(CurCookieName, CookieUrl, '1');
            $(document).find('#ad_float1').hide();
        }
        function OpenAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("index.html");
            var CookieUrl = ArrAdUrl[3];
            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);

            if (CurCookieUrl == null) {
                CurCookieUrl = "";
            }
            else {
                CurCookieUrl = DecryptAD(CurCookieUrl, "15442280");
            }

            if (CurCookieUrl.indexOf(CookieUrl) != -1) {
                $(document).find('#ad_float1').hide();
            }

            //section.cgv.co.kr 매거진 체크
            var magazineckurl = GetCookieAd("CgvPopAd-magazine");
            if (magazineckurl != null) {
                var magazineck = DecryptAD(magazineckurl, "15442280");
                if (magazineck != null && magazineck == "magazine") {
                    //값이있는경우 표시하지않음
                    $(document).find('#ad_float1').hide();
                }
            }
        }

        //]]>
    </script>
    <script type="text/javascript" src="https://nsso.cjone.com/findCookieSecured.jsp?cjssoq=JnpDIdPxV2I4b4b3slodbvAD1mmrEuB00b2g9A7I8YXnG3BnS%2bzJH0NyknJmxLwwh8sJ5rs7%2fTXc%2bN0b4%2bmSrzdHWGs5ek44Q05YbTErejd6M3pmbi9aSnAwaEdETGQxQlJLUEpCNVM0TVEwa3Q0YWJHbXROZUlsM1llWlMrMEk%3d"></script>
</head>

<body class="">
<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>		
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>

</body>
</html>










