<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
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

    /* 버튼 div */
    .res_main .res_sel .res_btn {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 170px;
    }

    /* 버튼 */
    .res_main .res_sel .res_btn .r_btn {
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        width: 180px;
        background-color: #F9F9F9;
        height: 50px;
        cursor: pointer;
    }

    .r_btn:hover {
        border-image: linear-gradient(#12c2e9, #c471ed, #f64f59) 5;
        background-color: white !important;
    }

    /* 메뉴바 아래 전체 */
    .res_main .res_sel {
        margin-top: 50px;
        /*border: 1px solid green;*/
        width: 1000px;
        height: 1000px;
        background-color: #F9F9F9;
    }

    /* 맨 아래 문구 */
    .res_main .res_bottom {
        /*border: 1px solid blue;*/
        margin-top: 70px;
    }

    /* 맨 아래 문구 간격 */
    .res_main .res_bottom .bt_ul li {
        color: #ccc;
        margin-top: 10px;
    }

    /* 사이 줄 조절 */
    hr {
        background: #ccc;
        height: 1px;
        border: 0;
        width: 950px;
    }

    /* 아코디언 형식 설정 */
    .aco_list {
        list-style: none;
        padding: 0;
    }

    /* ~ */
    .aco_list li {
        border-bottom: 1px solid #ddd;
    }

    /* ~ */
    .aco_list li a {
        display: block;
        height: 50px;
        padding-left: 20px;
        line-height: 50px;
        text-decoration: none;
        transition: .2s;
        color: black;
    }

    /* ~ */
    .aco_list li a:hover {
        background-color: #222;
        color: #fff;
    }

    /* ~ */
    .aco_list li .text_box {
        display: none;
        padding: 10px 40px;
        color: #555;
        cursor: pointer;
    }

    /* 서브 문구 */
    .res_main .r_sub span {
        color: #ccc;
    }

    #hotel_name, #checkin {
        flex: 1;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 14px;
        width: 400px;
        margin-top: 30px;
    }

    .res_main .res_sel span {
        color: #ccc;
        margin-top: 20px;
    }

    .res_main .datepicker {
        /*margin-top: 10px;*/
        margin-left: 50%;
        position: absolute;
        visibility: hidden;
    }

    .res_main .datepicker .seldate {
        width: 300px;
    }

    .res_main .date_sub {
        /*border: 1px solid orangered;*/
        margin-top: 20px;
        font-size: 12px;
    }

    .res_main .res_sel .res_select #checkin {
        margin-left: 20px;
    }

    .res_main .res_sel .res_select {
        justify-content: space-between;
        display: flex;
    }

    #tb_1:focus {
        background-color: white;
    }

    .chtitle {
        /*border: 1px solid aqua;*/
        margin-top: 60px;
        font-size: 13px;
        color: #ccc;
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
            <a href="#">다이닝</a>
        </div>
        <div class="r_a3">
            <a href="#">액티비티</a>
        </div>
        <div class="r_a4">
            <a href="#">멤버쉽</a>
        </div>
    </div>

    <div class="res_sel">
        <%-- 호텔 아코디언 --%>
        <span>예약한 호텔을 선택해주세요 *</span>
        <ul class="aco_list">
            <li>
                <a href="#">GRAND JOSUN</a>
                <c:forEach var="dto" items="${list}">
                    <p class="text_box" id="tb_1" data-value="${dto.num}">${dto.name}</p>
                </c:forEach>
            </li>
        </ul>

        <div class="datepicker">
            <form>
                <input class="form-control seldate flatpickr flatpickr-input" id="seldate" type="datetime-local"
                       placeholder="select check in">
            </form>
        </div>

        <div class="chtitle">
            <span>호텔과 날짜를 확인해주세요 *</span>
        </div>

        <%-- 호텔 값 가져오기 --%>
        <div class="res_select">
            <input type="text" id="hotel_name" name="hotel_name" placeholder="호텔을 선택해주세요" readonly="readonly">
        </div>
        <div class="res_btn">
            <button type="button" class="r_btn">기간 조회</button>
        </div>

        <div class="res_bottom">
            <hr>
            <ul class="bt_ul">
                <li>
                    온라인 예약 건에 한하여 조회가 가능하며, 현재일 기준 1년까지 제공됩니다.
                </li>

                <li>
                    예약날짜 기준으로 현재부터 3개월 이후의 예약 내역이 우선 조회됩니다.
                </li>

                <li>
                    과거 또는 미래의 예약내역을 조회하시려면 상단의 날짜를 변경해주십시오.
                </li>

                <li>
                    레스케이프는 레스케이프 홈페이지에서 예약 확인이 가능합니다.
                </li>

                <li>
                    메리어트 브랜드의 예약 내역은 해당 사이트에서 조회하실 수 있습니다.
                </li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    // 호텔 리스트 아코디언
    $(function () {
        const acoAco = $(".aco_list li a");

        acoAco.on('click', function () {
            const item = $(this);

            acoAco.parent().find('.text_box').slideUp();

            if (item.hasClass('active')) {
                item.find('.text_box').slideUp();
                item.removeClass('active');
            } else {
                item.parent().find('.text_box').slideDown();
                acoAco.removeClass('active');
                item.addClass('active');
            }

            item.parent().find('.text_box').slideDown();
        });
    });

    // 호텔 벨류값 가져오기 //
    function saveValue(element) {
        document.getElementById("selected_value").value = element.innerHTML.trim();
    }

    function saveHotelName(hotelName) {
        document.getElementById("hotel_name").value = hotelName;
    }

    document.querySelectorAll(".text_box").forEach(function (textBox) {
        textBox.addEventListener("click", function () {
            saveHotelName(this.textContent.trim());
        });
    });

    // // 캘린더 벨류 값
    // const seldate = document.querySelector('#seldate');
    // const checkin = document.querySelector('#checkin');
    //
    // seldate.addEventListener('input', () => {
    //     checkin.value = seldate.value;
    // });
</script>

<%-- 달력 테스트 --%>
<%--<script>--%>
<%--    const config = {--%>
<%--        enableTime: false,--%>
<%--        dateFormat: "Y-m-d",--%>
<%--    };--%>

<%--    flatpickr("input[type=datetime-local]", config);--%>
<%--</script>--%>
