$('#fullpage').fullpage({
    // fullpage.js options go here
    anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
    menu: '#menu',
    scrollingSpeed: 1000,
    css3:false,
    afterLoad: function(anchorLink, index) {
            if (anchorLink === 'secondPage') {

                //header 배경색
                $('.header').addClass('white_header').removeClass('black_header');
                //header 로그인, 회원가입, 예약확인 색깔
                $('.header li a').addClass('black_li').removeClass('white_li');
                // hotel logo image
                $('.logo').addClass('black_logo').removeClass('white_logo');
                // 3줄 버튼 이미지
                $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
                // 상품찾기 돋보기 이미지
                $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
                //reserve 버튼
                $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');

            } else {

                //header 배경색
                $('.header').addClass('white_header').removeClass('black_header');
                //header 로그인, 회원가입, 예약확인 색깔
                $('.header li a').addClass('white_li').removeClass('black_li');
                // hotel logo image
                $('.header .logo').addClass('white_logo').removeClass('black_logo');
                // 3줄 버튼 이미지
                $('.header .btnMenu').addClass('white_btnMenu').removeClass('black_btnMenu');
                // 상품찾기 돋보기 이미지
                $('.topUtil .hotelFind').addClass('white_find').removeClass('black_find');
                //reserve 버튼
                $('.btn_opener').addClass('white_btn_opener').removeClass('black_btn_opener');

            }
    }

});

var room_options_body = document.getElementById("room_options_body");
var room_options = document.getElementById("room_options");
var select_hotel_body = document.getElementById("select_hotel_body");
var select_hotels = document.getElementById("select_hotels");
var calendars_body = document.getElementById("calendars_body");
var calendars = document.getElementById("calendars");
var mainResveForm = document.getElementById("mainResveForm");
var icon_scroll = document.getElementById("icon_scroll");
var main_txt = document.getElementById("main_txt");

$(function (){
    $(".page4_logo01").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08")
        },100);
        $(".bg_imgs04").addClass("bg_imgs04_01");
    });
    $(".page4_logo02").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08");
        },100);
        $(".bg_imgs04").addClass("bg_imgs04_02");
    });
    $(".page4_logo03").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08");
        },100);
        $(".bg_imgs04").addClass("bg_imgs04_03");
    });
    $(".page4_logo04").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").addClass("bg_imgs04_04");
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08");
        },100);
    });
    $(".page4_logo05").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").addClass("bg_imgs04_05");
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08");
        },100);
    });
    $(".page4_logo06").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").addClass("bg_imgs04_06");
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_08");
        },100);
    });
    $(".page4_logo07").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").addClass("bg_imgs04_07");
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
            $(".bg_imgs04").removeClass("bg_imgs04_08")
        },100);
    })
    $(".page4_logo08").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").addClass("bg_imgs04_08");
        setTimeout(function(){
            $(".bg_imgs04").removeClass("bg_imgs04_02");
            $(".bg_imgs04").removeClass("bg_imgs04_03");
            $(".bg_imgs04").removeClass("bg_imgs04_04");
            $(".bg_imgs04").removeClass("bg_imgs04_05");
            $(".bg_imgs04").removeClass("bg_imgs04_06");
            $(".bg_imgs04").removeClass("bg_imgs04_07");
            $(".bg_imgs04").removeClass("bg_imgs04_01");
        },100);
    });



    $("#search_box").prop("disabled", false);
});


/*check in*/
document.body.style.overflow = "hidden";
var CDate = new Date();
var today = new Date();
var selectCk = 0;
var check = 1;
/*checkOut*/
var CDate02 = new Date();
var selectCk02 = 0;
var check02 = 1;

/*오늘 날짜*/
var defaultYear = CDate.getFullYear();
var defaultMonth =( CDate.getMonth() + 1).toString().padStart(2, '0');
var defaultDate = CDate.getDate().toString().padStart(2, '0');
var defaultDayOfWeek = CDate.getDay();

var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
var defaultDayOfWeekText = daysOfWeek[defaultDayOfWeek];
var defaultFormattedDate = defaultYear + "." + defaultMonth + "." + defaultDate + " (" + defaultDayOfWeekText + ")";

/*선택 안했을시*/
document.getElementById("check_in").innerText = defaultFormattedDate;
document.getElementById("check_in_hidden").value = defaultYear + "-" + defaultMonth + "-" + defaultDate;
document.getElementById("check_in_show").value = defaultFormattedDate;

/*내일날짜*/
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);
var  yesterday = new Date();
yesterday.setDate(yesterday.getDate() + -1);

var tomorrowYear = tomorrow.getFullYear();
var tomorrowMonth = (tomorrow.getMonth() + 1).toString().padStart(2, '0');
var tomorrowDate = tomorrow.getDate().toString().padStart(2, '0');
var tomorrowDayOfWeek = tomorrow.getDay();

var tomorrowDayOfWeekText = daysOfWeek[tomorrowDayOfWeek];
var tomorrowFormattedDate = tomorrowYear + "." + tomorrowMonth + "." + tomorrowDate + " (" + tomorrowDayOfWeekText + ")";

/*선택 안했을시*/
document.getElementById("check_out").innerText = tomorrowFormattedDate;
document.getElementById("check_out_hidden").value = tomorrowYear + "-" + tomorrowMonth + "-" + tomorrowDate;
document.getElementById("check_out_show").value = tomorrowFormattedDate;

var buildcalendar = function(){
    /*check in*/
    var htmlDates = '';
    var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날
    var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
    var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
    document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
    document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
    /*check in*/
    const dates = [];
    if(thisFirst.getDay()!=0){
        for(var i = 0; i < thisFirst.getDay(); i++){
            dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
        }
    }
    for(var i = 1; i <= thisLast.getDate(); i++){
        dates.push(i); // 이번 달 날짜 채우기
    }
    for(var i = 1; i <= 13 - thisLast.getDay(); i++){
        dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
    }

    for(var i = 0; i < 42; i++){
        if(i < thisFirst.getDay()){
            htmlDates += '<div class="date last">'+dates[i]+'</div>';
        }else if(i >= thisFirst.getDay() + thisLast.getDate()){
            htmlDates += '<div class="date next">'+dates[i]+'</div>';
        }else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
            htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>';
        }else{
            htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>';
        }
    }

    document.querySelector(".dates").innerHTML = htmlDates;
}

var buildcalendar02 = function(){
    /*checkOut*/
    var htmlDates02 = '';
    var prevLast02 = new Date(CDate02.getFullYear(), CDate02.getMonth(), 0); //지난 달의 마지막 날
    var nextFirst02 = new Date(CDate02.getFullYear(), CDate02.getMonth() , 1); //다음 달의 첫째 날
    var nextLast02 = new Date(CDate02.getFullYear(), CDate02.getMonth() + 1, 0); //다음 달의 마지막 날
    document.querySelector(".year02").innerHTML = nextFirst02.getFullYear() + "년";  // year에 년도 출력
    document.querySelector(".month02").innerHTML = (nextFirst02.getMonth() + 1) + "월";  //month에 월 출력

    /*checkOut*/
    const dates02 = [];
    if(nextFirst02.getDay()!=0){
        for(var i = 0; i < nextFirst02.getDay(); i++){
            dates02.unshift(prevLast02.getDate()-i); // 지난 달 날짜 채우기
        }
    }
    for(var i = 1; i <= nextLast02.getDate(); i++){
        dates02.push(i); // 이번 달 날짜 채우기
    }
    for(var i = 1; i <= 13 - nextLast02.getDay(); i++){
        dates02.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
    }

    for(var i = 0; i < 42; i++){
        if(i < nextFirst02.getDay()){
            htmlDates02 += '<div class="date02 last">'+dates02[i]+'</div>';
        }else if(i >= nextFirst02.getDay() + nextLast02.getDate()){
            htmlDates02 += '<div class="date02 next">'+dates02[i]+'</div>';
        }else if(tomorrow.getDate()==dates02[i] && tomorrow.getMonth()==CDate.getMonth() && tomorrow.getFullYear()==CDate.getFullYear()){
            htmlDates02 += '<div id="date02_'+dates02[i]+'" class="date02 tomorrow" onclick="fn_selectDate02('+dates02[i]+');">'+dates02[i]+'</div>';
        }else{
            htmlDates02 += '<div id="date02_'+dates02[i]+'" class="date02" onclick="fn_selectDate02('+dates02[i]+');">'+dates02[i]+'</div>';
        }
    }
    document.querySelector(".dates02").innerHTML = htmlDates02;
}




function prevCal(){
    CDate.setMonth(CDate.getMonth()-1);
    buildcalendar();
}
function nextCal(){
    CDate.setMonth(CDate.getMonth()+1);
    buildcalendar();
}

function prevCal02(){
    CDate02.setMonth(CDate02.getMonth() - 1);
    buildcalendar02();
}

function nextCal02(){
    CDate02.setMonth(CDate02.getMonth() + 1);
    buildcalendar02();
}

/*check in*/
var selectedDay = today;
/*checkOut*/
var selectedDay02 = tomorrow;
function fn_selectDate(date) {
    var year = CDate.getFullYear();
    var month = CDate.getMonth() + 1;
    selectedDay = new Date(year, month - 1, date);
    var day = selectedDay.getDay();
    var date_txt = "";
    if(selectedDay-1 > selectedDay02-2 || selectedDay-selectedDay02 <= 0){
        $("#search_box").prop("disabled", true);
    }else{
        $("#search_box").prop("disabled", false);
    }
    if (yesterday <= selectedDay) {
        if (CDate.getMonth() + 1 < 10) {
            month = "0" + (CDate.getMonth() + 1);
        }
        if (date < 10) {
            date_txt = "0" + date;
        } else {
            date_txt = date;
        }

        var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
        var dayOfWeek = daysOfWeek[day];

        if (selectCk == 0) {
            $(".date").css("background-color", "");
            $(".date").css("color", "");
            $(".today").css("background-color", "white");
            $(".today").css("color", "");
            $(".date").removeClass("today");
            $("#date_" + date).css("background-color", "red");
            $("#date_" + date).css("color", "white");

            $("#check_in_hidden").val(year + "-" + month + "-" + date);
            var period_1 = year + "." + month + "." + date_txt + " (" + dayOfWeek + ")";
            document.getElementById('check_in').innerText = period_1;
            document.getElementById('check_in_show').value = period_1;
            check = 0;
            selectCk = 0;

            if (check == 0) {
                const target = document.getElementById('btnS');
                target.disabled = false;
            }
        }
    }

}
function fn_selectDate02(date02) {
    var year02 = CDate02.getFullYear();
    var month02 = CDate02.getMonth();
    selectedDay02 = new Date(year02, month02, date02);
    var day02 = selectedDay02.getDay();
    var date_txt02 = "";

    if(selectedDay-1 > selectedDay02-2){
        $("#search_box").prop("disabled", true);
    }else{
        $("#search_box").prop("disabled", false);
    }
    if (today <= selectedDay02 && selectedDay02 > selectedDay) {
        month02 = selectedDay02.getMonth();
        year02 = selectedDay02.getFullYear();

        if (month02 < 9) {
            month02 = "0" + (month02 + 1);
        } else {
            month02 = month02 + 1;
        }

        if (date02 < 10) {
            date_txt02 = "0" + date02;
        } else {
            date_txt02 = date02;
        }

        var daysOfWeek02 = ["일", "월", "화", "수", "목", "금", "토"];
        var dayOfWeek02 = daysOfWeek02[day02];

        if (selectCk02 == 0) {
            $(".date02").css("background-color", "");
            $(".date02").css("color", "");
            $(".tomorrow").css("background-color", "white");
            $(".tomorrow").css("color", "");
            $(".date02").removeClass("tomorrow");
            $("#date02_" + date02).css("background-color", "red");
            $("#date02_" + date02).css("color", "white");

            $("#check_out_hidden").val(year02 + "-" + month02 + "-" + date02);
            var period_2 = year02 + "." + month02 + "." + date_txt02 + " (" + dayOfWeek02 + ")";
            //alert(period_2);
            document.getElementById('check_out').innerText = period_2;
            document.getElementById('check_out_show').value = period_2;
            check02 = 0;
            selectCk02 = 0;
            //alert(year02 + "-" + month02 +"-"+date02);

            if (check02 == 0) {
                const target02 = document.getElementById('btnS');
                target02.disabled = false;
            }

        }
    }

}
buildcalendar();
buildcalendar02();
const target = document.getElementById('btnS');
$(target).attr('disabled',true);
$("#btnF").click(function(){
    const target = document.getElementById('btnS');
    target.disabled = true;
    CDate.setMonth(CDate.getMonth());
    buildcalendar();
    CDate02.setMonth(CDate02.getMonth());
    buildcalendar02();
});
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

/*달력슬라이드*/

// 체크인 및 체크아웃 달력 보이기/숨기기 함수
function toggleCalendars() {

    select_hotels.classList.remove("animate__fadeInUp");
    select_hotels.classList.add("animate__fadeOutDown");
    room_options.classList.remove("animate__fadeInUp");
    room_options.classList.add("animate__fadeOutDown");

    if (calendars_body.classList.contains("hidden")) {
        //스크롤 막기
        $('body').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });

        // 달력을 나타내기 전에 숨겨진 상태일 때
        main_txt.classList.add("animate__fadeOut");
        setTimeout(function(){


        calendars_body.classList.remove("hidden");
        calendars.style.display = "block";
        room_options_body.classList.add("hidden");
        room_options.style.display = "none";
        select_hotel_body.classList.add("hidden");
        select_hotels.style.display = "none";

        calendars.classList.remove("animate__fadeOutDown");
        calendars.classList.add("animate__fadeInUp");
        mainResveForm.classList.add("calendars_show");
        icon_scroll.classList.add("icon_scroll_show");
        },300);
    } else {
        //스크롤 막기 풀기
        $('body').off('scroll touchmove mousewheel');

        select_hotel_body.classList.add("hidden");
        select_hotels.style.display = "none";
        select_hotels.classList.remove("animate__fadeOutDown");

        room_options_body.classList.add("hidden");
        room_options.style.display = "none";
        room_options.classList.remove("animate__fadeOutDown");

        // 달력을 숨길 때
        calendars.classList.remove("animate__fadeInUp");
        calendars.classList.add("animate__fadeOutDown");



        // 애니메이션 완료 후 달력 숨김 처리
        setTimeout(function() {
            calendars_body.classList.add("hidden");
            calendars.style.display = "none";
            calendars.classList.remove("animate__fadeOutDown");
            mainResveForm.classList.remove("calendars_show");
            icon_scroll.classList.remove("icon_scroll_show");
            main_txt.classList.remove("animate__fadeOut");
            main_txt.classList.add("animate__fadeIn");
        }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
    }
}

// CHECK IN 및 CHECK OUT 달력 숨김 처리 함수
function hideCalendars() {

    //스크롤 막기 풀기
    $('body').off('scroll touchmove mousewheel');

    // 달력을 숨길 때
    calendars.classList.remove("animate__fadeInUp");
    calendars.classList.add("animate__fadeOutDown");

    // 애니메이션 완료 후 달력 숨김 처리
    setTimeout(function() {
        calendars_body.classList.add("hidden");
        calendars.style.display = "none";

        calendars.classList.remove("animate__fadeOutDown");
        mainResveForm.classList.remove("calendars_show");
        icon_scroll.classList.remove("icon_scroll_show");
        main_txt.classList.remove("animate__fadeOut");
        main_txt.classList.add("animate__fadeIn");
    }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
}

function toggleop_select() {

    select_hotels.classList.remove("animate__fadeInUp");
    select_hotels.classList.add("animate__fadeOutDown");
    calendars.classList.remove("animate__fadeInUp");
    calendars.classList.add("animate__fadeOutDown");

    if (room_options_body.classList.contains("hidden")) {
        //스크롤 막기
        $('body').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });

        // 방옵션을 나타내기 전에 숨겨진 상태일 때
        main_txt.classList.add("animate__fadeOut");
        setTimeout(function(){

            room_options_body.classList.remove("hidden");
            room_options.style.display = "block";

            select_hotel_body.classList.add("hidden");
            select_hotels.style.display = "none";
            calendars_body.classList.add("hidden");
            calendars.style.display = "none";

            room_options.classList.remove("animate__fadeOutDown");
            room_options.classList.add("animate__fadeInUp");
            mainResveForm.classList.add("calendars_show");
            icon_scroll.classList.add("icon_scroll_show");
        },300);
    } else {
        //스크롤 막기 풀기
        $('body').off('scroll touchmove mousewheel');

        select_hotel_body.classList.add("hidden");
        select_hotels.style.display = "none";
        select_hotels.classList.remove("animate__fadeOutDown");

        calendars_body.classList.add("hidden");
        calendars.style.display = "none";
        calendars.classList.remove("animate__fadeOutDown");
        // 방옵션을 숨길 때
        room_options.classList.remove("animate__fadeInUp");
        room_options.classList.add("animate__fadeOutDown");



        // 애니메이션 완료 후 방옵션 숨김 처리
        setTimeout(function() {
            room_options_body.classList.add("hidden");
            room_options.style.display = "none";
            room_options.classList.remove("animate__fadeOutDown");
            mainResveForm.classList.remove("calendars_show");
            icon_scroll.classList.remove("icon_scroll_show");
            main_txt.classList.remove("animate__fadeOut");
            main_txt.classList.add("animate__fadeIn");
        }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
    }
}


// CHECK IN 및 CHECK OUT 방옵션 숨김 처리 함수
function hideroom_option() {
    //스크롤 막기 풀기
    $('body').off('scroll touchmove mousewheel');

    // 방옵션을 숨길 때
    room_options.classList.remove("animate__fadeInUp");
    room_options.classList.add("animate__fadeOutDown");

    // 애니메이션 완료 후 달력 숨김 처리
    setTimeout(function() {
        room_options_body.classList.add("hidden");
        room_options.style.display = "none";

        room_options.classList.remove("animate__fadeOutDown");
        mainResveForm.classList.remove("calendars_show");
        icon_scroll.classList.remove("icon_scroll_show");
        main_txt.classList.remove("animate__fadeOut");
        main_txt.classList.add("animate__fadeIn");
    }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
}

$(".btnDown").click(function (){
    var numPeople = $(this).parent().children("input").val();
    $(this).parent().children("input").val(parseInt(numPeople)-1);
    var numPeople_m = $(this).parent().children("input").val();
    if(numPeople_m < 0){
        alert("0보다 작을 수 없습니다.");
        $(this).parent().children("input").val(0);
        $(this).parent().children("span").children("em").text(0);
    }else {
        $(this).parent().children("span").children("em").text(numPeople_m);
    }
    var child_num =  $(this).parent().next().find("input").val();
    if(child_num > 0 && numPeople_m <= 0){
        $(this).parent().next().find("input").val(0);
        $(this).parent().next().find("span").children("em").text(0);
    }

    var adltCntArr01 = $("#adltCntArr01").val();
    var adltCntArr02 = $("#adltCntArr02").val();
    var adltCntArr03 = $("#adltCntArr03").val();
    var chldCntArr01 = $("#chldCntArr01").val();
    var chldCntArr02 = $("#chldCntArr02").val();
    var chldCntArr03 = $("#chldCntArr03").val();

    if(adltCntArr02 > 0 && adltCntArr03 > 0){
        $("#room_cnt").val(3);
    } else if(adltCntArr02 > 0 || adltCntArr03 > 0){
        $("#room_cnt").val(2);
    } else{
        $("#room_cnt").val(1);
    }

    $("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
    $("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));

});
$("#btnDown_01").click(function (){
    var numPeople = $(this).parent().children("input").val();
    $(this).parent().children("input").val(parseInt(numPeople)-1);
    var numPeople_m = $(this).parent().children("input").val();
    if(numPeople_m < 1){
        alert("최소 한명은 필요합니다.");
        $(this).parent().children("input").val(1);
        $(this).parent().children("span").children("em").text(1);
    }else {
        $(this).parent().children("span").children("em").text(numPeople_m);
    }
    var adltCntArr01 = $("#adltCntArr01").val();
    var adltCntArr02 = $("#adltCntArr02").val();
    var adltCntArr03 = $("#adltCntArr03").val();
    var chldCntArr01 = $("#chldCntArr01").val();
    var chldCntArr02 = $("#chldCntArr02").val();
    var chldCntArr03 = $("#chldCntArr03").val();

    if(adltCntArr02 > 0 && adltCntArr03 > 0){
        $("#room_cnt").val(3);
    } else if(adltCntArr02 > 0 || adltCntArr03 > 0){
        $("#room_cnt").val(2);
    } else{
        $("#room_cnt").val(1);
    }

    $("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
    $("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));
});
$(".btnUp").click(function (){
    var numPeople = $(this).parent().children("input").val();
    $(this).parent().children("input").val(parseInt(numPeople)+1);
    var numPeople_s = $(this).parent().children("input").val();
    if(numPeople_s > 4){
        alert("최대 4명이 이용 가능합니다.");
        $(this).parent().children("input").val(4);
        $(this).parent().children("span").children("em").text(4);
    }else {
        $(this).parent().children("span").children("em").text(numPeople_s);
    }

    var adult_num =  $(this).parent().prev().find("input").val();
    if(adult_num == 0){
        alert("성인 없이 어린이만 예약 할 수 없습니다.");
        $(this).parent().children("input").val(0);
        $(this).parent().children("span").children("em").text(0);
    }
    var adltCntArr01 = $("#adltCntArr01").val();
    var adltCntArr02 = $("#adltCntArr02").val();
    var adltCntArr03 = $("#adltCntArr03").val();
    var chldCntArr01 = $("#chldCntArr01").val();
    var chldCntArr02 = $("#chldCntArr02").val();
    var chldCntArr03 = $("#chldCntArr03").val();

    if(adltCntArr02 > 0 && adltCntArr03 > 0){
        $("#room_cnt").val(3);
    } else if(adltCntArr02 > 0 || adltCntArr03 > 0){
        $("#room_cnt").val(2);
    } else{
        $("#room_cnt").val(1);
    }

    $("#adult_cnt").val(parseInt(adltCntArr01) + parseInt(adltCntArr02) + parseInt(adltCntArr03));
    $("#children_cnt").val(parseInt(chldCntArr01) + parseInt(chldCntArr02) + parseInt(chldCntArr03));
});

function toggleHotels() {

    room_options.classList.remove("animate__fadeInUp");
    room_options.classList.add("animate__fadeOutDown");
    calendars.classList.remove("animate__fadeInUp");
    calendars.classList.add("animate__fadeOutDown");

    if (select_hotel_body.classList.contains("hidden")) {
        $('body').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });

        // 방옵션을 나타내기 전에 숨겨진 상태일 때
        main_txt.classList.add("animate__fadeOut");
        setTimeout(function(){

            select_hotel_body.classList.remove("hidden");
            select_hotels.style.display = "block";

            room_options_body.classList.add("hidden");
            room_options.style.display = "none";
            calendars_body.classList.add("hidden");
            calendars.style.display = "none";

            select_hotels.classList.remove("animate__fadeOutDown");
            select_hotels.classList.add("animate__fadeInUp");
            mainResveForm.classList.add("calendars_show");
            icon_scroll.classList.add("icon_scroll_show");
        },300);
    } else {
        calendars_body.classList.add("hidden");
        calendars.style.display = "none";
        calendars.classList.remove("animate__fadeOutDown");

        room_options_body.classList.remove("hidden");
        room_options.style.display = "none";
        room_options.classList.remove("animate__fadeOutDown");
        // 방옵션을 숨길 때

        select_hotels.classList.remove("animate__fadeInUp");
        select_hotels.classList.add("animate__fadeOutDown");

        $('body').off('scroll touchmove mousewheel');


        // 애니메이션 완료 후 방옵션 숨김 처리
        setTimeout(function() {
            select_hotel_body.classList.add("hidden");
            select_hotels.style.display = "none";
            select_hotels.classList.remove("animate__fadeOutDown");
            mainResveForm.classList.remove("calendars_show");
            icon_scroll.classList.remove("icon_scroll_show");
            main_txt.classList.remove("animate__fadeOut");
            main_txt.classList.add("animate__fadeIn");
        }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
    }
}

// CHECK IN 및 CHECK OUT 방옵션 숨김 처리 함수
function hideHotels() {

    // 방옵션을 숨길 때
    select_hotels.classList.remove("animate__fadeInUp");
    select_hotels.classList.add("animate__fadeOutDown");

    // 애니메이션 완료 후 달력 숨김 처리
    setTimeout(function() {
        select_hotel_body.classList.add("hidden");
        select_hotels.style.display = "none";

        $('body').off('scroll touchmove mousewheel');

        select_hotels.classList.remove("animate__fadeOutDown");
        mainResveForm.classList.remove("calendars_show");
        icon_scroll.classList.remove("icon_scroll_show");
        main_txt.classList.remove("animate__fadeOut");
        main_txt.classList.add("animate__fadeIn");
    }, 500); // 애니메이션 시간에 맞게 지연시간 설정 (500ms는 animate.css 기본값)
}

$(document).on("click","#select_hotel_list",function (){

    var select_hotel_val = $(this).find("input").val();
    var select_hotel_list_name = $(this).find("#select_hotel_list_name").text();

    document.querySelector("#main_mini_dl_02_hotel").innerHTML = select_hotel_list_name;
    $("#select_hotel_hidden").val(select_hotel_val);
});

$("#main_kimchi").click(function() {
   location.href = "/hotel/kimchi";
});