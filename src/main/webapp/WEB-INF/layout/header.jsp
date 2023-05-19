<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/header.css" />
<script src="/js/header.js"> </script>

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
        z-index: 9999;
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
    }

    /*상품 찾기 돋보기 (black)*/
    .black_find:after{
        background: url(
        https://www.josunhotel.com/static/home/images/ko/pc/common/ico_search_black_11x11.png) no-repeat 0 0;
    }


    /*상품 찾기 돋보기 (white)*/
    .white_find:after{
        background: url(
        https://kr.object.ncloudstorage.com/dreamsstaybucket/ico_search_white.png) no-repeat 0 0;
    }

    .header_hotel_list {
        cursor: pointer;
    }



</style>
<!--EONG-->

<div class="wrapper mainWrapper">
    <div class="header">
        <div class="headArea">
            <a href="/">
                <strong class="logo">
                    JOSUN HOTELS & RESORTS
                </strong>
            </a>
            <%--            <button type="button" class="btnMenu">메뉴 열기</button>--%>
            <button type="button" id="header_menu" class="btnMenu">메뉴 열기</button>
            <div class="btnMenulist">
                <img class="btnMenuClose" src="https://www.josunhotel.com/static/home/images/ko/pc/common/btn_close_white_25x25.png">

                <div class="btnMenuText">
                    <div class="header_btntitle">
                        <div class="btntitlebox">
                            <span>ABOUT US</span><br><br>
                            <ul>
                                <li id="header_notice_board">공지사항</li>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>HOTELS</span><br><br>
                            <ul id="hotel_list">
                            </ul>
                        </div>



                        <div class="btntitlebox" >
                            <span>MY PAGE</span><br><br>
                            <ul>
                                <a href="/mypage/"><li>마이페이지</li></a>

                                <a href="/mypage/updateinfo"><li>개인정보 관리</li></a>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>MEMBERSHIP</span><br><br>
                            <ul>
                                <a href="/mypage/membership"><li>멤버십 안내</li></a>
                                <%--<li>연혁</li>
                                <li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>--%>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>4페이지 내용 넣을 거에요</span><br><br>
                            <ul>
                                <a href="#"><li>4페이지 링크 1</li></a>
                                <a href="#"><li>4페이지 링크 2</li></a>
                                <a href="#"><li>4페이지 링크 3</li></a>
                                <a href="#"><li>4페이지 링크 4</li></a>
                                <a href="#"><li>4페이지 링크 5</li></a>
                                <a href="#"><li>4페이지 링크 6</li></a>
                                <a href="#"><li>4페이지 링크 7</li></a>
                                <a href="#"><li>4페이지 링크 8</li></a>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>INQUIRY</span><br><br>
                            <ul>
                                <a href="/qnaboard"><li>문의하기</li></a>
                                <a href="/qnanomemberlist"><li>비회원 문의조회</li></a>
                                <%--<li>수상내역</li>
                                <li>ESG경영</li>
                                <li>결산공고</li>--%>
                            </ul>
                        </div>

                        <div class="btntitlebox">
                            <span>JOSUN LOUNGE</span><br><br>
                            <ul>
                                <a href="https://lounge.josunhotel.com/04/aisle-of-dreams/?_gl=1*24rldw*_ga*MjM4ODI1OTYwLjE2ODI5MzE2NjU.*_ga_TRL4XSZ1TD*MTY4NDQ4MDAyMS41Ny4wLjE2ODQ0ODEwMTIuNjAuMC4w*_ga_ZTT88NNQSY*MTY4NDQ4MDAyMS41LjAuMTY4NDQ4MDkxNy42MC4wLjA.">
                                    <li>
                                        <img src="https://www.josunhotel.com/util/file/download.do?fileSn=1539868&sysCode=JOSUNHOTEL">
                                        <h6 style="margin-top: 10px;"> Hotel Dining</h6>
                                    </li>

                                </a>

                                <a href="https://lounge.josunhotel.com/04/joyful-josun-junior/?_gl=1*16v6ku7*_ga*MjM4ODI1OTYwLjE2ODI5MzE2NjU.*_ga_TRL4XSZ1TD*MTY4NDQ4MDAyMS41Ny4xLjE2ODQ0ODEwMjAuNTIuMC4w*_ga_ZTT88NNQSY*MTY4NDQ4MDAyMS41LjEuMTY4NDQ4MTAyMC42MC4wLjA.">
                                    <li>
                                        <img src="https://www.josunhotel.com/util/file/download.do?fileSn=1539878&sysCode=JOSUNHOTEL">
                                        <h6 style="margin-top: 10px;"> Hotel Dining</h6>
                                    </li>
                                </a>

                                <a href="https://lounge.josunhotel.com/04/gift-on-demand/?_gl=1*1bkfmjv*_ga*MjM4ODI1OTYwLjE2ODI5MzE2NjU.*_ga_TRL4XSZ1TD*MTY4NDQ4MDAyMS41Ny4xLjE2ODQ0ODEyNzguNTguMC4w*_ga_ZTT88NNQSY*MTY4NDQ4MDAyMS41LjEuMTY4NDQ4MTI3OC41OC4wLjA.">
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
                <ul>
                    <li>
                        <a href="/notice/noticeboard" class="hotelFind" style="font-size: 14px;">
                            공지사항
                        </a>
                    </li>
                </ul>
            </div>

            <div class="gnbUtil" >
                <ul>
                    <c:if test="${loginuser != null}">
                        <li>
                            <a href="/signup/logout" id="header_logout">로그아웃</a>
                        </li>
                        <li>
                            <a href="/mypage/" id="header_mypage">마이페이지</a>
                        </li>
                        <li>
                            <a href="/mypage/" id="confirmReserve">예약확인</a>
                        </li>
                        <c:if test="${loginuser.user_level>=10}">
                            <li>
                                <a href="/admin" id="header_admin"><b>관리 대시보드</b></a>
                            </li>
                        </c:if>
                    </c:if>
                    <c:if test="${loginuser == null}">
                        <li>
                            <a href="/signup/login" id="login">로그인</a>
                        </li>
                        <li>
                            <a href="/signup/signup" id="join">회원가입</a>
                        </li>
                        <li>
                            <a href="/signup/login" id="confirmReserve">예약확인</a>
                        </li>
                    </c:if>
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




