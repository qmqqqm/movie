<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.step{
	width:70%;
	height:400px;
	
	border:1px solid #F6CECE;
	float: left;
} 
.payment{
	width:29%;
	height:200px;
	float: left;
}
.title{
	text-align: left;
	font-size:15px;
	color:black;
	background: pink;
	padding:5px 10px;
}
.content{
	text-align: left;
	font-size:15px;
	color:black;
	padding:5px 10px;
	margin : 3px 0;
	border-bottom: 1px solid #F6CECE;
}
.paytitle{
text-align: center;
	font-size:15px;	
	padding:5px 10px;

}
.pay{
	text-align: right;
	font-size:15px;	
	padding:5px 10px;
	background:pink;
	color:black;

}

.paylap{
width : 80%;
border:1px solid black;
margin:10px auto;
}

.bottombar{
	clear: both;
	height:100px;
	background:pink;
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
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

function payment(){

result=(document.getElementById('pay').innerText);
kind=$('input[name="pay"]:checked').attr('id');
IMP.init('imp88822222'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : kind,
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount:result	,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});
}

function aa(){	
	var pricevalue=0;
	pricevalue=document.getElementById('pay').innerText;
	result=Integer.parseInt(pricevalue);
	payment();
	}

function paychange(kind){
	document.getElementById("paykind").innerText=$(kind).val();
	}
</script>

<div id="contaniner">
${aa}
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
        
        <div class="step">
        <div class="title">STEP 1.</div>
         <div class="content">할인선택</div>
        <div class="title">STEP 2.</div>
        <div class="content">관람권/기프트콘</div>
        <div class="title">STEP 3.</div>
        <div class="content">포인트및 기타결제수단</div>
        <div class="title">STEP 4.최종결제수단</div>
        <div class="content">
        
        <input type="radio" name="pay" id="card" onchange="paychange(this)" value="신용카드">신용카드        
        <input type="radio" name="pay" id="trans" onchange="paychange(this)" value="실시간계좌이체">실시간계좌이체
        <input type="radio" name="pay" id="vbank" onchange="paychange(this)" value="가상계좌">가상계좌
        <input type="radio" name="pay" id="phone" onchange="paychange(this)" value="휴대폰결제">휴대폰결제
       
        
        </div>
        
        
               

        </div>
        <div class="payment">
       <div class="paylap">
        <div class="paytitle">결제하실금액</div>
        <div class="pay" ><span id="pay">${price}</span> 원</div>
        </div>
        <div class="paylap">
        <div class="paytitle">할인내역</div>
        <div class="paytitle">총할인금액</div>
        <div class="pay">0원</div>
		</div>
		<div class="paylap">
        <div class="paytitle">결제내역</div>
        <div class="paytitle"><span id="paykind">신용카드</span><br/><span  >${price}원</span></div>
        <div class="paytitle">남은결제금액</div>
        <div class="pay">${price}원</div>
        <%-- <form id="ticketComplete" action="./ticketComplete.do">
        <input type="hidden" name="" value=""/>
        <input type="hidden" name="" value=""/>
        <input type="hidden" name="" value=""/>
        <input type="hidden" name="" value=""/>
        <input type="hidden" name="" value=""/>
        <input type="hidden" name="seat" value="${seat}"/>
        <input type="hidden" name="price" value="${price}"/>
        <div><input type="submit" value="테스트 결제"/> </div>
        </form> --%>
        </div>
        
        </div>
        </div>
        

        <div class="bottombar">
        <div class="bottombarmovie">
        	영화선택
        </div>
         <div class="bottombarselect">
        
         		극장선택
        </div>
         <div class="bottombarpay">
         		일반석<br/>
         		${seat}
        </div>
         <div class="bottomcount"><img onclick="payment()" src="/movie/resources/images/20210426_164923.png"/></a></div>
        </div>
	<!-- /Contaniner -->





