<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }

    @font-face {
        font-family: 'SUITE-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
    }

    .nomember_main {
        margin-top: 140px;
        /*border: 1px solid orangered;*/
        width: 1000px;
        height: 945px;
        margin-left: auto;
        margin-right: auto;
        /*border: 1px solid #ccc;*/
        transition: transform 0.5s;
        opacity: 0;
        animation: fadeIn 2s forwards;
    }

    /*.nomember_main:hover {*/
    /*    box-shadow: -10px 10px 7px 3px #ccc;*/
    /*    transform: translateY(-5px);*/
    /*}*/

    .nomember_header {
        /*border: 1px solid yellow;*/
        text-align: center;
    }

    .nomember_hotel_info {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        margin-top: 20px;
        /*border: 1px solid pink;*/
        font-family: 'GmarketSansMedium';
    }

    .nomember_hotel_photo {
        /*border: 1px solid green;*/
        margin-top: 4px;
        display: flex;
        justify-content: center;
        align-items: center;
        /*border: 1px solid red;*/
    }

    .nomember_hotel_photo img {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 1000px;
        height: 500px;
        /*object-fit: contain;*/
        /*border-radius: 40% 60% 65% 35% / 40% 45% 55% 60%;*/
        /*border-radius: 100% 100% 0% 0% / 15% 15% 50% 47%;*/
    }

    .nomember_hotel_photo {
        height: auto;
        margin-top: 40px;
    }

    .nomember_room_info {
        /*display: flex;*/
        /*flex-direction: column;*/
        /*border: 1px solid black;*/
        height: 300px;
        justify-content: center;
        align-items: center;
        /*margin-top: 20px;*/
    }

    .nomember_header_title h2 {
        font-size: 40px;
        font-weight: normal;
        font-family: "Playfair Display", serif;
        font-style: italic;
        padding: 0 0 20px 0;
    }

    .nomember_header_title span {
        color: inherit;
        font-size: 16px;
        line-height: 1.4;
        color: #868686;
    }

    .topimg1,
    .topimg2,
    .topimg3 {
        width: 30px;
        height: 30px;
        margin-right: 5px;
    }

    .subimg1,
    .subimg2,
    .subimg3,
    .subimg4,
    .subimg5 {
        width: 30px;
        height: 30px;
    }

    .nomember_room_check {
        text-align: center;
    }

    .nomember_room_check_title {
        display: flex;
        justify-content: space-around;

    }

    .fmt_check {
        display: flex;
        justify-content: space-around;
    }

    .fmt_check span {
        /*background-color: black;*/
        /*color: white;*/
        border: none;
        border-bottom: 2px solid #8B4513;
        width: 120px;
        transition: transform 0.5s;
    }

    .fmt_check span:hover {
        transform: translateY(-5px);
    }

    .nomember_room_top_title {
        /*background-color: black;*/
        /*color: white;*/
        font-family: 'GmarketSansMedium';
        /*border-radius: 10px;*/
        box-shadow: -3px 2px 3px 3px #ddd;
        height: 60px;
    }

    .nomember_room_sub_info {
        /*border: 1px solid red;*/
        height: 170px;
        /*font-family: 'SUITE-Regular';*/
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    .nomember_room_sub_div {
        /*border: 1px solid #ccc;*/
        /*width: 500px;*/
        /*height: 150px;*/
        display: flex;
        justify-content: space-around;
    }

    .sub_info1 {
        /*border: 1px solid green;*/
        margin-top: 10px;
    }

    .test1 {
        /*border: 1px solid red;*/
        float: right;
        /*display: flex;*/
        align-items: center;
        justify-content: center;
        margin-top: 30px;
    }

    #del_btn {
        border: 1px solid #ccc;
        background-color: transparent;
        color: black;
        transition: box-shadow 0.3s ease;
        width: 150px;
        height: 40px;
    }

    #del_btn:hover {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        color: white;
        background-color: black;
    }

    #gohome {
        border: 1px solid #ccc;
        background-color: transparent;
        color: black;
        transition: box-shadow 0.3s ease;
        width: 150px;
        height: 40px;
    }

    #gohome:hover {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        color: white;
        background-color: black;
    }

    .nomember_header {
        font-size: 15px;
    }

    .gohomediv {
        margin-top: 10px;
    }

    .nomember_hotel_info {
        border-radius: 10px;
        margin-top: 20px;
        justify-content: center;
        align-items: center;
        text-align: center;
        width: 100%;
        font-size: 14px;
    }

    .hotel-info-row {
        display: flex;
        align-items: center;
        margin-right: 20px;
        margin-bottom: 10px;
    }

    .hotel-info-row span {
        margin-left: 10px;
        font-weight: bold;
        animation: bounce 1s infinite alternate;
    }

    .topimg1,
    .topimg2,
    .topimg3 {
        width: 24px;
        height: 24px;
    }

    @keyframes bounce {
        0% {
            transform: translateY(0);
        }
        100% {
            transform: translateY(-5px);
        }
    }

    .bounce {
        color: #8B4513;
    }

    .hotel-info-row:hover .topimg1,
    .hotel-info-row:hover .topimg2,
    .hotel-info-row:hover .topimg3 {
        transform: translateY(-7px);
        transition: transform 0.4s;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }


    /* 반응형 세팅 */
    @media screen and (max-width: 768px) {
        .nomember_main {
            margin-top: 110px;
            width: 90%;
            height: auto;
        }

        .nomember_hotel_info {
            flex-direction: column;
            align-items: center;
        }

        .nomember_hotel_info span {
            margin-bottom: 10px;
        }

        .nomember_hotel_photo img {
            max-width: 100%;
            height: auto;
        }

        .nomember_room_info {
            height: auto;
        }

        .nomember_room_sub_info {
            height: auto;
            margin-top: 20px;
        }

        .test1 {
            margin-top: 20px;
        }
    }

</style>

<div class="nomember_main">
    <div class="nomember_header">
        <div class="nomember_header_title">
            <h2>Dream Stay Reservation Check</h2>
            <span>${booksearch.user_name}님의 예약 정보입니다</span>
        </div>
        <div class="nomember_hotel_info">
            <div class="hotel-info-row">
                <span class="bounce"><img src="/photo/hotel.png" class="topimg1"> 호텔명</span>
                <span class="hotel-name">${booksearch.name}</span>
            </div>
            <div class="hotel-info-row">
                <span class="bounce"><img src="/photo/pin.png" class="topimg2"> 주소</span>
                <span class="hotel-address">${booksearch.addr}</span>
            </div>
            <div class="hotel-info-row">
                <span class="bounce"><img src="/photo/phone-call.png" class="topimg3"> 전화번호</span>
                <span class="hotel-phone">${booksearch.phone}</span>
            </div>
        </div>
    </div>
    <div class="flip_box">
        <div class="flip">
            <div class="nomember_hotel_photo" id="shape">
                <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${booksearch.photo}">
            </div>
        </div>
    </div>

    <div class="nomember_room_info">
        <div class="nomember_room_check">
            <div class="nomember_room_top_title">
                <div class="nomember_room_check_title">
                    <span>체크인</span><span>체크아웃</span>
                </div>
                <div class="fmt_check">
                <span><fmt:parseDate value='${booksearch.checkin}' var='checkin' pattern='yyyy-mm-dd'/>
                <fmt:formatDate value="${checkin}" pattern="yyyy-mm-dd"/></span>
                    <span>
                <fmt:parseDate value='${booksearch.checkout}' var='checkout' pattern='yyyy-mm-dd'/>
                <fmt:formatDate value="${checkout}" pattern="yyyy-mm-dd"/></span>
                </div>
            </div>

            <div class="nomember_room_sub_info">
                <div class="nomember_room_sub_div">
                    <div class="test">
                        <div class="sub_info1">
                            <img src="/photo/bed.png" class="subimg1">
                            <span>객실 타입 : ${booksearch.roomtype}</span>
                        </div>
                        <div class="sub_info2">
                            <img src="/photo/couple.png" class="subimg2">
                            <span>성인 : ${booksearch.adult}명</span>
                        </div>
                        <div class="sub_info3">
                            <img src="/photo/children.png" class="subimg3">
                            <span>어린이 : ${booksearch.kids}명</span>
                        </div>
                        <div class="sub_info4">
                            <c:if test="${empty booksearch.roomtype}">
                                <span>요청사항이 없습니다.</span>
                            </c:if>
                            <c:if test="${not empty booksearch.roomtype}">
                                <img src="/photo/request.png" class="subimg4">
                                <span>요청 사항 : ${booksearch.roomtype}</span>
                            </c:if>
                        </div>
                        <div class="sub_info5">
                            <img src="/photo/hand.png" class="subimg5">
                            <span>이용 요금 : <fmt:formatNumber value="${booksearch.total_price}"/>원</span>
                        </div>
                    </div>
                    <div class="test1">
                        <button type="button" id="del_btn" class="del_btn"
                                onclick="deletebook(${booksearch.user_num});">예약취소
                        </button>
                        <div class="gohomediv">
                            <button type="button" id="gohome" class="gohome"
                                    onclick="location.href='/'">메인
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function deletebook(num) {
        if (!confirm("예약 취소하시겠습니까?")) return;
        location.href = "/book/deletebook?num=" + num;
    }
</script>
