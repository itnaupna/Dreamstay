<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<link rel="stylesheet" href="/css/mypage/header2.css" />--%>
<script src="/js/header.js"> </script>
<%--<script src="/js/header.js"> </script>--%>

<style>
    .btnMenuText {
        position: absolute;
        top: 100px;
        margin-left: 250px;
    }
    /*닫기 버튼 이미지 */
    .btnMenulist>img{
        position: absolute;
        top: 30px;
        left: 1700px;
        width: 35px;
        height: 35px;
        cursor: pointer;
    }

    /*3줄 메뉴 클릭시 나오는 박스에 타이틀*/
    .btnMenuText .header_btntitle{
        font-weight: bold;
        display: flex;
    }


    .header .btntitlebox span {
        color: #989442;
        font-size: 17px;
        margin-right: 120px;
        margin-bottom: 80px;

    }

    .header .btntitlebox li {
        margin-bottom: 30px;
        font-weight: bold;
        font-size: 18px;
        color: white !important;
    }

    .header .btntitlebox img {
        width: 180px;
        height: 140px;
    }


    .btnMenulist{
        position: absolute;
    }


    .header .hotelFind:after {
        content: '';
        display: inline-block; /* 줄바꿈X(요소 자체는 인라인요소), 내부에서는 블록 요소처럼 동작 */
        margin-left: 2px;
        position: absolute;
        left: 56px;
        top: 10px;
        width: 11px;
        height: 11px;
        background: url(
        https://www.josunhotel.com/static/home/images/ko/pc/common/ico_search_black_11x11.png) no-repeat 0 0;
    }


    /*태그 밑줄 제거*/
    .header a {
        /* color: inherit; /* 상속된 부모 요소의 텍스트 색상을 현재 요소에 적용하는 CSS*/
        text-decoration: none;
        box-sizing: border-box;
        /* padding과 border의 크기도 포함하여 요소의 크기를 계산,  크기를 미리 예측하고 조절 (큰차이는 모르겠음) */
    }

    /*커서*/
    .header a, .header button{
        cursor: pointer;
    }

    .header ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .header button {
        box-sizing: border-box;
        background: none;
    }



    /* ****조선호텔 로고***** */

    .header .logo a {
        display: block; /* 새로운 라인(line)에서 시작, 시작 라인 width 100% 적용됨*/
        width: 350px;
        height: 24px;
    }

    /* 전체 header div, 고정, 배경색 하얗게*/
    .header {
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        z-index: 100;
        height: 100px;
        color: #000;
        background: #fff;

    }


    .header li a{
        color: #000;
    }

    .header li a:hover{
        color: #000;
    }

    .header .headArea {
        position: relative;
        padding: 0 50px;
        height: 100px;
    }


    .header .wrapper {
        min-height: 100%;
        position: relative;
        padding-bottom: 0px;
        min-width: 1500px;
        overflow-x: auto;
    }


    .header .logo{
        display: block;
        display: block;
        position: absolute;
        right: 41%;
        top: 23px;
        z-index: 1;
        width: 350px;
        height: 60px;
        text-indent: -9999px; /* 요소에 텍스트 안보이도록 (조선 호텔 홈페이지에서 요소에 어떤 기능인지 텍스트로 써놓은게 있어서  주석용으로 화면엔 안보이게 텍스트를 밖으로 내보냄)*/
        overflow: hidden; /* 텍스트가 이미지 또는 요소 경계 상자 외부로 나가는 것을 방지 */
        background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/bg_logo_shinsegae.png) no-repeat 0 0;
        background-position: 0 -60px;
    }


    .header ul:after {
        content: '';
        display: block;
        clear: both;
    }

    /*상품찾기 전체 div 위치*/
    .topUtil {
        position: absolute;
        left: 110px;
        top: 38px;
    }

    /* 상품찾기 */
    .topUtil .hotelFind {
        font-size: 11px;
        color: #000;
    }

    /*회원가입,로그인*,예약확인 div 위치*/
    .gnbUtil {
        position: absolute;
        right: 50px;
        top: 30px;
    }

    .gnbUtil > ul {
        display: inline-block;
        vertical-align: middle;
        margin-top: -6px;
    }

    .gnbUtil > ul > li:first-child {
        margin-left: 0;
    }

    .gnbUtil > ul > li {
        display: inline-block;
        vertical-align: middle;
        margin-left: 20px;
        font-size: 14px;
    }


    .gnbUtil > .resvBtn {
        display: inline-block;
        margin-left: 25px;
        margin-right: 15px;
    }

    .gnbUtil > .resvBtn .dropdown_list {
        display: inline-block;
        min-width: auto;
        width: 100px;
        position: relative;
        right: auto;
        top: auto;
        z-index: 1;
    }

    /* 3줄 메뉴 */
    .header .btnMenu {
        display: block;
        position: absolute;
        left: 50px;
        top: 30px;
        z-index: 1;
        text-indent: -9999px;
        overflow: hidden;
        width: 35px;
        height: 35px;
        margin: 0 auto; /*  수평 방향으로 가운데로 정렬 */
        transition: .5s; /* 0.5초 동안 애니메이션 부드럽게 */
        border: none; /*테두리 박스 없애기*/
        background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/btn_menu.png) no-repeat -35px 0 !important;
        background-position: -35px 0 !important;
    }


    .btnMenulist{
        display: none;
        position: absolute;
        top: 100px;
        background-color: black;
        width: 100%;
        height: 900px;
        left: 0;
    }


    .header .dropdown_list.open .item_list {
        display: block;
        /*  .dropdown_list 클래스가 open 클래스를 포함하고 있는 경우, 그 하위 요소인 .item_list 클래스를 블록 레벨 요소로 표시 */
        /* 자바스크립트로 toggle open 효과 줬음 지우면 list 안보임*/
    }

    .header .dropdown_list .item_list {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 1;
        list-style: none;
        padding: 0;
        margin: 0;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

    }

    .header .dropdown_list .item_list li a {
        display: block;
        padding: 10px;
        text-decoration: none;
    }

    /*resurve 버튼css*/
    .btn_opener{
        padding: 8px;
        width: 120px;
        font-size: 13px;
        border: 1px solid #000;
        color: #000;

    }





</style>



<body>
<div class="wrappe mainWrapper">
    <div class="header">
        <div class="headArea">
            <strong class="logo">
                <a href="/">JOSUN HOTELS & RESORTS
                </a>
            </strong>
            <button type="button" class="btnMenu">메뉴 열기</button>
            <div class="btnMenulist">
                <img class="btnMenuClose" src="https://www.josunhotel.com/static/home/images/ko/pc/common/btn_close_white_25x25.png">

                <div class="btnMenuText">
                    <div class="header_btntitle">
                        <div class="btntitlebox">
                        <span>ABOUT US</span><br><br>
                            <ul>
                                <li>JOSUN HOTELS & <br>RESORTS</li>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>

                            </ul>

                        </div>

                        <div class="btntitlebox">
                            <span>HOTELS</span><br><br>
                            <ul>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>OFFERS</span><br><br>
                            <ul>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>MEMBERSHIP</span><br><br>
                            <ul>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>
                            </ul>
                        </div>

                        <div class="btntitlebox" >
                            <span>MY PAGE</span><br><br>
                            <ul>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>RETAIL BUSINESS</span><br><br>
                            <ul>
                                <li>기업소개</li>
                                <li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>JOSUN LOUNGE</span><br><br>
                            <ul>
                                <a>
                                <li>
                                    <img src="https://www.josunhotel.com/util/file/download.do?fileSn=1539858&sysCode=JOSUNHOTEL">
                                    <h6 style="margin-top: 10px;"> Hotel Dining</h6>
                                </li>

                               </a>

                                <a>
                                    <li>
                                        <img src="https://www.josunhotel.com/util/file/download.do?fileSn=1539878&sysCode=JOSUNHOTEL">
                                        <h6 style="margin-top: 10px;"> Hotel Dining</h6>
                                    </li>
                                </a>

                                <a>
                                    <li>
                                        <img src="https://www.josunhotel.com/util/file/download.do?fileSn=1539893&sysCode=JOSUNHOTEL">
                                        <h6 style="margin-top: 10px;"> Hotel Dining</h6>
                                    </li>
                                </a>

                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <div class="topUtil">
                <a href="" class="hotelFind" style="font-size: 14px;">
                    상품찾기
                </a>
            </div>

            <div class="gnbUtil" >
                <ul>
                    <c:if test="${userid != null}">
                        <li>
                            <a href="/signup/logout" id="header_logout">로그아웃</a>
                        </li>
                        <li>
                            <a href="/mypage/" id="header_mypage">마이페이지</a>
                        </li>
                    </c:if>
                    <c:if test="${userid == null}">
                        <li>
                            <a href="/signup/login" id="login">로그인</a>
                        </li>
                        <li>
                            <a href="/signup/signup" id="join">회원가입</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="" id="confirmReserve">예약확인</a>
                    </li>
                </ul>


                <div class="resvBtn">
                    <div class="dropdown_list" aria-expanded="false">
                        <div class="dropdown_value" style="font-size: 11px;">
                            <button type="button" aria-label="목록열기" class="btn_opener">RESERVATION</button>
                        </div>
                        <ul class="item_list" role="listbox" style="width: 120px;">
                            <li role="option" style="font-size: 13px"><a href="">ROOM</a></li>
                            <li role="option" style="font-size: 13px"><a href="">MEMBERSHIP</a></li>
                        </ul>
                    </div>
                </div>

            </div> <%--headArea END--%>

        </div> <%--head END--%>

    </div> <%--wrapper mainWrapper END--%>

</body>
