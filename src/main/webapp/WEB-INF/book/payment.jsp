<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://js.tosspayments.com/v1/payment"></script>

<style>
    <%-- first div --%>
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }
    .book_main {
        width: 1900px;
        height: 1900px;
        margin: 100px auto 0;
        display: flex;
        flex-direction: column;
    }

    <%-- second div --%>
    .book_main .book_top {
        padding: 70px 0 70px;
    }

    <%-- 타이틀--%>
    .book_main .book_title {
        width: 1400px;
        height: 130px;
    }

    <%-- 타이틀 글씨 --%>
    .book_main .book_title .booking {
        /*border: 1px solid blue;*/
        font-family: 'Playfair Display SC', serif;
        font-size: 75px;
        position: absolute;
        margin-left: 280px;
    }

    .book_main .book_select {
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
        font-family: 'GmarketSansMedium';
    }

    <%-- 두번째 div 큰 틀 --%>
    .book_main .book_select {
        /*border: 1px solid hotpink;*/
        height: 150px;
        background-color: #F9F9F9;
        display: flex;
        width: 100%;
    }

    <%-- 여기서부터는 선택한 옵션들 출력하는 곳 css --%>
    .book_main .book_select .book_inner {
        padding: 30px;
    }

    .book_main .book_select .book_inner dl {
        float: left;
        margin-right: 20px;
    }

    .book_main .book_select .book_inner dl dt {
        font-weight: bold;
        color: black;
        font-family: 'Playfair Display SC', serif;
    }

    .book_main .book_select .book_inner dl dd input[type=text] {
        border: none;
        background-color: #f9f9f9;
        font-family: 'GmarketSansMedium';
    }

    .book_main .book_select .book_inner dl dd input[type=text]:focus {
        outline: none;
    }

    <%-- 끝 --%>
    .mainbtn {
        width: 140px;
        height: 60px;
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        background-color: black;
        color: black;
        cursor: pointer;
        margin-top: 10px;
        transition: 0.6s;
        font-family: 'Playfair Display SC', serif;
    }
    .mainbtn:hover{
        color: #ffffff;
        background-color: #000000;
    }

    <%-- 3번째 div 틀 --%>
    .pay {
        margin-left: 280px;
        margin-top: 30px;
        display: inline-block;
    }

    <%-- 제목 입니다 --%>
    .pay .pay_main .pay_choice {
        display: inline-block;
        font-family: 'Playfair Display SC', serif;
        font-size: 50px;
    }

    <%-- 서브 타이틀입니다 --%>
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
    .pay_name input{
        font-family: 'GmarketSansMedium';
    }

    .pay .pay_main .pay_phone {
        margin-top: 50px;
        display: flex;
        flex-direction: column;
        width: 500px;
    }

    .pay .pay_main .pay_phone input[type=text] {
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
        font-family: 'GmarketSansMedium' !important;
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
        position: absolute;
        top: 98%;
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
        width: 200px;
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
        width: 190px;
    }

    .pay .pay_main .cardnumber input[type=text]:focus {
        outline: none;
    }

    .custom-select {
        position: relative;
        width: 400px;
        margin-top: 30px;
        font-family: 'GmarketSansMedium' !important;

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
        margin-top: 30px;
        margin-left: 100px;
        font-family: 'GmarketSansMedium' !important;
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
        background-color: white !important;
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

    .custom-select2 {
        position: relative;
        width: 400px;
        margin-top: 30px;

    }

    .selected2 {
        background-color: white !important;
        border: none;
        border-bottom: 1px solid black;
        padding: 5px;
        cursor: pointer;
        font-size: 17px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-position: 99% center;
        background-size: 10px 10px;
        width: 900px;
    }

    .options2 {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: white !important;
        border: 1px solid #ddd;
        border-top: none;
        padding: 0;
        margin: 0;
        list-style: none;
        display: none;
        overflow-y: scroll;
        max-height: 150px;
        width: 900px;
        z-index: 11;
    }

    .options2 li {
        padding: 5px;
        cursor: pointer;
    }

    .options2 li:hover {
        background-color: white;
    }

    .show {
        display: block;
    }

    .selectli {
        /*border: 1px solid red;*/
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        width: 926px;
    }

    .sideBanner {
        border: 1px solid black;
        width: 440px;
        height: 230px;
        float: right;
        margin-top: 50px;
        position: absolute;
        margin-left: 1000px;
        justify-content: center;
        align-items: center;
    }

    .sideBanner .txt-label {
        display: flex;
        flex-direction: column;
        left: 0;
        margin-left: 20px;
        margin-top: 20px;
        font-family: 'GmarketSansMedium';
    }

    .sideBanner .txt-label .for_num {
        font-size: 25px;
        font-weight: bold;
    }

    .sp_email {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
    }

    .pay_card p {
        margin-top: 40px;

    }

    .cardnumber p {
        margin-top: 40px;
        font-family: 'Playfair Display SC', serif;
    }
    .cardnumber input{
        font-family: 'GmarketSansMedium';
    }

    .ex_date {
        display: flex;
        flex-direction: column;
        margin-top: 40px;
        font-family: 'Playfair Display SC', serif;
    }

    .sidehr {
        width: 380px;
    }

    .book_main .pay .sideBanner .txt-label .paybtn {
        width: 250px;
        background-color: black;
        height: 60px;
        color: white;
        cursor: pointer;
        padding: 0 25px;
        font-size: 15px;
        letter-spacing: -.01em;
        text-align: center;
        vertical-align: middle;
        background-color: black;
        color: white;
        border: thin solid #000000;
        border-radius: 0;
        cursor: pointer;
        overflow: hidden;
        z-index: 1;
        transition: 0.6s;
        font-family: 'GmarketSansMedium';
    }

    .book_main .pay .sideBanner .txt-label .paybtn:hover{
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
        background-color: white;
        color: black;
    }

    .divbtn {
        justify-content: center;
        align-items: center;
        display: flex;
        flex: 1;
        margin-top: 25px;
    }

    #bupin {
        margin-left: 30px;
    }

    .pay_card span {
        margin-left: 15px;
        font-family: 'GmarketSansMedium';
    }

    .ex_card {
        display: inline-block;
        margin-top: 30px;
    }

    .gujung {
        margin-top: 100px;
        left: 0;
        font-family: 'GmarketSansMedium';
    }

    .gujung span {
        font-weight: bolder;
    }

    .gujung #myhr {
        width: 900px;
        background-color: black;
        border-color: black;
        background: black;
    }

    .gujung .open_ul .open_li {
        list-style: none;
    }

    .gujung .close_ul {
        margin-top: 30px;
        background-color: #f9f9f9;
        width: 880px;
        height: 200px;
        border-bottom: 1px solid #ccc;
        font-family: 'GmarketSansMedium';
    }

    .gujung .close_toggle {
        display: none;
    }

    .gujung .close_ul li {
        color: #909090;
        left: 0;
        line-height: 40px;
        font-size: 15px;
        list-style: none;

    }

    .clickimg {
        background-color: white;
        border: none;
        padding: 5px;
        cursor: pointer;
        font-size: 17px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-position: 99% center;
        background-size: 10px 10px;
        width: 450px;
    }

    .close_inul {
        list-style-type: none;
    }

    .book_memo {
        margin-top: 50px;
        font-family: 'Playfair Display SC', serif;
    }

    .book_memo input[type=text] {
        width: 900px;
        height: 100px;
        text-align: left;
        font-family: 'GmarketSansMedium';
    }

    .book_memo input[type=text]:focus {
        outline: none;
    }

    .book_memo_input{
        margin-top: 20px;
    }

    .nomember_name{
        border: none;
        border-bottom: 1px solid #ccc;
        width: 300px;

    }

    .nomember_name:focus{
        outline: none;
    }

    body{
        /*overflow-x: hidden;*/
    }
    .pay_email input{
        font-family: 'GmarketSansMedium';
    }

    .pay_choice p , .pay_room, .pay_name p, .pay_phone span, .pay_email span,  .ex_card,
    .pay_card p
    {
        font-family: 'Playfair Display SC', serif;
    }
    #email_select_domain,#email_custom_option, .selected2, .options2,pay_card span{
        font-family: 'GmarketSansMedium';
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
    <form method="post" id="bookform" name="bookform" action="insertbook">
        <div class="book_select">
            <div class="book_inner">

                <dl class="dl01">
                    <dt>HOTEL</dt>
                    <dd><input type="hidden" value="${selectedHotel}" readonly="readonly"></dd>
                    <dd><input type="text" value="${hotelname }" readonly="readonly"></dd>
                </dl>

                <input type="hidden" value="${sessionScope.checkIn}" name="checkIn">
                <input type="hidden" value="${sessionScope.checkOut}" name="checkOut">
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
                    <dt>ADULT</dt>
                    <dd><input type="text" value="${sessionScope.adultCount}" readonly="readonly" name="adultCount"></dd>
                </dl>

                <dl class="dl05">
                    <dt>CHILDREN</dt>
                    <dd><input type="text" value="${sessionScope.childrenCount}" readonly="readonly" name="childrenCount"></dd>
                </dl>

                <button type="button" onclick="location.href='/'" class="mainbtn">MAIN PAGE</button>
            </div>
        </div>

        <section class="pay">
            <%-- 플로팅 메뉴 --%>
            <div class="sideBanner">
                <div class="txt-label">
                    <span>객실예약</span>
                    <div class="for_num">
                        <fmt:formatNumber type="number" value="${roomprice }" pattern="#,##0원"/>
                        <input type="hidden" name="roomprice" value="${roomprice }" required>
                    </div>
                    <hr class="sidehr">
                    <div class="divbtn">
                        <input type="hidden" name="peopleinfo">
                        <button type="button" id="paybtn" class="paybtn" onclick="payment()">예약완료</button>
                    </div>
                </div>
            </div>
            <%-- 플로팅 메뉴 --%>

            <div class="pay_main">
                <div class="pay_choice">
                    <p>SMART CHOICE</p>
                </div>

                <div class="pay_room">
                    <input type="hidden" name="roomnum" value="${roomnum }">
                    <p>TYPE : ${roomtype}</p>
                </div>

                <div class="pay_name">
                    <p>RESERVATION NAME *</p>
                    <c:if  test="${memberDto.user_name == null}">
                        <span><input type="text" value="" name="nomember_name" class="nomember_name" required oninput="onlyKoEng(this)" maxlength="10" autofocus></span>
                    </c:if>
                    <c:if  test="${memberDto.user_name != null}">
                        <span><input type="text" value="${familyname}${firstname}" name="nomember_name" class="nomember_name" readonly autofocus></span>
                    </c:if>
                </div>

                <div class="pay_phone">
                    <span>PHONE NUMBER *</span>
                    <c:if  test="${memberDto.user_name == null}">
                        <input type="text" id="pay_phone" name="pay_phone" value="" required oninput="onlyPhone(this)" maxlength="11" placeholder="숫자만 입력가능합니다.">
                    </c:if>
                    <c:if  test="${memberDto.user_name != null}">
                        <input type="text" id="pay_phone" name="pay_phone" value="${memberDto.phone}" readonly>
                    </c:if>
                </div>

                <div class="pay_email">
                    <span class="sp_email">EMAIL *</span>
                    <c:if  test="${memberDto.user_name == null}">
                        <input type="text" name="email" class="input_email" id="input_email" placeholder="이메일"
                               value="" required oninput="onlyEngNum(this)">
                    </c:if>
                    <c:if  test="${memberDto.user_name != null}">
                        <input type="text" name="email" class="input_email" id="input_email" placeholder="이메일"
                               value="${username}" readonly>
                    </c:if>
                    <span id="at">@</span>
                    <c:if  test="${memberDto.user_name == null}">
                        <input type="text" name="input_domain" class="input_domain" id="input_domain" value="" required oninput="onlyEngNum(this)">
                    </c:if>
                    <c:if  test="${memberDto.user_name != null}">
                        <input type="text" name="input_domain" class="input_domain" id="input_domain" value="${domain}" readonly>
                    </c:if>
                    <div class="email_selectbox">
                        <c:if  test="${memberDto.user_name == null}">
                            <div id="email_select_domain">직접 입력</div>
                            <ul id="email_custom_option">
                                <li class="email_select_option">naver.com</li>
                                <li class="email_select_option">gmail.com</li>
                                <li class="email_select_option">hanmail.net</li>
                                <li class="email_select_option">hotmail.com</li>
                                <li class="email_select_option">nate.com</li>
                            </ul>
                        </c:if>
                    </div>
                </div>

                <div class="pay_card">
                    <p>CREDIT CARD *</p>
                    <label>
                        <input type="checkbox" class="chcard" id="chcard" name="gaein" checked>
                        <span>개인</span>
                    </label>

                    <label>
                        <input type="checkbox" class="bupin" id="bupin" name="bupin">
                        <span>법인</span>
                    </label>
                </div>

                <span class="ex_card">CREDIT CARD COMPANY*</span>
                <div class="selectli2">
                    <div class="custom-select2">
                        <input type="hidden" value="" name="company" id="company" required>
                        <div class="selected2">카드선택</div>
                        <ul class="options2" >
                            <li class="options2_list">비씨</li>
                            <li class="options2_list">국민</li>
                            <li class="options2_list">하나</li>
                            <li class="options2_list">삼성</li>
                            <li class="options2_list">신한</li>
                            <li class="options2_list">현대</li>
                            <li class="options2_list">롯데</li>
                            <li class="options2_list">시티</li>
                            <li class="options2_list">농협</li>
                            <li class="options2_list">수협</li>
                            <li class="options2_list">우리</li>
                            <li class="options2_list">카카오뱅크</li>
                            <li class="options2_list">광주</li>
                            <li class="options2_list">전북</li>
                            <li class="options2_list">제주</li>
                        </ul>
                    </div>
                </div>

                <div class="cardnumber">
                    <p>CARD NUMBER *</p>
                    <input type="text" class="c_num" id="c_num1" placeholder="CARD NUMBER" name="c_num1" maxlength="4" required oninput="onlyNum()">
                    <input type="text" class="c_num" id="c_num2" name="c_num2" maxlength="4" required oninput="onlyNum()">
                    <input type="text" class="c_num" id="c_num3" name="c_num3" maxlength="4" required oninput="onlyNum()">
                    <input type="text" class="c_num" id="c_num4" name="c_num4" maxlength="4" required oninput="onlyNum()">
                </div>

                <span class="ex_date">EXPIRY DATE *</span>
                <div class="selectli">
                    <div class="custom-select">
                        <input type="hidden" value="" name="card_month" id="card_month" required>
                        <div class="selected">월</div>
                        <ul class="options">
                            <li class="options_list">1월</li>
                            <li class="options_list">2월</li>
                            <li class="options_list">3월</li>
                            <li class="options_list">4월</li>
                            <li class="options_list">5월</li>
                            <li class="options_list">6월</li>
                            <li class="options_list">7월</li>
                            <li class="options_list">8월</li>
                            <li class="options_list">9월</li>
                            <li class="options_list">10월</li>
                            <li class="options_list">11월</li>
                            <li class="options_list">12월</li>
                        </ul>
                    </div>

                    <div class="custom-select1">
                        <input type="hidden" value="" name="card_year" id="card_year" required>
                        <div class="selected1">년도</div>
                        <ul class="options1">
                            <li class="options1_list">2023년</li>
                            <li class="options1_list">2024년</li>
                            <li class="options1_list">2025년</li>
                            <li class="options1_list">2026년</li>
                            <li class="options1_list">2027년</li>
                            <li class="options1_list">2028년</li>
                            <li class="options1_list">2029년</li>
                            <li class="options1_list">2030년</li>
                            <li class="options1_list">2031년</li>
                            <li class="options1_list">2032년</li>
                            <li class="options1_list">2033년</li>
                        </ul>
                    </div>
                </div>

                <div class="book_memo">
                    <span>REQUESTS  </span>
                    <div class="book_memo_input">
                        <input type="text" name="memo" class="memo" placeholder="추가 요구사항을 적어주세요">
                    </div>
                </div>

                <div class="gujung">
                    <span>취소 규정</span>
                    <hr id="myhr" class="myhr">

                    <ul class="open_ul">
                        <li class="open_li">
                            <input type="checkbox" id="checkbox">
                            <label class="clickimg">
                                [필수] 취소 및 노쇼(No - Show) 규정에 동의합니다
                            </label>
                        </li>

                        <div class="close_toggle">
                            <ul class="close_ul">
                                <li class="close_li">
                                    " 체크인 7일 전 오후 6시 이전 : 위약금 없이 변경 및 취소 가능 "
                                </li>

                                <li>
                                    " 체크인 7일 전 오후 6시 이후 ~ 1일 전 오후 6시 이전 : 최초 1박 요금의 20% 부과 "
                                </li>

                                <li>
                                    " 체크인 1일 전 오후 6시 이후 : 취소 및 No - Show 위약금 발생 "
                                    <ul class="close_inul">
                                        <li>
                                            " 1박 투숙 : 객실료의 80% 위약금 부과 "
                                        </li>

                                        <li>
                                            " 2박 이상 투숙 : 최초 1박 요금의 100% 부과 "
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
        </section>
    </form>
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

    // 카드 선택
    const select2 = document.querySelector('.custom-select2');
    const selected2 = select2.querySelector('.selected2');
    const options2 = select2.querySelector('.options2');

    selected2.addEventListener('click', () => {
        options2.classList.toggle('show');
    });

    options2.addEventListener('click', (event) => {
        selected2.textContent = event.target.textContent;
        options2.classList.remove('show');
    });

    // 체크 박스
    $('input[type="checkbox"][name="gaein"]').click(function () {
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="bupin"]').prop('checked', false);
        }
    });

    $('input[type="checkbox"][name="bupin"]').click(function () {
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="gaein"]').prop('checked', false);
        }
    });

    // 플로팅 메뉴
    var floatPosition = parseInt($(".sideBanner").css('top'))

    $(window).scroll(function () {

        var currentTop = $(window).scrollTop();
        var bannerTop = currentTop + floatPosition + "px";

        $(".sideBanner").stop().animate({
            "top": bannerTop
        }, 700);

    }).scroll();

    // 이메일 선택 하면 값 들어가게 하기
    $(function () {
        $('#email_custom_option li').click(function () {
            $('#input_domain').val($(this).text());
        });
    });

    // 규정 스크립트
    const clickimg = document.querySelector('.clickimg');

    clickimg.addEventListener('click', function () {
        const closeToggle = document.querySelector('.close_toggle');

        if (closeToggle.style.display === 'none') {
            closeToggle.style.display = 'block';
        } else {
            closeToggle.style.display = 'none';
        }
    });

    // 토스api
    var clientKey = 'test_ck_d26DlbXAaV0xjj5gR9dVqY50Q9RB'
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기

    function payments() {
        tossPayments.requestPayment("카드", {
            // 결제 수단 파라미터
            // 결제 정보 파라미터
            amount: ${roomprice},
            orderId: "KuIxWHfdV2z1pAyOqO2Id",
            orderName: "${roomtype}",
            customerName: "${username}",
            successUrl: "http://localhost:8080/",
            failUrl: "http://localhost:8080/book/payment"
        });
    }

    var company = $("#company").val();
    var card_month = $("#card_month").val();
    var card_year = $("#card_year").val();

    $(".options2_list").click(function (){
        var selected2 = $(this).text();
        $("#company").val(selected2);
        company = $("#company").val(selected2);
    });
    $(".options_list").click(function (){
        var selected = $(this).text();
        $("#card_month").val(selected);
        card_month = $("#card_month").val(selected);
    });
    $(".options1_list").click(function (){
        var selected1 = $(this).text();
        $("#card_year").val(selected1);
        card_year = $("#card_year").val(selected1);
    });
    function payment() {
        var nomember_name = $(".nomember_name").val();
        var pay_phone = $("#pay_phone").val();
        var input_email = $("#input_email").val();
        var input_domain = $("#input_domain").val();
        var c_num1 = $("#c_num1").val();
        var c_num2 = $("#c_num2").val();
        var c_num3 = $("#c_num3").val();
        var c_num4 = $("#c_num4").val();
        const checkbox = document.getElementById('checkbox');
        const is_checked = checkbox.checked;


        if (nomember_name == "") {
            alert("이름을 입력해 주세요.");
            $(".nomember_name").focus();
        }
        if (pay_phone == "" && nomember_name != "") {
            alert("휴대폰 번호를 입력해 주세요.");
            $("#pay_phone").focus();
        }
        if (input_email == "" && nomember_name != "" && pay_phone != "" || input_domain == "" && nomember_name != "" && pay_phone != "") {
            alert("이메일을 입력해 주세요.");
            $("#input_email").focus();
        }
        if (company == "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드 회사를 선택해 주세요.");
        }
        if (c_num1 == "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드번호를 입력해 주세요.");
            $("#c_num1").focus();
        }
        if (c_num2 == "" && c_num1 != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드번호를 입력해 주세요.");
            $("#c_num2").focus();
        }
        if (c_num3 == "" && c_num2 != "" && c_num1 != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드번호를 입력해 주세요.");
            $("#c_num3").focus();
        }
        if (c_num4 == "" && c_num3 != "" && c_num2 != "" && c_num1 != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드번호를 입력해 주세요.");
            $("#c_num4").focus();
        }
        if (card_month == "" && c_num4 != "" && c_num3 != "" && c_num2 != "" && c_num1 != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드 유효기간(월)을 선택해 주세요.");
        }
        if (card_year == "" && card_month != "" && c_num4 != "" && c_num3 != "" && c_num2 != "" && c_num1 != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("카드 유효기간(년도)을 선택해 주세요.");
        }
        if (is_checked == false && c_num4 != "" && c_num3 != "" && c_num2 != "" && c_num1 != "" && card_year != "" && card_month != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            alert("필수 규정을 확인하시고 체크해 주세요.");
        }
        if (is_checked == true && c_num4 != "" && c_num3 != "" && c_num2 != "" && c_num1 != "" && card_year != "" && card_month != "" && company != "" && input_email != "" && input_domain != "" && nomember_name != "" && pay_phone != "") {
            document.getElementById("bookform").submit();
        }
    }
    //영어와 숫자만
    function onlyEngNum(e) {
        const regex = /[^A-Za-z0-9.]/g;
        if (regex.test(e.value)) {
            alert('영문자,숫자, . 만 입력 가능합니다');
            e.value = e.value.replace(regex, '');
        }
    }

    // 전화번호 입력
    function onlyPhone(target) {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
    }

    const phoneInput = document.querySelector('#pay_phone');
    phoneInput.addEventListener('input', (e) => {
        if (/[^0-9]/g.test(e.target.value)) {
            e.target.value = e.target.value.replace(/[^0-9]/g, '');
        }
    });

    // 한글과 영문만
    function onlyKoEng(e) {
        const regex = /[^(ㄱ-힣a-zA-Z)]/gi;
        if (regex.test(e.value)) {
            alert("한글과 영문만 입력 가능합니다");
            e.value = e.value.replace(regex, '');
        }
    }

    // 숫자만 입력
    function onlyNum(e) {
        const regex = /[^0-9]/g;
        if (regex.test(e.value)) {
            alert("숫자만 입력 가능합니다");
            e.value = e.value.replace(regex, '');
        }
    }

</script>