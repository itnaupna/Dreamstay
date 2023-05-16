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
        margin-top: 30px;
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

    /* 서브 문구 */
    .res_main .r_sub span {
        color: #ccc;
    }

    .res_main .res_sel span {
        color: #ccc;
        margin-top: 20px;
    }

    #login_id:focus{
        outline: none;
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
            <c:choose>
                <c:when test="${data == null}">
                    조회된 예약 x
                </c:when>
                <c:otherwise>
                    <div class="book_info">
                        <span>${data.user_name}님 예약 정보</span>
                        <table>
                            <tr>
                                <td colspan="3"><span>호텔 정보</span></td>
                            </tr>
                            <tr>
                                <td>호텔명</td>
                                <td>주소</td>
                                <td>전화번호</td>
                            </tr>
                            <tr>
                                <td>
                <span><img
                        src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${data.photo}?type=f&w=160&h=160&faceopt=true"></span>
                                    <span>${data.name}</span>
                                </td>
                                <td>
                                    <span>${data.addr}</span>
                                </td>
                                <td>
                                    <span>${data.phone}</span>
                                </td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td colspan="6"><span>객실 정보</span></td>
                            </tr>
                            <tr>
                                <td>객실 타입</td>
                                <td>체크 인</td>
                                <td>체크 아웃</td>
                                <td>인원 수</td>
                                <td>요청 사항</td>
                                <td>이용 요금</td>
                            </tr>
                            <tr>
                                <td>${data.roomtype}</td>
                                <td>${data.checkin}</td>
                                <td>${data.checkout}</td>
                                <td>성인: ${data.adult}, 어린이: ${data.kids} </td>
                                <td>${data.memo}</td>
                                <td>${data.total_price}</td>
                            </tr>

                        </table>
                    </div>
                </c:otherwise>
            </c:choose>

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