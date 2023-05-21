<%--
  Created by IntelliJ IDEA.
  User: milion
  Date: 2023-05-17
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 700;
        font-style: normal;
    }

    .book_main {
        /*border: 1px solid pink;*/
        width: 2000px;
        height: 1200px;
        margin: 100px auto 0;
        display: flex;
        flex-direction: column;
    }

    .book_main .book_top {
        padding: 70px 0 70px;
    }

    .book_main .book_title {
        /*border: 1px solid aqua;*/
        width: 1400px;
        height: 200px;
    }

    .book_main .book_title .booking {
        /*border: 1px solid blue;*/
        font-family: 'Playfair Display SC', serif;
        font-size: 75px;
        position: absolute;
        margin-left: 280px;
    }

    .book_main .book_select {
        /*border: 1px solid yellow;*/
        margin-top: 20px;
        width: 100%;
        justify-content: center;
        align-items: center;
    }

    .book_main .book_top .book_title .book_ol li {
        list-style: none;
    }

    .book_main .book_top .book_title .book_ol em {
        /*border: 1px solid green;*/
        display: inline-block;
        margin-top: 120px;
        font-size: 20px;
        margin-left: 280px;
    }

    .book_main .book_select {
        /*border: 1px solid hotpink;*/
        height: 180px;
        background-color: #F9F9F9;
        display: flex;
        flex-direction: row;
    }

    .book_main .book_select .book_inner {
        padding: 30px;
    }

    .book_main .book_select .book_inner dl {
        float: left;
        margin-right: 20px;
        margin-top: 15px;
    }

    .book_main .book_select .book_inner dl dt {
        font-weight: revert;
        color: black;
    }

    .book_main .book_select .book_inner dl dd input[type=text] {
        border: none;
        background-color: #f9f9f9;
    }

    .book_main .book_select .book_inner dl dd input[type=text]:focus {
        outline: none;
    }

    .mainbtn,
    .mainbtn1{
        width: 120px;
        height: 40px;
        font-size: 15px;
        margin-top: 10px;
        border: 1px solid black;
        background-color: white !important;
        color: black;
        cursor: pointer;
        overflow: hidden;
        z-index: 1;
        vertical-align: middle;
        margin-bottom: 30px;
    }

    .mainbtn:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out !important;
        background-color: black !important;
        color: white;
        border: 1px solid white;
    }

    .memberdiv {
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.4);
        height: 500px;
        width: 400px;
        border: 2px solid #ccc;
        /*#6B4423*/
        /*border-radius: 10px;*/
        background-color: #F5F5F5;
        font-family: 'GmarketSansMedium';
        float: left;
        margin-left: auto;
        margin-right: auto;
        margin-top: 40px;
    }

    .topmainbtn{
        width: 140px;
        height: 60px;
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        background-color: black;
        color: black;
        cursor: pointer;
        margin-top: 10px;
    }

    .nomemberdiv {
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.4);
        height: 500px;
        width: 400px;
        border: 2px solid #ccc;
        /*#6B4423*/
        /*border-radius: 10px;*/
        /*background-color: #F5F5F5;*/
        font-family: 'GmarketSansMedium';
        float: left;
        margin-left: auto;
        margin-right: auto;
        margin-top: 40px;

    }

    .no_name {
        display: flex;
        margin-left: 10px;
        margin-top: 10px;
    }

    .yes_name {
        /*justify-content: center;*/
        /*align-items: center;*/
        /*flex-direction: column;*/
        padding: 30px 30px;
        margin-right: 30px;
    }

    .no_name span,
    .yes_name span {
        font-size: 15px;
        color: #ccc;
    }

    .no_name input[type=text],
    .user_name {
        border: none;
        width: 120px;
        /*text-align: right;*/
        color: #ccc;
    }

    .user_name {
        display: inline-block;
    }

    .no_name input[type=text]:focus,
    .user_name:focus {
        outline: none;
    }

    .nomember_title {
        margin-left: 10px;
        margin-top: 10px;
        font-size: 14px;
    }

    .yes_date input[type=text] {
        border: none;
        margin-left: 10px;
        margin-right: 10px;
        display: flex;
        font-size: 15px;
    }

    .yes_date {
        display: flex;
        /*align-items: center;*/
        /*justify-content: center;*/
        flex-direction: column;
    }

    .yes_date input[type=text]:focus {
        outline: none;
    }

    .no_booknum {
        /*display: flex;*/
        /*justify-content: center;*/
        margin-top: 10px;
        margin-left: 10px;
    }

    .no_booknum #book_copy_btn {
        width: 90px;
        height: 50px;
        border: none;
        background-color: black;
        color: white;
        margin-left: 20px;
        transition: transform .6s .6s ease-in,
        box-shadow .6s .6s ease-in,
        background .6s ease-out,
        color .6s ease-out;
    }

    #book_copy_btn:hover {
        transform: rotateY(10deg);
        box-shadow: -3px 3px 10px 0px rgba(0, 0, 0, 0.55);
        background-color: white;
        color: black;
    }

    #book_num:focus {
        outline: none;
    }

    #book_num {
        border: 1px solid #ccc;
        text-align: center;
        /*box-shadow: -3px 2px 5px 5px #ddd;*/
        width: 175px;
        height: 50px;
        font-size: 14px;
    }

    .book_number_title {
        text-align: center;
    }

    .book_number_title p {
        color: #dddddd;
        margin-top: 10px;

    }

    .go_to_main {
        margin-top: 10px;
        float: right;
        margin-right: 20px;
        align-items: center;
        justify-content: center;
    }

    .go_to_main .mainbtn1 {
        cursor: pointer;
        overflow: hidden;
        z-index: 1;
        font-size: 15px;
        letter-spacing: -.01em;
        text-align: center;
        vertical-align: middle;
        border: 1px solid black;
        background-color: white;
        margin-right: 20px;
        border-radius: 5px;
        width: 120px;
        height: 40px;
        margin-top: 60px;
    }

    /*.go_to_home .mainbtn,*/
    /*.go_to_main .mainbtn1 {*/
    /*    cursor: pointer;*/
    /*    overflow: hidden;*/
    /*    z-index: 1;*/
    /*    font-size: 15px;*/
    /*    letter-spacing: -.01em;*/
    /*    text-align: center;*/
    /*    vertical-align: middle;*/
    /*    border: 1px solid black;*/
    /*    background-color: white;*/
    /*    margin-right: 20px;*/
    /*    border-radius: 5px;*/
    /*}*/

    .go_to_main .mainbtn1:hover,
    .go_to_main .mainbtn:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out !important;
        background-color: white !important;
        color: black !important;
    }

    .go_to_home {
        align-items: center;
        justify-content: right;
        background-color: white;
        width: 100%;
        float: right;
    }

    .go_to_home .mainbtn{
        cursor: pointer;
        overflow: hidden;
        z-index: 1;
        font-size: 15px;
        letter-spacing: -.01em;
        text-align: center;
        vertical-align: middle;
        border: 1px solid black;
        background-color: white;
        margin-right: 20px;
        border-radius: 5px;
        width: 120px;
        height: 40px;
        margin-top: 60px;
        float: right;
    }

    /*.go_to_home .mainbtn{*/
    /*    float: right;*/
    /*}*/

    .hotelphoto {
        width: 100px;
        height: 50px;
    }

    .yes_date_span,
    .yes_date_input {
        display: flex;
        align-items: center;
        /*justify-content: center;*/
    }

    .yes_date_input {
        margin-top: 10px;
    }

    .yes_date_span span {
        margin-bottom: 5px;
    }

    .main_content {
        background-color: white;
        height: 200px;
    }

    @keyframes bounce {
        0% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
        }
        100% {
            transform: translateY(0);
        }
    }

    .finish_book {
        background-color: black;
        color: white;
        width: 60px;
        margin-top: 20px;
        border-radius: 3px;
        font-family: 'GmarketSansMedium';
        font-size: 13px;
        text-align: center;
        margin-left: 10px;
        float: left;
        animation: bounce 1s infinite;
        transition: bounce 2s;
    }

    .main_content span {
        color: #ccc;
        margin-left: 10px;
    }

    .main_content .user_name {
        color: #ddd;
    }

    .book_sub_info{
        margin-top: 10px;
        margin-left: 10px;
    }

    .book_sub_info1{
        margin-top: 150px;
        background-color:#F9F9F9 ;

    }

    .book_sub_info span,
    .book_sub_info1 span{
        color: #3181F6;
    }

    .book_sub_info1 span,
    .book_sub_info1 p{
        margin-left: 10px;
    }

    .book_sub_info p,
    .book_sub_info1 p{
        font-size: 15px;
        margin-top: 5px;
    }

    .kakaologo {
        width: 25px;
        height: 25px;
    }

    .main_content_title {
        margin-left: 10px;
    }

    .test{
        float: right;
    }
</style>
<div class="book_main">
<div class="book_top">
    <div class="book_title">
        <span class="booking">BOOKING</span>
        <div class="book_ol">
            <ol>
                <li>
                    <em>예약 정보 확인</em>
                </li>
            </ol>
        </div>
    </div>
</div>
<div class="book_select">
    <div class="book_inner">

        <dl class="dl01">
            <dt>HOTEL</dt>
            <input type="hidden" value="${selectedHotel }" readonly="readonly">
            <dd><input type="text" value="${hotelname }" readonly="readonly"></dd>
        </dl>

        <dl class="dl02">
            <dt>DATE</dt>
            <dd><input type="text" value="${sessionScope.checkInShow}" readonly="readonly">
                <input type="text" value="${sessionScope.checkOutShow}" readonly="readonly"></dd>
        </dl>

        <dl class="dl03">
            <dt>ROOMS</dt>
            <dd><input type="text" value="${sessionScope.roomCount}" readonly="readonly"></dd>
        </dl>

        <dl class="dl04">
            <dt>Adults</dt>
            <dd><input type="text" value="${sessionScope.adultCount}" readonly="readonly"></dd>
        </dl>

        <dl class="dl05">
            <dt>Children</dt>
            <dd><input type="text" value="${sessionScope.childrenCount}" readonly="readonly"></dd>
        </dl>
        <button type="button" class="topmainbtn" onclick="location.href='/'">메인으로 돌아가기</button>

    </div>
</div>


<c:if test="${memberDto.user_name == null}">
    <div class="nomemberdiv">
        <div class="nomember_title">
            <span><b>예약 내역</b></span><br>
        </div>
        <div class="no_name">
            <span>성함&nbsp;<input type="text" value="${nomemberusername }" name="user_name" class="user_name" required
                                 readonly="readonly"></span>
        </div>
        <div class="no_booknum">
            <input type="text" value="${nomemberId }" class="book_num" readonly id="book_num">
            <button onclick="copy_to_clipboard()" id="book_copy_btn">copy</button>
        </div>
        <div class="finish_book">
            예약완료
        </div>
        <div class="go_to_main">
            <button type="button" class="mainbtn1" onclick="location.href='/signup/login'">예약확인</button>
        </div>
        <div class="book_sub_info1">
            <p>도움이 필요하신가요?</p><br>
            <span>1588-0000</span>
            <p><img src="/photo/kakaologo.png" class="kakaologo">&nbsp;카카오톡 @플러스친구 Dream Stay</p>
            <p>오전 9시 ~ 오후 6시 (연중무휴)</p>
            <p>예약 번호가 없을경우 예약확인이 불가능합니다.</p>
        </div>
    </div>
    </div>

</c:if>
<c:if test="${memberDto.user_name != null}">
    <div class="memberdiv">
        <div class="main_content">
            <br>
            <p class="main_content_title">예약내역</p>
            <span>성함&nbsp;<input type="text" value="${familyname}${firstname}" name="user_name" class="user_name"
                                 readonly></span>

            <div class="yes_date">
                <input type="text" value="${hotelname }" readonly="readonly" class="yes_hotel">
                <div class="yes_date_input">
                    <input type="text" value="${sessionScope.checkInShow}" readonly="readonly">
                </div>
                <div class="finish_book">
                    예약완료
                </div>
            </div>

            <div class="go_to_home">
                    <button type="button" class="mainbtn" onclick="location.href='/mypage'">예약 확인</button>
            </div>
        </div>

        <div class="book_sub_info">
            도움이 필요하신가요?<br>
            <span>1588-0000</span>
            <p><img src="/photo/kakaologo.png" class="kakaologo">&nbsp;카카오톡 @플러스친구 Dream Stay</p>
            <p>오전 9시 ~ 오후 6시 (연중무휴)</p>
        </div>
    </div>
</c:if>

<script>
    function copy_to_clipboard() {
        var copyText = document.getElementById("book_num");
        copyText.select();
        document.execCommand("Copy");
        alert("복사되었습니다");
    }
</script>

