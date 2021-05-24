    function Login() {

        if (confirm('로그인 후 이용 가능합니다.\n로그인 페이지로 이동하시겠습니까?')) location.href = "/user/login/?returnURL=" + location.href; return false;
		//if (confirm('로그인 후 이용 가능합니다.\n로그인 페이지로 이동하시겠습니까?')) location.href = "http://www.cgv.co.kr"; return false;
    }
	
	var goReserve = function (movieIdx, cgvCode, title, rating, rKind) {
		
		window.location.href = "http://www.cgv.co.kr/ticket/?MOVIE_CD="+cgvCode+"&MOVIE_CD_GROUP=" + cgvCode;
		
	}
	
	var goReserveV2 = function (strMovieIdx, cgvCode, movTitle, rateCode, rKind, sm_type) {
		
		window.location.href = "http://www.cgv.co.kr/ticket/?MOVIE_CD="+cgvCode+"&MOVIE_CD_GROUP=" + cgvCode;
	
	}

    var sVdoPlay2 = function (mUrl) {
        window.location.href = mUrl;
    }

    var goOutLink = function (url) {
        window.location.href = url;
    }