<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<link rel="stylesheet" href="/css/hotel/hoteldetail.css"/>


<div id="hoteldetail_box">
    <div class="hoteldetail_slidebox">
        <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${detail[0].photo}" class="hoteldetail_photo">
        <c:forEach var="photos" items="${roomphoto}" >
            <c:forEach var="photo" items="${photos}" varStatus="idx">
                <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/${photo}" class="hoteldetail_photo">
            </c:forEach>
        </c:forEach>

    </div>

    <div id="hoteldetail_selectbox">
        <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${detail[0].photo}?type=f&w=80&h=80" class="hoteldetail_selectPhoto">
        <c:forEach var="photos" items="${roomphoto}" >
            <c:forEach var="photo" items="${photos}" varStatus="idx">
                <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/room/${photo}?type=f&w=80&h=80" class="hoteldetail_selectPhoto">
            </c:forEach>
        </c:forEach>
    </div>

    <span class="detail_span" id="hoteldetail_title">${detail[0].name}</span>
    <span class="detail_span" id="hoteldetail_subtitle">${detail[0].memo}</span>
    <div id="detail_room_subjectbox">
        <c:forEach var="roomdetail" items="${detail}" varStatus="i" step="2">
            <div class="detail_room_box">
                <div class="detail_room_slickSlider">
                    <c:if test="${roomdetail.roomphoto != null}">
                        <c:forEach var="photo" items="${roomphoto[i.index]}">
                            <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/${photo}" class="detail_room_photo">
                        </c:forEach>
                    </c:if>
                </div>
                <div class="detail_room_info">
                    <span class="detail_span hoteldetail_room_type" >${roomdetail.roomtype}</span>
                    <span class="detail_span hoteldetail_roomdetail">${roomdetail.roomdetail}</span>
                    <span class="detail_span hoteldetail_roommemo">${roomdetail.roommemo}</span>
                </div>
            </div>
            <div class="detail_room_box">
                <div class="detail_room_info">
                    <span class="detail_span hoteldetail_room_type">${detail[i.index + 1].roomtype}</span>
                    <span class="detail_span hoteldetail_roomdetail">${detail[i.index + 1].roomdetail}</span>
                    <span class="detail_span hoteldetail_roommemo">${detail[i.index + 1].roommemo}</span>
                </div>
                <div class="detail_room_slickSlider">
                <c:if test="${detail[i.index + 1].roomphoto != null}">
                    <c:forEach var="photo" items="${roomphoto[i.index + 1]}">
                        <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/${photo}" class="detail_room_photo">
                    </c:forEach>
                </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script type="text/javascript" src="/js/hotel/hoteldetail.js"></script>

