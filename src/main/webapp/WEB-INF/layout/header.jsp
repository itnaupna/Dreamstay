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

    /*호텔 로고 이미지 (white)*/
    .white_logo{
        /* background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/bg_logo_shinsegae.png) no-repeat 0 0;*/
        background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel_logo_w.png) no-repeat 0 0 ;
        z-index: 9999;
        margin-top: 5px;


    }

    /*호텔 로고 이미지 (black)*/
    .black_logo {

        /*background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/bg_logo_shinsegae.png) no-repeat 0 0;*/
        background: url(https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel_logo_b.png) no-repeat 0 0;
        z-index: 9999;
        margin-top: 5px;
        /*background-position: 0 -60px;*/

    }



    /* ****로고 위치***** */

    .header .logo a {
        display: block; /* 새로운 라인(line)에서 시작, 시작 라인 width 100% 적용됨*/
        width: 350px;
        height: 24px;
    }

    .header .logo{
        display: block;
        position: absolute;
        right: 40%;
        top: 25px;
        z-index: 1;
        width: 400px;
        margin-top: 5px;
        height: 60px;
        text-indent: -9999px;
        overflow: hidden;

    }




/*    .header .hotelFind:after {
        content: '';
        display: inline-block; !* 줄바꿈X(요소 자체는 인라인요소), 내부에서는 블록 요소처럼 동작 *!
        margin-left: 2px;
        position: absolute;
        left: 56px;
        top: 10px;
        width: 11px;
        height: 11px;
    }*/

  /*  !*상품 찾기 돋보기 (black)*!
    .black_find:after{
        background: url(
        https://www.josunhotel.com/static/home/images/ko/pc/common/ico_search_black_11x11.png) no-repeat 0 0;
    }


    !*상품 찾기 돋보기 (white)*!
    .white_find:after{
        background: url(
        https://kr.object.ncloudstorage.com/dreamsstaybucket/ico_search_white.png) no-repeat 0 0;
    }
*/
    .header_hotel_list {
        cursor: pointer;
    }


</style>
<!--EONG-->
<script type="text/javascript">
    $('body').on('scroll touchmove mousewheel', function(event) {
        event.preventDefault();
        event.stopPropagation();
        return false;
    });
</script>

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
                                <a href="/qnaboard"><li>문의하기</li></a>
                                <a href="/qnanomemberlist"><li>비회원 문의조회</li></a>
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
                            <a href="/mypage/" id="confirmReserve2">예약확인</a>
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




