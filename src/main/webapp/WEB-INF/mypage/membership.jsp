<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
    img {
        width: 50px;
        height: 50px;
    }

    .slider-wrap {
        /*border: 1px solid red;*/
        width: 1400px;
        height: 1500px;
    }
    .tac1,
    .tac2,
    .tac3,
    .tac4,
    .tac5,
    .tac6,
    .tac7{
        position: relative;
        color: white;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        border: none;
        border-radius: 15px;
        height: 170px;
        background-color: black;
        width: 1200px;
        top: 20px;
    }
    .tac1-img,
    .tac2-img,
    .tac3-img,
    .tac4-img,
    .tac5-img,
    .tac6-img,
    .tac7-img {
        position: absolute;
        /*margin-left: 50px;*/
        left: 10px;
        top: 200px;
        width: 1200px;
        height: 800px;
        opacity: 1;
        transition: opacity 0.5s ease;
    }
    .cont{
        height: 960px;
    }

</style>

<div class="slider-for">
    <div class="cont">
        <div class="tac1">더 많은 혜택, 더 즐거운 여행
            <img class="tac1-img slider-nav" src="/photo/tac1.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac2">
            <span>"멤버십으로 더 많은 할인 혜택을 누리세요"</span>
            <img class="tac2-img slider-nav" src="/photo/tac2.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac3">"특별한 혜택과 함께하는 특별한 여행"
            <img class="tac3-img slider-nav" src="/photo/tac3.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac4">"멤버십으로 여행을 더욱 풍요롭게 즐겨보세요"
            <img class="tac4-img slider-nav" src="/photo/tac4.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac5">"더 많은 여행, 더 많은 혜택을"
            <img class="tac5-img slider-nav" src="/photo/tac5.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac6">"여행의 즐거움을 멤버십으로 더 높이세요"
            <img class="tac6-img slider-nav" src="/photo/tac6.png">
        </div>
    </div>
    <div class="cont">
        <div class="tac7">당신의 여행을 더욱 특별하게 만들어드립니다.
            <img class="tac7-img slider-nav" src="/photo/tac7.png">
        </div>
    </div>
</div>


<script>
    $(function () {
        $('.slider-wrap').slick({
            slide: 'div',        //슬라이드 되어야 할 태그
            infinite: true,     //무한 반복 옵션
            slidesToShow: 6,        // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll: 1,        //스크롤 한번에 움직일 컨텐츠 개수
            speed: 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows: false,         // 옆으로 이동하는 화살표 표시 여부
            // dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay: true,            // 자동 스크롤 사용 여부
            autoplaySpeed: 1500,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover: true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
            vertical: false,        // 세로 방향 슬라이드 옵션
            // prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
            // nextArrow : "<button type='button' class='slick-next'>Next</button>",
            draggable: true,     //드래그 가능 여부
        });
        $('.slider-nav').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            dots: true,
            centerMode: true,
            focusOnSelect: true
        });
        $('.slider-for').slick({
            slide: 'div',        //슬라이드 되어야 할 태그
            infinite: true,     //무한 반복 옵션
            slidesToShow: 6,
            slidesToScroll: 1,
            speed: 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows: false,         // 옆으로 이동하는 화살표 표시 여부
            fade: true,
            asNavFor: '.slider-nav',
            autoplay: true,            // 자동 스크롤 사용 여부
            autoplaySpeed: 1500,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover: true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
        });
    })

</script>