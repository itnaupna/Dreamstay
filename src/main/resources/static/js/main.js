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


$(function (){
    $(".page4_box_logo").mouseenter(function () {
        const src = $(this).find(".page4_box_logo_inputs").val();
        $(".bg_imgs04").fadeOut(600, function () {
            $(".bg_imgs04").css("background-image", "url(" + src + ")");
            $(".bg_imgs04").fadeIn(600);

        });
    });
});

window.onload = function(){
    $("#search_box").prop("disabled", false);
}

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

    if(selectedDay-1 > selectedDay02-2){
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
target.disabled = true;
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
    var calendars_body = document.getElementById("calendars_body");
    var calendars = document.getElementById("calendars");
    var room_options_body = document.getElementById("room_options_body");
    var room_options = document.getElementById("room_options");
    var mainResveForm = document.getElementById("mainResveForm");
    var icon_scroll = document.getElementById("icon_scroll");
    var main_txt = document.getElementById("main_txt");

    room_options.classList.remove("animate__fadeInUp");
    room_options.classList.add("animate__fadeOutDown");

    if (calendars_body.classList.contains("hidden")) {
        // 달력을 나타내기 전에 숨겨진 상태일 때
        main_txt.classList.add("animate__fadeOut");
        setTimeout(function(){

        calendars_body.classList.remove("hidden");
        calendars.style.display = "block";
        room_options_body.classList.add("hidden");
        room_options.style.display = "none";

        calendars.classList.remove("animate__fadeOutDown");
        calendars.classList.add("animate__fadeInUp");
        mainResveForm.classList.add("calendars_show");
        icon_scroll.classList.add("icon_scroll_show");
        },300);
    } else {
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
    var calendars_body = document.getElementById("calendars_body");
    var calendars = document.getElementById("calendars");
    var mainResveForm = document.getElementById("mainResveForm");
    var icon_scroll = document.getElementById("icon_scroll");
    var main_txt = document.getElementById("main_txt");

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
