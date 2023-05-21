//btn 메뉴 dropdown 접고 펴기 이벤트, footer랑 이벤트 동일해서 주석처리하고 footer랑 같이 사용! (출동시 수정)
$(function(){

    var dropdownBtn = document.querySelector('.resvBtn .btn_opener');
    var dropdownList = document.querySelector('.resvBtn .dropdown_list');

    dropdownBtn.addEventListener('click', function() {
        dropdownList.classList.toggle('open');


    });

    dropdownList.addEventListener('mouseleave', function() {
        dropdownList.classList.remove('open');
    });

});

// btnMenu 접고 펴기
$(function(){
    if(document.location.pathname !== "/"){
        $('.header').addClass('black_header').removeClass('white_header');
        $('.header li a').addClass('black_li').removeClass('white_li');
        $('.logo').addClass('black_logo').removeClass('white_logo');
        $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
        $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
        $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');

    }
    var isMenuClick = false;

    $('.btnMenu').on('click', function() {

        isMenuClick = !isMenuClick;

        if (isMenuClick) {
            // menulist 펴기, header 배경색, btn 기울기 변경
            $('.btnMenulist').slideDown(300);
            //이미지 기울기 효과
            $('.btnMenu').css('transform', 'translateY(0) rotate(45deg)');
            if(document.location.pathname !== "/") return;
            //header 클래스 balck으로 변경
            $('.header').addClass('black_header').removeClass('white_header');
            $('.header li a').addClass('black_li').removeClass('white_li');
            $('.logo').addClass('black_logo').removeClass('white_logo');
            $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
            $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
            $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');
            $('body').on('scroll touchmove mousewheel', function(event) {
                event.preventDefault();
                event.stopPropagation();
                return false;
            });

        } else {
            $('.btnMenulist').slideUp(300);
            $('.btnMenu').css('transform', 'translateY(0) rotate(0deg)');
            if(document.location.pathname !== "/") return;

            if(document.location.href === "http://localhost:8080/#secondPage"){
                $('.header').addClass('black_header').removeClass('white_header');
                $('.header li a').addClass('black_li').removeClass('white_li');
                $('.logo').addClass('black_logo').removeClass('white_logo');
                $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
                $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
                $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');
                $('body').off('scroll touchmove mousewheel');
            }else {
                $('.header').addClass('white_header').removeClass('black_header');
                $('.header li a').addClass('white_li').removeClass('black_li');
                $('.header .logo').addClass('white_logo').removeClass('black_logo');
                $('.header .btnMenu').addClass('white_btnMenu').removeClass('black_btnMenu');
                $('.topUtil .hotelFind').addClass('white_find').removeClass('black_find');
                $('.btn_opener').addClass('white_btn_opener').removeClass('black_btn_opener');
                $('body').off('scroll touchmove mousewheel');

            }

        }
    });

    // btnMenuClose (X버튼으로 닫기)
    $(".btnMenuClose").on('click', function() {
        $('.btnMenulist').slideUp(400);
        $('.btnMenu').css('transform', 'translateY(0) rotate(0deg)');

        if(document.location.pathname !== "/") return;

        if(document.location.href === "http://localhost:8080/#secondPage"){
            $('.header').addClass('black_header').removeClass('white_header');
            $('.header li a').addClass('black_li').removeClass('white_li');
            $('.logo').addClass('black_logo').removeClass('white_logo');
            $('.header .btnMenu').addClass('black_btnMenu').removeClass('white_btnMenu');
            $('.topUtil .hotelFind').addClass('black_find').removeClass('white_find');
            $('.btn_opener').addClass('black_btn_opener').removeClass('white_btn_opener');
            $('body').off('scroll touchmove mousewheel');
        }else {
            $('.header').addClass('white_header').removeClass('black_header');
            $('.header li a').addClass('white_li').removeClass('black_li');
            $('.header .logo').addClass('white_logo').removeClass('black_logo');
            $('.header .btnMenu').addClass('white_btnMenu').removeClass('black_btnMenu');
            $('.topUtil .hotelFind').addClass('white_find').removeClass('black_find');
            $('.btn_opener').addClass('white_btn_opener').removeClass('black_btn_opener');
            $('body').off('scroll touchmove mousewheel');

        }

    });
});

// 호텔 디테일로 이동
$(document).on("click", ".header_hotel_list",function(){
    location.href="/hotel/hoteldetail?num="+$(this).val();
});

$(function() {
    $.ajax({
        url: "/hotel/hotellist",
        type: "get",
        success: function(data){
            let hotelList = "";
            $.each(data, function(i, d) {
                hotelList += `<li class="header_hotel_list" value="${d.num}">${d.name}</li>`;
            });
            $("#hotel_list").html(hotelList);
        }
    });
});

$(document).on("click", "#header_notice_board",function(){
    location.href="/notice/noticeboard";
});

