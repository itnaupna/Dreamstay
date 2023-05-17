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
    .book_num{
        width: 350px;
        margin-left: 300px;
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



    <c:if  test="${memberDto.user_name == null}">
        <span><input type="text" value="${nomemberusername }" name="user_name" class="user_name" required></span>
        <div>예약되엇습니다.</div>
        <div>예약 번호는</div>
        <input type="text" value="${nomemberId }" class="book_num" readonly>

    </c:if>
    <c:if  test="${memberDto.user_name != null}">
        <span><input type="text" value="${memberDto.user_name }" name="user_name" class="user_name" readonly></span>
        <div>예약되엇습니다.</div>
        <button type="button" class="mainbtn" onclick="location.href='/'">메인으로</button>
    </c:if>
</div>

