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
        width: 1400px;
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
    }

    .book_main .book_select {
        /*border: 1px solid yellow;*/
        margin-top: 20px;
    }

    .book_main .book_top .book_title .book_ol li {
        list-style: none;
    }

    .book_main .book_top .book_title .book_ol em {
        /*border: 1px solid green;*/
        display: inline-block;
        margin-top: 120px;
        font-size: 20px;
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

    .book_main .book_select .book_inner dl{
        float: left;
        margin-right: 20px;
        margin-top: 15px;
    }

    .book_main .book_select .book_inner dl dt{
        font-weight: revert;
        color: black;
    }

    .book_main .book_select .book_inner dl dd input[type=text]{
        border: none;
        background-color: #f9f9f9;
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
                <dd><input type="text" value="${sessionScope.checkIn}" readonly="readonly">
                    <input type="text" value="${sessionScope.checkOut}" readonly="readonly"></dd>
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
            <button type="button" onclick="search_room">세션 가지고오기</button>
        </div>
    </div>
</div>

<script>

</script>

