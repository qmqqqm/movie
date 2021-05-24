if (typeof NetFunnel == "object") {
    NetFunnel.SkinUtil.add('template1', {
        prepareCallback: function () {
        },
        updateCallback: function (percent, nwait, totwait, timeleft) {
            var second = parseInt(timeleft, 10) % 60;
            var minute = (parseInt(timeleft, 10) / 60) >= 60 ? parseInt(parseInt(timeleft, 10) / 60 % 60, 10) : parseInt(parseInt(timeleft, 10) / 60, 10);
            var hour = parseInt(parseInt(timeleft, 10) / 3600, 10);
            var displayTime = "";

            if (hour > 0) {
                displayTime += hour + "시간 " + minute + "분 " + second + "초";
            }
            else if (minute > 0) {
                displayTime += minute + "분 " + second + "초";
            }
            else {
                displayTime += second + "초";
            }
            document.getElementById("NetFunnel_WaitTime").innerHTML = displayTime;
        },
        htmlStr: '<div id="NetFunnel_Skin_Top" class="layer-wrap gift_caution_traffic" style=""> \
                    <div class="popwrap"> \
                        <h1>대기자 정보</h1> \
                        <div class="pop-contents"> \
                            <p class="caution_txt1">동시 접속자 수가 많아<br>서비스 접속대기 중 입니다.</p> \
                            <div class="count_area type1"> \
                                <p class="txt1">예상 대기시간</p> \
                                <p class="txt2" id="NetFunnel_WaitTime"></p> \
                                <p class="txt3">앞에&nbsp;<span id="NetFunnel_Loading_Popup_Count"></span>명의 대기자가 있습니다.</p> \
                            </div> \
                            <p class="desc_txt">재접속, 새로고침 하는 경우 순번이<br>뒤로 밀리게 되니 주의하시기 바랍니다.</p> \
                         </div> \
                             <a href="javascript:void(0);" class="btn-close" onclick="NetFunnel.countdown_stop()">닫기</a> \
                      </div> \
                    </div>'
    }, 'normal');
}
    