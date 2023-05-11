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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                <dd><input type="text" value="${roomCount}" readonly="readonly"></dd>
            </dl>

            <dl class="dl04">
                <dt>ROOMS</dt>
                <dd><input type="text" value="${adultCount}" readonly="readonly"></dd>
            </dl>

            <dl class="dl05">
                <dt>ROOMS</dt>
                <dd><input type="text" value="${childrenCount}" readonly="readonly"></dd>
            </dl>
            <button type="button" onclick="location.href='/'">다시 검색하기</button>
        </div>
    </div>
    <c:forEach var="room" items="${roomList}">
        <form action="../payment" method="post" name="payment">
            <input type="hidden" value="${totaldays}" name="totaldays" readonly>
            방번호 : <input value="${room.num}" type="number" name="roomnum" readonly>
            호텔번호 : <input value="${room.hotelnum}" type="number" name="hotelnum" readonly>
            방 타입 : <input value="${room.roomtype}" type="text" name="roomtype" readonly>
            <c:if test="${totaldays >= 3}">ㄴㄴ
                방 가격 : <input value="<fmt:formatNumber value="${(room.roomprice * totaldays)/10*9}" pattern="#,##0원"/>" type="text" name="roomprice" readonly>
            </c:if>
            <c:if test="${totaldays < 3}">
                방 가격 : <input value="${room.roomprice * totaldays}" type="number" name="roomprice" readonly>
            </c:if>
            요청사항 : <input value="${room.roommemo}" type="text" name="roommemo" readonly>
            상세정보 : <input value="${room.roomdetail}" type="text" name="roomdetail" readonly>
            <button type="submit">예약하기</button>
            <!-- 필요한 방 정보를 출력하거나 처리하는 코드 추가 -->
        </form>
    </c:forEach>
</div>

<script>


</script>

