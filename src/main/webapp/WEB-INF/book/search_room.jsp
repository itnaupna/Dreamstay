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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }
    .book_main {
        /*border: 1px solid pink;*/
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
        font-weight: bold;
        color: black;
    }

    .book_main .book_select .book_inner dl dd input[type=text] {
        border: none;
        background-color: #f9f9f9;
        font-family: 'GmarketSansMedium';
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
        transition: 0.6s;
        font-family: 'GmarketSansMedium';
    }
    .mainbtn:hover{
        color: #ffffff;
        background-color: #000000;
    }

    .RoomList {
        margin: 10px;
        /*width: 1900px;*/
        max-width: 1900px;
        height: auto;
        /*border:1px solid;*/
        border-radius: 0.825rem;
        border-left: 0.25rem solid #f1c27a7d !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58, 59, 69, .15) !important;
        transition: box-shadow 0.1s ease;
        font-weight: 900 !important;
        font-size: .6rem;
        padding-left: 300px;
        padding-top:20px;
        padding-bottom: 20px;
    }

    #BookBtn {
        float: right;
        margin-top: -130px;
        text-align: center;
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        width: 150px;
        background-color: black;
        height: 60px;
        color: white;
        cursor: pointer;
        margin-right: 235px;
        transition: 0.6s;
        font-family: 'GmarketSansMedium';
    }
    #BookBtn:hover{
        color: black;
        background-color: #ffffff;
    }

    .test3 {
        width: 1900px;
    }
    .RoomList p input{
        border:none;
        border-right: 0px;
        border-top: 0px;
        border-left: 0px;
        border-bottom: 0px;
        width: 900px;
    }
    .RoomList p input:focus{
        outline:none;
    }
    .RoomInfo{
        margin: 10px;
        width: 85%;
        height: auto;
        /*border:1px solid;*/
        border-radius: 0.825rem;
        border-left: 0.25rem solid #e7d1af7d !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58, 59, 69, .15) !important;
        transition: box-shadow 0.1s ease;
        font-weight: 900 !important;
        font-size: 16px;
        padding-left: 30px;
        padding-top:20px;
        padding-bottom: 20px;
        margin-left: 100px;

    }
    .roomimg{
        height: 180px;
        width: 250px;
        display: flex;
        float: left;
        margin-left: 45px;
        margin-top: 35px;
    }
    body{
        width: 1900px;
       /* overflow-x: hidden;*/
    }

    .book_ol em, .RoomInfo{
        font-family: 'GmarketSansMedium';
    }
    span .booking, .dl_list{
        font-family: 'Playfair Display SC', serif;
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
                <dt class="dl_list">HOTEL</dt>
                <input type="hidden" value="${selectedHotel }" readonly="readonly">
                <dd><input type="text" value="${hotelname }" readonly="readonly"></dd>
            </dl>

            <dl class="dl02">
                <dt class="dl_list">DATE</dt>
                <dd><input type="text" value="${sessionScope.checkInShow}" readonly="readonly">
                    <input type="text" value="${sessionScope.checkOutShow}" readonly="readonly"></dd>
            </dl>

            <dl class="dl03">
                <dt class="dl_list">ROOMS</dt>
                <dd><input type="text" value="${sessionScope.roomCount}" readonly="readonly"></dd>
            </dl>

            <dl class="dl04">
                <dt class="dl_list">Adults</dt>
                <dd><input type="text" value="${sessionScope.adultCount}" readonly="readonly"></dd>
            </dl>

            <dl class="dl05">
                <dt class="dl_list">Children</dt>
                <dd><input type="text" value="${sessionScope.childrenCount}" readonly="readonly"></dd>
            </dl>
            <button type="button" class="mainbtn" onclick="location.href='/'">다시 검색하기</button>
        </div>
    </div>
    <div class="test3">

    <c:forEach var="room" items="${roomList}" varStatus="i">
        <form action="../payment" method="post" name="payment">
            <span id="roomPhotos">
                <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/${photoArr[i.index][0]}" name="roomphoto"style="position:relative;display: flex;float: left;margin-left: 70px;margin-top: 40px;width:250px;height: 182px;
padding-right: 50px; border-radius:10px;">
            </span>
            <div class="RoomList">
                <div class="RoomInfo">
                    <input type="hidden" value="${totaldays}" name="totaldays" readonly>
                    <p><input value="${room.num}" type="hidden" name="roomnum" readonly></p>
                    <p><input value="${room.hotelnum}" type="hidden" name="hotelnum" readonly></p>
                    <p>방 타입 : <input value="${room.roomtype}" type="text" name="roomtype" readonly></p>
                <c:if test="${totaldays >= 3}">
                    <p>방 가격 : <input value="<fmt:formatNumber value="${(room.roomprice * totaldays * roomCount)/10*9}" pattern="#,##0원"/>" type="text" name="roomprice" readonly></p>
                </c:if>
                <c:if test="${totaldays < 3}">
                    <p>방 가격 : <input value="<fmt:formatNumber value="${(room.roomprice * totaldays * roomCount)}" pattern="#,##0원"/>" type="text" name="roomprice" readonly></p>
                </c:if>
                    <p>상세정보 : <input value="${room.roommemo}" type="text" name="roommemo" readonly></p>
<%--                    <p>상세정보 : <input value="TODO : 수정요함" type="text" name="roomdetail" readonly></p>--%>
                </div>
                <button type="submit" id="BookBtn" class="btn btn-secondary">예약하기</button>
            <!-- 필요한 방 정보를 출력하거나 처리하는 코드 추가 -->
            </div>
        </form>
    </c:forEach>
    </div>
</div>



