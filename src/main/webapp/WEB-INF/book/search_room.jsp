<%--
  Created by IntelliJ IDEA.
  User: milion
  Date: 2023-05-09
  Time: 오후 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        margin-left: 280px;
    }

    .book_main .book_select {
        /*border: 1px solid hotpink;*/
        height: 150px;
        background-color: #F9F9F9;
        display: flex;
        width: 100%
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
    }

    .room_div {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
        width: 400px;
        position: relative;
        margin-left: 280px;
        margin-top: 30px;
    }

    .room_table {
        width: 350px;
        margin-top: 100px;
        margin: 20px;
        border-collapse: collapse;
        border: 1px solid #ddd;
    }

    .room_row {
        display: flex;
        justify-content: space-between;
        width: 100%;
        margin-bottom: 20px;
    }

    .room_table td {
        padding: 10px;
        cursor: pointer;
    }

    .room_table .room_type {
        font-weight: bold;
    }

    .room_table .room_price {
        color: #777;
    }

    #clickroom {
        /*border: 1px solid red;*/
        display: none;
        width: 980px;
        height: 500px;
        position: absolute;
        top: 0;
        margin-top: 580px;
        right: -170px;
        margin-right: 250px;
    }

    .room_info {
        border-collapse: collapse;
        width: 100%;
        border: none;
        border-bottom: 1px solid #ccc;
        justify-content: space-between;
    }

    .c_room span{
        display: inline-block;
        border: 1px solid black;
        font-size: 15px;
        font-weight: lighter;
        width: 100px;
        text-align: center;
    }

    .room_info{
        margin-top: 20px;
    }

    .room_info td {
        padding-right: 10px; /* 오른쪽 padding 값 설정 */
    }


</style>

<div class="book_main">
    <div class="book_top">
        <div class="book_title">
            <span class="booking">BOOKING</span>
            <div class="book_ol">
                <ol>
                    <li>
                        <em>객실, 요금 선택</em>
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

    <div class="room_div">
        <c:forEach var="room" items="${roomList}" varStatus="loop">
            <div class="room_row">
                <div class="room_item" onclick="showRoom('${room.roomtype}', '${room.roomprice}')">
                    <table class="room_table">
                        <tr>
                            <td class="room_type" value="${room.roomtype}">TYPE : ${room.roomtype}</td>
                            <td class="room_price" value="${room.roomprice}">PRICE : ${room.roomprice}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </c:forEach>
    </div>

    <div id="clickroom" class="c_room">
        <p>Selected room:</p>
        <p>Type: <span id="roomType"></span></p>
        <p>Price: <span id="roomPrice"></span></p>
        <button type="button" class="paybtn" onclick="window.location.href='/payment'">결제</button>
    </div>
</div>

<script>
    function showRoom(roomType, roomPrice) {
        var clickroom = document.getElementById('clickroom');
        var roomTypeEl = document.getElementById('roomType');
        var roomPriceEl = document.getElementById('roomPrice');
        clickroom.style.display = "block";
        roomTypeEl.innerHTML = roomType; // Set the value of the roomType element to the selected room type
        roomPriceEl.innerHTML = roomPrice; // Set the value of the roomPrice element to the selected room price
    }
</script>