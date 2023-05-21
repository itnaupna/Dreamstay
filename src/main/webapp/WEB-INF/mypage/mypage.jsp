<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<%--<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>--%>

<style>


    @import url('https://static.toss.im/tps/main.css');
    @import url('https://static.toss.im/tps/others.css');

    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 700;
        font-style: normal;
    }

    /* 타이틀 */
    .res_main .res_title {
        font-size: 25px;
        /*border: 1px solid pink;*/
    }

    /* 메뉴 바 */
    .res_main .res_room {
        width: 1000px;
        border: 1px solid #c0c0c0;
        margin-top: 20px;
        height: 90px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        font-family: 'GmarketSansMedium';
    }

    /* 메뉴바 글씨 */
    .res_main .res_room a {
        text-decoration: none;
        color: black;
        font-size: 20px;
        text-align: center;
    }

    /* 메뉴바 간격 조절 */
    .res_main .res_room .r_a1, .r_a2, .r_a3, .r_a4 {
        /*border: 1px solid red;*/
        border-right: 1px solid #001100;
        padding: 0 20px;
    }

    /* 메뉴바 아래 전체 */
    .res_main .res_sel {
        margin-top: 30px;
        /*border: 1px solid green;*/
        width: 1000px;
        height: 730px;
        /*background-color: #F9F9F9;*/
        font-family: 'Toss Product Sans', sans-serif;
    }

    /* 맨 아래 문구 */
    .res_main .res_bottom {
        /*border: 1px solid blue;*/
        margin-top: 70px;
    }

    /* 사이 줄 조절 */
    hr {
        background: #ccc;
        height: 1px;
        border: 0;
        width: 950px;
    }

    /* 서브 문구 */
    .res_main .r_sub span {
        color: #ccc;
    }

    /*.res_main .res_sel span {*/
    /*    !*color: #ccc;*!*/
    /*    margin-top: 20px;*/
    /*}*/

    .nobook {
        /*border: 1px solid red;*/
        height: 400px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 30px;
        flex-direction: column;
        margin-top: 200px;
    }

    .bookbtn {
        width: 300px;
        height: 60px;
        line-height: 60px;
        border: 1px solid #ccc;
        transition: transform .6s .6s ease-in,
        box-shadow .6s .6s ease-in,
        background .6s ease-out,
        color .6s ease-out;
        background-color: white;
        color: black;
        font-size: 17px;
        margin-top: 20px;
    }

    .bookbtn:hover {
        transform: rotateY(10deg);
        box-shadow: -7px 7px 40px 0px rgba(0, 0, 0, 0.55);
        background: black;
        color: white;
    }

    /* 예약한 호텔 한 줄에 2개씩 */
    .book_list {
        display: flex;
        justify-content: flex-start;
        flex-wrap: wrap;
        gap: 20px;
    }

    .book_list .for_list {
        flex-basis: calc(33.33% - 20px);
        width: 100%;
    }

    .for_list {
        border: none;
        border-radius: 5px;
        width: 650px;
        height: 450px;
        box-shadow: -4px 4px 7px 7px #dddddd;
        margin-top: 30px;
        background-color: white;
        transition: transform 0.5s;
    }

    .for_list:hover {
        box-shadow: -10px 10px 7px 7px #ccc;
        transform: translateY(-7px);
    }

    .for_list span {
        font-family: 'GmarketSansMedium';
    }

    .for_list {
        /*font-weight: lighter;*/
    }

    .list_img {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }

    .book_name {
        color: #ccc;
    }

    .list1 {
        border: none;
        border-radius: 5px;
        width: 100%;
        /*height: 40px;*/
        text-align: center;
        justify-content: center;
        align-items: center;
        display: flex;
        /*font-family: 'GmarketSansMedium';*/
        font-weight: 700;
        font-family: 'GmarketSansMedium';
        margin-top: 15px;
    }

    .list_box {
        box-shadow: -2px 2px 5px 5px #dddddd;
        display: flex;
        /*justify-content: space-around;*/
        height: 50px;
        flex-direction: column;
    }

    .list0 {
        display: flex;
        justify-content: space-around;

    }

    .list1 span {
        font-family: 'GmarketSansMedium';
        font-size: 16px;
    }

    .list2 {
        display: flex;
        justify-content: space-around;

    }

    .list2 span{
        /*background-color: black;*/
        /*color: white;*/
        border: none;
        border-bottom: 2px solid rgba(139, 69, 19, 0.5);

        width: 120px;
        text-align: center;
        transition: transform 0.5s;
        font-size: 15px;
    }

    .list2 span:hover{
        transform: translateY(-5px);
    }

    .list3 {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
    }

    .list4 {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
    }

    .list5 {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
    }

    .nobooktitle {
        font-size: 20px;
    }

    .list_img img {
        width: 100%;
        height: 200px;
        border-radius: 5px;
    }

    .nomemberbook {
        height: 1200px;
    }

    .r_a1 a,
    .r_a2 a,
    .r_a3 a,
    .r_a4 a {
        color: #000;
        text-decoration: none;
        border-bottom: 2px solid transparent;
        transition: border-bottom-color 0.3s ease-in-out;
    }

    .r_a1 a:hover,
    .r_a2 a:hover,
    .r_a3 a:hover,
    .r_a4 a:hover {
        border-bottom-color: #000;
    }

    .buttondiv {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 10px;
    }

    .del_btn {
        font-size: 13px;
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
        width: 80px;
        height: 30px;
    }

    .del_btn:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
        background-color: white;
        color: black;
    }

    .list_img {
        position: relative;
        height: 200px;
    }

    .list_img img {
        width: 100%;
        height: 100%;
        /*object-fit: cover;*/
    }

    .list_img::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        opacity: 0;
        transition: opacity 0.3s;
    }

    .list_img:hover::before {
        opacity: 1;
    }

    .list_img::after {
        content: "View Details";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 20px;
        font-weight: bold;
        opacity: 0;
        transition: opacity 0.5s;
    }

    .list_img:hover::after {
        opacity: 1;
    }

    @media screen and (max-width: 768px) {
        .res_main .res_room {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .res_main .res_room a {
            padding: 0 10px;
        }

        .res_main .res_sel {
            width: 100%;
        }

        /*!*.for_list {*!*/
        /*!*    width: 100%;*!*/
        /*!*}*!*/
        /*.for_list {*/
        /*    width: 50%;*/
        /*}*/
    }

</style>

<div class="res_main">

    <div class="res_title">
        <p>예약확인</p>
    </div>


    <div class="res_room">
        <div class="r_a1">
            <a href="#">객실/패키지</a>
        </div>
        <div class="r_a2">
            <a href="/mypage/dining">다이닝</a>
        </div>
        <div class="r_a3">
            <a href="#">액티비티</a>
        </div>
        <div class="r_a4">
            <a href="#">멤버쉽</a>
        </div>
    </div>

    <div class="res_sel">
        <c:choose>
            <c:when test="${size == 0}">
                <div class="nobook">
                    <div class="nomemberbook">
                        <p>${familyname}${firstname}님의 예약내역이 없습니다.</p>
                        <p class="nobooktitle">다양한 Dream Stay의 상품을 예약해보세요</p>
                        <button type="button" onclick="location.href='/'" class="bookbtn">예약하기</button>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="book_info">
                    <span class="book_name">${familyname}${firstname}님 예약 정보</span>
                    <div class="book_list">
                        <c:forEach var="list" items="${data}" varStatus="i">
                            <div class="for_list">
                                <div class="wrapper">
                                    <div class="list_img">
                                        <img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/${list.photo}">
                                    </div>
                                    <div class="list_data">
                                        <div class="list_box">
                                            <div class="list0">
                                                <span>체크인</span><span>체크아웃</span>
                                            </div>
                                            <div class="list2">
                                                <span>
                                                <fmt:parseDate value='${list.checkin}' var='checkin'
                                                               pattern='yyyy-mm-dd'/>
                                                <fmt:formatDate value="${checkin}" pattern="yyyy-mm-dd"/>
                                                    </span>
                                                <span>
                                                <fmt:parseDate value='${list.checkout}' var='checkout'
                                                               pattern='yyyy-mm-dd'/>
                                                <fmt:formatDate value="${checkout}" pattern="yyyy-mm-dd"/><br>
                                                    </span>
                                            </div>
                                        </div>
                                        <div class="list1">
                                            <span>Type :</span>${list.roomtype}<br>
                                        </div>
                                        <div class="list3">
                                            <span>성인 :</span> ${list.adult}명
                                            <span>어린이 :</span> ${list.kids}명<br>
                                        </div>
                                        <div class="list4">
                                            <c:if test="${empty list.memo}">
                                                <span>요구사항이 없습니다.</span>
                                            </c:if>
                                            <c:if test="${not empty list.memo}">
                                                <span>요구사항 :</span> ${list.memo}<br>
                                            </c:if>
                                        </div>
                                        <div class="list5">
                                            <span>가격 :</span><fmt:formatNumber value="${list.total_price}"
                                                                               type="currency"/>
                                        </div>
                                        <div class="buttondiv">
                                            <button type="button" id="del_btn" class="del_btn"
                                                    onclick="deletebook(${list.booknum});">예약취소
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${i.count%3==0}">
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    function deletebook(num) {
        if (!confirm("예약 취소하시겠습니까?")) return;
        location.href = "/mypage/deletebook?num=" + num;
    }

    // $(document).on("click", ".header_hotel_list", function() {
    //     var num = $(this).attr("value");
    //     location.href = "/hotel/hoteldetail?num=" + num;
    // });
    //
    // $(function() {
    //     $.ajax({
    //         url: "/hotel/hotellist",
    //         type: "get",
    //         success: function(data) {
    //             var hotelList = "";
    //             $.each(data, function(i, d) {
    //                 hotelList += '<li class="header_hotel_list" value="' + d.num + '">' + d.name + '</li>';
    //             });
    //             $("#hotel_list").html(hotelList);
    //         }
    //     });
    // });

</script>