<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .book_main {
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
        height: 130px;
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
        margin-left: 260px;
    }

    .book_main .book_select {
        /*border: 1px solid hotpink;*/
        height: 150px;
        background-color: #F9F9F9;
        display: flex;
        width: 100%;
    }

    .book_main .book_select .book_inner {
        padding: 30px;
    }

    .book_main .book_select .book_inner dl {
        float: left;
        margin-right: 20px;
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

    .book_main .book_select .book_inner .dl02 {
        line-height: normal;
    }

    .mainbtn {
        width: 140px;
        height: 60px;
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        background-color: black;
        color: black;
        cursor: pointer;
    }

    .pay {
        margin-left: 280px;
        margin-top: 30px;
        display: inline-block;
    }

    .pay .pay_main .pay_choice {
        display: inline-block;
        font-family: 'Playfair Display SC', serif;
        font-size: 50px;
    }

    .pay .pay_main .pay_room {
        display: flex;
        flex-direction: column;
        width: 400px;
    }

    .pay .pay_main .pay_name {
        margin-top: 25px;
        display: inline-block;
    }

    .pay .pay_main .pay_name span {
        margin-bottom: 30px;
    }

    .pay .pay_main .pay_phone {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        width: 500px;
    }

    .pay .pay_main .pay_phone input[type=text] {
        width: 450px;
        height: 40px;
        flex: 1;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 15px;
        margin-top: 10px;
    }

    .pay .pay_main .pay_phone input[type=text]:focus {
        outline: none;
    }

    .pay .pay_main .pay_email {
        display: inline-block;
        align-items: center;
        margin-top: 20px;
        /*border: 1px solid green;*/
    }

    .email_select_option {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .email_select_option li {
        height: 50px;
        line-height: 50px;
        padding-left: 10px;
    }

    #email_custom_option {
        width: 200px;
        height: 150px;
        list-style-type: none;
        overflow-x: hidden;
        overflow-y: scroll;
        position: absolute;
        display: none;
        left: auto;
        text-align: left;
        padding-left: 0;
        border: 1px solid black;
        border-top: none;
    }

    #email_select_domain {
        width: 200px;
        height: 50px;
        line-height: 50px;
        text-align: left;
        border-bottom: 1px solid black;
        margin: 0 30px 0 30px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-size: 10px 10px;
        background-position: 96% center;
        overflow: hidden;
        cursor: pointer;
    }

    .pay .pay_main .pay_email input:focus {
        outline: none;
    }

    .input_domain, .email_selectbox {
        display: inline-block;
        vertical-align: middle;
        cursor: pointer;
    }

    .input_domain {
        margin-left: 10px;
    }

    .email_selectbox {
        margin-left: 30px;
    }

    .pay .pay_main .pay_email input[type=email] {
        width: 300px;
        height: 40px;
        flex: 1;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 15px;
        margin-top: 10px;
    }

    .pay .pay_main .pay_email input[type=text] {
        width: 300px;
        height: 40px;
        flex: 1;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 15px;
        margin-top: 10px;
    }

    .pay .pay_main .pay_card {
        margin-top: 20px;
    }

    .pay .pay_main .cardnumber {
        margin-top: 20px;
    }

    .pay .pay_main .cardnumber input[type=text] {
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 15px;
        margin-right: 40px;
    }

    .pay .pay_main .cardnumber input[type=text]:focus {
        outline: none;
    }

    .custom-select {
        position: relative;
        width: 400px;
        margin-top: 30px;
    }

    .selected {
        background-color: white;
        border: none;
        border-bottom: 1px solid black;
        padding: 5px;
        cursor: pointer;
        font-size: 17px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-position: 96% center;
        background-size: 10px 10px;
    }

    .options {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: white;
        border: 1px solid #ddd;
        border-top: none;
        padding: 0;
        margin: 0;
        list-style: none;
        display: none;
        overflow-y: scroll;
        max-height: 150px;
    }

    .options li {
        padding: 5px;
        cursor: pointer;
    }

    .options li:hover {
        background-color: white;
    }

    .show {
        display: block;
    }

    .custom-select1 {
        position: relative;
        width: 400px;
        margin-top: 40px;
        margin-left: 100px;
    }

    .selected1 {
        background-color: white;
        border: none;
        border-bottom: 1px solid black;
        padding: 5px;
        cursor: pointer;
        font-size: 17px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-position: 96% center;
        background-size: 10px 10px;
    }

    .options1 {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: white;
        border: 1px solid #ddd;
        border-top: none;
        padding: 0;
        margin: 0;
        list-style: none;
        display: none;
        overflow-y: scroll;
        max-height: 150px;
    }

    .options1 li {
        padding: 5px;
        cursor: pointer;
    }

    .options1 li:hover {
        background-color: white;
    }
    .show {
        display: block;
    }

    .selectli{
        /*border: 1px solid red;*/
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        width: 926px;
    }

    .book_box{
        border: 1px solid red;
        width: 500px;
        height: 400px;
        float: right;
        margin-right: 200px;
        margin-top: 240px;
    }
</style>

<div class="book_main">
    <div class="book_top">
        <div class="book_title">
            <span class="booking">BOOKING</span>
            <div class="book_ol">
                <ol>
                    <li>
                        <em>예약자 정보 입력</em>
                    </li>
                </ol>
            </div>
        </div>
    </div>

    <div class="book_select">
        <div class="book_inner">

            <dl class="dl01">
                <dt>HOTEL</dt>
                <dd><input type="text" value="${sessionScope.selectedHotel}" readonly="readonly"></dd>
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
                <dt>ROOMS</dt>
                <dd><input type="text" value="${sessionScope.adultCount}" readonly="readonly"></dd>
            </dl>

            <dl class="dl05">
                <dt>ROOMS</dt>
                <dd><input type="text" value="${sessionScope.childrenCount}" readonly="readonly"></dd>
            </dl>

            <button type="button" onclick="location.href='/'" class="mainbtn">MAIN PAGE</button>
        </div>
    </div>

    <section class="pay">
        <div class="book_box">

        </div>
        <div class="pay_main">
            <div class="pay_choice">
                <p>SMART CHOICE</p>
            </div>

            <div class="pay_room">
                <p>DELUXE / 2DOUBLE /STANDARD 추후 수정</p>
            </div>

            <div class="pay_name">
                <p>RESERVATION NAME *</p>
                <span>이름 수정 ~</span>
            </div>

            <div class="pay_phone">
                <span>PHONE NUMBER *</span>
                <input type="text" id="pay_phone" name="pay_phone">
            </div>

            <div class="pay_email">
                <input type="text" name="email" class="input_email" id="input_email" placeholder="이메일">
                <span id="at">@</span>
                <input type="text" name="input_domain" class="input_domain" id="input_domain">
                <div class="email_selectbox">
                    <div id="email_select_domain">직접 입력</div>
                    <ul id="email_custom_option">
                        <li class="email_select_option">직접 입력</li>
                        <li class="email_select_option">naver.com</li>
                        <li class="email_select_option">gmail.com</li>
                        <li class="email_select_option">hanmail.net</li>
                        <li class="email_select_option">hotmail.com</li>
                        <li class="email_select_option">nate.com</li>
                    </ul>
                </div>
            </div>

            <div class="pay_card">
                <p>CREDIT CARD *</p>

                <label>
                    <input type="checkbox" class="chcard" id="chcard">개인
                </label>

                <label>
                    <input type="checkbox" class="bupin" id="bupin">법인
                </label>
            </div>

            <div class="cardnumber">
                <p>CARD NUMBER *</p>
                <input type="text" class="c_num" id="c_num1">
                <input type="text" class="c_num" id="c_num2">
                <input type="text" class="c_num" id="c_num3">
                <input type="text" class="c_num" id="c_num4">
            </div>
            <div class="selectli">
                <div class="custom-select">
                    <div class="selected">월</div>
                    <ul class="options">
                        <li>1월</li>
                        <li>2월</li>
                        <li>3월</li>
                        <li>4월</li>
                        <li>5월</li>
                        <li>6월</li>
                        <li>7월</li>
                        <li>8월</li>
                        <li>9월</li>
                        <li>10월</li>
                        <li>11월</li>
                        <li>12월</li>
                    </ul>
                </div>

                <div class="custom-select1">
                    <div class="selected1">년도</div>
                    <ul class="options1">
                        <li>2023년</li>
                        <li>2024년</li>
                        <li>2025년</li>
                        <li>2026년</li>
                        <li>2027년</li>
                        <li>2028년</li>
                        <li>2029년</li>
                        <li>2030년</li>
                        <li>2031년</li>
                        <li>2032년</li>
                        <li>2033년</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    // 이메일 선택
    $("#email_select_domain").click(function () {
        $("#email_custom_option").slideToggle().css("left", $(this).position().left + 30);
    });

    //이메일
    $(".email_select_option").click(function () {
        if ($(this).text() == "직접 입력") {
            $("#email_domain").val("").attr("readonly", false);
            $("#email_select_domain").text($(this).text()).click();
        } else {
            $("#email_domain").val($(this).text()).attr("readonly", true);
            $("#email_select_domain").text($(this).text()).click();
        }
    });

    // 카드 월 선택
    const select = document.querySelector('.custom-select');
    const selected = select.querySelector('.selected');
    const options = select.querySelector('.options');

    selected.addEventListener('click', () => {
        options.classList.toggle('show');
    });

    options.addEventListener('click', (event) => {
        selected.textContent = event.target.textContent;
        options.classList.remove('show');
    });

    // 카드 년 선택
    const select1 = document.querySelector('.custom-select1');
    const selected1 = select1.querySelector('.selected1');
    const options1 = select1.querySelector('.options1');

    selected1.addEventListener('click', () => {
        options1.classList.toggle('show');
    });

    options1.addEventListener('click', (event) => {
        selected1.textContent = event.target.textContent;
        options1.classList.remove('show');
    });
</script>