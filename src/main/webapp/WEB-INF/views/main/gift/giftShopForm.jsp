<%@ page language="java"         contentType="text/html; charset=utf-8"
              pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Contaniner -->
	<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="/"><img alt="home" src="https://img.cgv.co.kr/R2014/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="/culture-event/event/">이벤트&컬처</a>
                            </li>
                        
                            <li >
                                <a href="/culture-event/popcorn-store/">기프트샵</a>
                            </li>
                        
                            <li  class="last">
                                기프트샵
                            </li>
                        
                        
                    </ul>
                </div>
                <div class="sect-special">
                    <ul>                      
                        <li><a href="/user/vip-lounge/">VIP LOUNGE</a></li>
                        <li><a href="/user/memberShip/ClubService.aspx" title="새창" class="specialclub">Club서비스</a></li>
                      
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

		<!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			
<div id="divAction"></div>
<!-- Contents Area -->
<!-- S Big Banner -->
    <div class='big_banner_wrap'>
 <ul class='bxslider'>
 <li><img src='http://img.cgv.co.kr/GiftStore/Display/PC/15468087168510.jpg' alt='기프트샵' /></li>
 </ul>
 <div class='swiper-button-prev'></div>
</div>

<!-- E Big Banner -->
<!-- S 카테고리 메뉴 & 받은선물/장바구니 -->
    

<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" />

<script language="javascript" type="text/javascript">

    var cname = "";

    history.navigationMode = 'compatible';
    $(document).ready(function () {
        $.giftstore_fixObj(this, $('.category_contents_wrap'), $('.category_content'), $('.giftstore_logo'));

        //영역 문제로 gift_store 클래스 추가
        $("#contents").addClass("gift_store");

        if (cname != "") {
            $(".sect-linemap .sect-bcrumb .last").html("");
        }

    });

    function fnCategoryData(cno) {
        location.href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=" + cno;
    }

</script>


<div class='category_wrap'>
 <div class='category_contents_wrap'>
     <ul class='category_content'>
         <li class='giftstore_logo'><a href='/culture-event/popcorn-store/default.aspx'>cgv 스토어</a></li>
<li id='cm2' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('2');">영화관람권</a></li><li id='cm3' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('3');">기프트카드</a></li><li id='cm4' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('4');">콤보</a></li><li id='cm5' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('5');">팝콘</a></li><li id='cm6' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('6');">음료</a></li><li id='cm7' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('7');">스낵</a></li><li id='cm10' name='categorymenu' class=''><a href='#' onclick="javascript:fnCategoryData('10');">플레이존</a></li><li><a href='#' onclick="javascript:location.href='/culture-event/popcorn-store/introduce-gift-card.aspx?CategoryIdx=0';">상품권소개</a></li>     </ul>
     <ul class='cart_content'>
         <li><a href='#' onclick='javascript:app.goLogin();return false;'>내 기프트콘</a><span id='giftconcnt'>0</span></li>         <li><a href='#' onclick='javascript:app.goLogin();return false;'>장바구니</a><span id='cartviewcnt'>0</span></li>     </ul>
 </div>
</div>

<!-- E 카테고리 메뉴 & 받은선물/장바구니 -->
<!-- S 타켓배너 -->
    
<!-- E 타켓배너 -->
<!-- S 핫딜영역 -->
    
<!-- E 핫딜영역 -->
<!-- S 예매고객 추천 -->
    
<!-- E 예매고객 추천 -->
<!-- S 베스트상품 10 -->
    
<!-- E 베스트상품 10 -->
<!-- S 선물추천 10 -->
    
<!-- E 선물추천 10 -->
<!-- S Category product -->
    <div class='category_product_wrap'>
    <ul class='category_product_list'>
        <li>
          <strong class='category_product_title'>영화관람권<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100253' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16094706927780.jpg" alt="CGV 영화관람권" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>CGV 영화관람권</span>                  <span class='best_product_text_name'>즐거운 경험은 CGV에서!</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>11,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100253', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100253', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100253', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100026' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15458911951520.jpg" alt="CGV 골드클래스" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>CGV 골드클래스</span>                  <span class='best_product_text_name'>최고의 관람환경을 제공하는 프리미엄 상영관</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>35,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100026', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100026', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100026', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100255' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16105061088530.jpg" alt="4DX관람권" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>4DX관람권</span>                  <span class='best_product_text_name'>오감만족 영화 속 주인공 되기</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>19,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100255', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100255', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100255', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100254' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16104445886810.jpg" alt="IMAX 관람권" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>IMAX 관람권</span>                  <span class='best_product_text_name'>사람이 볼 수 있는 최대 영상, IMAX</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>16,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100254', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100254', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100254', '0', '1'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>        <li>
          <strong class='category_product_title'>기프트카드<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' state_giftcard'>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100167' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15870045446390.jpg" alt="파코니피크닉" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>파코니피크닉</span>                  <span class='best_product_text_name'><span>온라인전용</span>
충전형 선불 카드</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price nowon'>금액충전형</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('2', '100167', '0', '10000'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100167', '0', '10000'); return false;" class="btn_category_product_buy">3</a>      <li class=' state_giftcard'>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100166' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15837175596420.jpg" alt="체리블라썸을타나봄" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>체리블라썸을타나봄</span>                  <span class='best_product_text_name'><span>온라인전용</span>
충전형 선불 카드</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price nowon'>금액충전형</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('2', '100166', '0', '10000'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100166', '0', '10000'); return false;" class="btn_category_product_buy">3</a>      <li class=' state_giftcard'>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100161' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15814124358590.jpg" alt="PACONNIE A형" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>PACONNIE A형</span>                  <span class='best_product_text_name'>충전형 선불 카드</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price nowon'>금액충전형</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('2', '100161', '0', '10000'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100161', '0', '10000'); return false;" class="btn_category_product_buy">3</a>      <li class=' state_giftcard'>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100162' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15814158039890.jpg" alt="PACONNIE B형" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>PACONNIE B형</span>                  <span class='best_product_text_name'>충전형 선불 카드</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price nowon'>금액충전형</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('2', '100162', '0', '10000'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100162', '0', '10000'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>        <li>
          <strong class='category_product_title'>콤보<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100019' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15463252009160.jpg" alt="CGV콤보" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>CGV콤보</span>                  <span class='best_product_text_name'>CGV의 영원한 베스트셀러!</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>9,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100019', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100019', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100019', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100020' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15463251537260.jpg" alt="더블콤보" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>더블콤보</span>                  <span class='best_product_text_name'>취향별로 원하는 맛 선택하세요!</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>12,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100020', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100020', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100020', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100073' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15464065561050.jpg" alt="스몰세트" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>스몰세트</span>                  <span class='best_product_text_name'>혼영할때 필수품</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>6,500</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100073', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100073', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100073', '0', '1'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>        <li>
          <strong class='category_product_title'>팝콘<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100069' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15463244796940.jpg" alt="고소팝콘(L)" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>고소팝콘(L)</span>                  <span class='best_product_text_name'>클래식 팝콘 No.1</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>5,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100069', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100069', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100069', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100068' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15463244213800.jpg" alt="달콤팝콘(L)" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>달콤팝콘(L)</span>                  <span class='best_product_text_name'>달콤한 카라멜 향이 가득한 달콤팝콘</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>6,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100068', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100068', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100068', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100071' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15463247055100.jpg" alt="더블치즈팝콘(L)" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>더블치즈팝콘(L)</span>                  <span class='best_product_text_name'>치즈매니아들 주목!</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>6,000</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100071', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100071', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100071', '0', '1'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>        <li>
          <strong class='category_product_title'>음료<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100083' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15464083668990.jpg" alt="탄산음료(M)" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>탄산음료(M)</span>                  <span class='best_product_text_name'>시원한 탄산음료와 함께 스트레스도 날리세요</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>2,500</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100083', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100083', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100083', '0', '1'); return false;" class="btn_category_product_buy">3</a>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100089' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15464096039760.jpg" alt="아메리카노(HOT)" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>아메리카노(HOT)</span>                  <span class='best_product_text_name'>현대인의 필수품</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>3,500</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100089', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100089', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100089', '0', '1'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>        <li>
          <strong class='category_product_title'>스낵<a href='/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7' class='btn_category_product'>더보기</a></strong>          <ul class='category_product_inner_list'>      <li class=' '>          <a href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100017' class='btn_category_product'>              <span class='best_product_img_wrap'><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/15459092398190.jpg" alt="칠리치즈나쵸" /></span>              <span class='best_product_text_wrap'>                  <span class='best_product_text_title'>칠리치즈나쵸</span>                  <span class='best_product_text_name'>바삭바삭 나쵸, 얼마나 맛있게요?</span>                  <span class='best_product_sale_price_wrap'>                  <span class='store_deatail_source_price'>4,900</span>                  </span>
              </span>
          </a>
          <a href="#none" onclick="javascript:fnMoveLink('1', '100017', '0', ''); return false;" class="btn_category_product_cart">1</a>          <a href="#none" onclick="javascript:fnMoveLink('2', '100017', '0', '1'); return false;" class="btn_category_product_gift">2</a>          <a href="#none" onclick="javascript:fnMoveLink('3', '100017', '0', '1'); return false;" class="btn_category_product_buy">3</a>          </ul>      </li>    </ul>
</div>

<!-- E Category product -->

<!-- S 이용안내 -->
        <div class="info_use_wrap">
	        <a href="/culture-event/popcorn-store/store-guide.aspx" class="btn_info_use">
		        <span class="btn_info_use_title">CGV 기프트샵 이용안내</span>
		        <span class="btn_info_use_subtitle">새롭게 리뉴얼한 CGV 기프트샵와 함께<br />CGV에서 또 다른 즐거움을 누려보세요.</span>
	        </a>
	        <div class="info_use">
		        <strong>CGV 고객센터</strong>
		        <span class="info_use_telnum">1544-1122</span>
		        <span>상담가능 시간 : 월~금 09:00~18:00</span>
		        <span>*이 외 시간은 자동 응답 안내 가능</span>
	        </div>
        </div>
<!-- E 이용안내 -->


<!-- /Contents Area -->

            <!--/ Contents End -->

		</div>
		<!-- /Contents Area -->
	</div>
	<!-- /Contaniner --> 
    <div class="com_pop_wrap">
		<div class="com_pop_fog"></div>
	</div>
