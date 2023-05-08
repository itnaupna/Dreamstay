<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
    .res_main .res_title {
        font-size: 25px;
        /*border: 1px solid pink;*/
    }

    .res_main .res_room {
        width: 1000px;
        border: 1px solid #c0c0c0;
        margin-top: 20px;
        height: 90px;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .res_main .res_room a {
        text-decoration: none;
        color: black;
        font-size: 20px;
        text-align: center;

    }

    .res_main .res_room .r_a1, .r_a2, .r_a3, .r_a4 {
        /*border: 1px solid red;*/
        border-right: 1px solid #001100;
        padding: 0 20px;
    }

    .res_main .res_sel .res_btn {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 200px;
    }

    .res_main .res_sel .res_btn .r_btn {
        font-size: 15px;
        border-color: #000000;
        border-width: thin;
        width: 180px;
        background-color: #F9F9F9;
        height: 50px;
    }

    .res_main .res_sel {
        margin-top: 20px;
        /*border: 1px solid green;*/
        width: 1000px;
        height: 900px;
        background-color: #F9F9F9;
    }

    .res_main .res_bottom {
        /*border: 1px solid blue;*/
        margin-top: 70px;
    }

    .res_main .res_bottom .bt_ul li {
        color: #ccc;
        margin-top: 10px;
    }

    hr {
        background: #ccc;
        height: 1px;
        border: 0;
        width: 950px;
    }

    .aco_list {
        list-style: none;
        padding: 0;
    }

    .aco_list li {
        border-bottom: 1px solid #ddd;
    }

    .aco_list li a {
        display: block;
        height: 50px;
        padding-left: 20px;
        line-height: 50px;
        text-decoration: none;
        transition: .2s;
        color: black;
    }

    .aco_list li a:hover {
        background-color: #222;
        color: #fff;
    }

    .aco_list li .text_box {
        display: none;
        padding: 10px 40px;
        color: #555;
        cursor: pointer;
    }

    .res_main .r_sub{
        margin-top: 30px;
    }

    .res_main .r_sub span{
        color: #ccc;
    }

    #hotel_name{
        flex: 1;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        background: none;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        font-size: 14px;
        width: 200px;
        margin-top: 20px;
    }

    .flatpickr-day.in-range,
    .flatpickr-day.in-range:hover {
        background-color: yellow !important;
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

    <div class="r_sub">
        <span>예약한 호텔을 선택해주세요 *</span>
    </div>
    <div class="res_sel">
        <%-- 호텔 아코디언 --%>
        <ul class="aco_list">
            <li>
                <a href="#">GRAND JOSUN</a>
                <p class="text_box" onclick="saveValue(this)">
                    그랜드 조선 부산
                </p>
                <p class="text_box" onclick="saveValue(this)">
                    그랜드 조선 제주
                </p>
                <p class="text_box" onclick="saveValue(this)">
                    그랜드 조선 서울
                </p>
            </li>

            <li>
                <a href="#">WESTIN JOSUN</a>
                <p class="text_box" onclick="saveValue(this)">
                    웨스틴 조선 서울
                </p>
                <p class="text_box" onclick="saveValue(this)">
                    웨스틴 조선 부산
                </p>
            </li>

            <li>
                <a href="#">FOUR POINTS</a>
                <p class="text_box" onclick="saveValue(this)">
                    포포인츠 바이 쉐라톤 조선 서울역
                </p>
                <p class="text_box" onclick="saveValue(this)">
                    포포인츠 바이 쉐라톤 조선 명동
                </p>
            </li>
        </ul>
            <form>
                <input class="form-control" type="datetime-local" placeholder="select datetime">
            </form>

        <%-- 호텔 값 가져오기 --%>
        <input type="text" id="hotel_name" name="hotel_name" placeholder="호텔을 선택해주세요">

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

    // p 태그 //
    function saveValue(element) {
        var selectedValue = element.innerHTML;
        document.getElementById("selected_value").value = selectedValue;
    }

    function saveHotelName(hotelName) {
        var input = document.getElementById("hotel_name");
        input.value = hotelName;
    }

    var textBoxes = document.querySelectorAll(".text_box");
    for (var i = 0; i < textBoxes.length; i++) {
        textBoxes[i].addEventListener("click", function() {
            var hotelName = this.textContent.trim();
            saveHotelName(hotelName);
        });
    }
</script>

<%-- 달력 테스트 --%>
<script>
    config = {
        enableTime: false,
        dateFormat: "Y-m-d",
        onReady: function (selectedDates, dateStr, instance) {
            const days = instance.days;

            let prevDate;

            days.addEventListener("mouseover", function (event) {
                const target = event.target.closest(".flatpickr-day");

                if (!target) return;

                const currentDate = target.dateObj;

                if (prevDate) {
                    days.querySelectorAll(".flatpickr-day").forEach(function (day) {
                        const date = day.dateObj;
                        if (
                            (date >= prevDate && date <= currentDate) ||
                            (date <= prevDate && date >= currentDate)
                        ) {
                            day.classList.add("in-range");
                        } else {
                            day.classList.remove("in-range");
                        }
                    });
                }

                prevDate = currentDate;
            });

            days.addEventListener("mouseout", function () {
                days.querySelectorAll(".flatpickr-day").forEach(function (day) {
                    day.classList.remove("in-range");
                });

                prevDate = null;
            });
        },
    };
            flatpickr("input[type=datetime-local]", config);
</script>
