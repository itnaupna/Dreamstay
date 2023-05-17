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

    .mainbtn {
        width: 140px;
        height: 60px;
        font-size: 15px;
        margin-top: 10px;
        border-color: #000000;
        border-width: thin;
        background-color: black;
        color: black;
        cursor: pointer;
        font-weight: 700 !important;

    }

    .nomemberdiv,
    .memberdiv {
        height: 500px;
        width: 500px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 60px;
        border: 1px solid #ccc;
    }

    .no_name,
    .yes_name {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 30px 30px;
    }

    .no_name h2,
    .yes_name h2 {
        font-size: 25px;
        font-weight: normal;
        font-family: "Playfair Display", serif;
        font-style: italic;
        padding: 0 0 20px 0;
        flex: 1;
    }

    .no_name input[type=text],
    .yes_name input[type=text] {
        border: none;
        width: 80px;
    }

    .no_name input[type=text]:focus,
    .yes_name input[type=text]:focus {
        outline: none;
    }

    .no_booknum {
        display: flex;
        justify-content: center;
        /*align-items: center;*/
        /*height: 200px;*/
        margin-top: 30px;
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
        border: none;
        border-bottom: 1px solid #ccc;
        text-align: center;
        box-shadow: -3px 2px 5px 5px #ddd;
    }

    .book_number_title {
        text-align: center;
    }

    .book_number_title p {
        color: #dddddd;
        margin-top: 10px;
    }

    .go_to_main {
        margin-top: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .go_to_main .mainbtn1,
    .go_to_home .mainbtn{
        background-color: black;
        color: white;
        border: none;
        border-bottom: 1px solid #ccc;
        font-size: 15px;
        width: 200px;
        height: 60px;
        text-align: center;
    }

    .go_to_home{
        margin-top: 120px;
        display: flex;
        align-items: center;
        justify-content: center;
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
        <button type="button" class="mainbtn" onclick="location.href='/'">메인으로 돌아가기</button>

    </div>
</div>


<c:if test="${memberDto.user_name == null}">
    <div class="nomemberdiv">
        <div class="no_name">
            <h2>Dream Stay Reservation Check</h2>
            <span><input type="text" value="${nomemberusername }" name="user_name" class="user_name" required
                         readonly="readonly">님 예약되었습니다.</span>
        </div>

        <div class="book_number_title">
            <span><b>예약 번호</b></span><br>
            <p>예약 번호가 없을경우 예약확인이 불가능합니다.</p>
        </div>
        <div class="no_booknum">
            <input type="text" value="${nomemberId }" class="book_num" readonly id="book_num">
            <button onclick="copy_to_clipboard()" id="book_copy_btn">copy</button>
        </div>
        <div class="go_to_main">
            <button type="button" class="mainbtn1" onclick="location.href='/'">MAIN PAGE</button>
        </div>
    </div>
    </div>

</c:if>
<c:if test="${memberDto.user_name != null}">
    <div class="memberdiv">
        <div class="yes_name">
            <h2>Dream Stay Reservation Check</h2>
            <span><input type="text" value="${familyname}${firstname}" name="user_name" class="user_name" readonly>님 예약되었습니다.</span>
        </div>

        <div class="go_to_home">
            <button type="button" class="mainbtn" onclick="location.href='/'">MAIN PAGE</button>
        </div>
    </div>
</c:if>

<script>
    function copy_to_clipboard() {
        var copyText = document.getElementById("book_num");
        copyText.select();
        document.execCommand("Copy");
    }
</script>

