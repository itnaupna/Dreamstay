<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .nomember_main {
        margin-top: 140px;
        /*border: 1px solid orangered;*/
        width: 1000px;
        height: 1000px;
        margin-left: auto;
        margin-right: auto;
        border: 1px solid #ccc;
    }

    .nomember_header {
        /*border: 1px solid yellow;*/
        text-align: center;
    }

    .nomember_hotel_info {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        margin-top: 20px;
        /*border: 1px solid pink;*/
    }

    .nomember_hotel_photo {
        /*border: 1px solid green;*/
        margin-top: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        /*border: 1px solid red;*/
    }

    .nomember_hotel_photo img {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 250px;
        height: 200px;
        object-fit: fill;
    }

    .nomember_room_info {
        display: flex;
        flex-direction: column;
        border: 1px solid black;
        height: 200px;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    .nomember_header_title h2{
        font-size: 25px;
        font-weight: normal;
        font-family: "Playfair Display", serif;
        font-style: italic;
        padding: 0 0 20px 0;
    }

    .nomember_header_title span{
        color: inherit;
        font-size: 16px;
        line-height: 1.4;
        color: #868686;
    }

    .topimg1,
    .topimg2,
    .topimg3{
        width: 30px;
        height: 30px;
        margin-right: 5px;
    }
</style>

<div class="nomember_main">
    <div class="nomember_header">
        <div class="nomember_header_title">
            <h2>Dream Stay Reservation Check</h2>
            <span>${booksearch.user_name}님의 예약 정보입니다</span>
        </div>
        <div class="nomember_hotel_info">
            <span><img src="/photo/hotel.png" class="topimg1"> 호텔명 : ${booksearch.name}</span>
            <span><img src="/photo/pin.png" class="topimg2">주소 : ${booksearch.addr}</span>
            <span><img src="/photo/phone-call.png" class="topimg3">전화번호 : ${booksearch.phone}</span>
        </div>
    </div>
    <div class="nomember_hotel_photo">
        <span><img
                src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${booksearch.photo}?type=f&w=160&h=160&faceopt=true"></span>
    </div>

    <div class="nomember_room_info">
        <span>객실 타입 : ${booksearch.roomtype}</span>
        <span>체크인 :
        <fmt:parseDate value='${booksearch.checkin}' var='checkin' pattern='yyyy-mm-dd'/>
        <fmt:formatDate value="${checkin}" pattern="yyyy-mm-dd"/>
            </span>
        <span>체크아웃 :
        <fmt:parseDate value='${booksearch.checkout}' var='checkout' pattern='yyyy-mm-dd'/>
        <fmt:formatDate value="${checkout}" pattern="yyyy-mm-dd"/>
        </span>
        <span>성인 : ${booksearch.adult} 어린이 : ${booksearch.kids}</span>
        <span>요청 사항 : ${booksearch.roomtype}</span>
        <span>이용 요금 : ${booksearch.total_price}</span>
    </div>

</div>
