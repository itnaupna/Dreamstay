<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .book_main {
        border: 1px solid pink;
        width: 1900px;
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
        width: 1900px;

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

    .book_main .book_select .book_inner dl dd {

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

    .pay{
        margin-left: 280px;
        margin-top: 30px;
        border: 1px solid pink;
    }

    .pay .pay_main .pay_choice{
        border: 1px solid green;
        display: inline-block;
        font-family: 'Playfair Display SC', serif;
        font-size: 50px;
    }

    .pay .pay_main .pay_room{
        display: flex;
        flex-direction: column;
        border: 1px solid green;
        width: 400px;
    }

    .pay .pay_main .pay_name{
        margin-top: 25px;
        border: 1px solid red;
    }

    .pay .pay_main .pay_name span{
        margin-bottom: 30px;
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
        </div>
    </section>
</div>