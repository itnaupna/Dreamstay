<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--<style>--%>
<%--    .bi-list-nested{--%>
<%--        font-size: 32px;--%>
<%--    }--%>

<%--    a {--%>
<%--        color: inherit;--%>
<%--        text-decoration: none;--%>

<%--    }--%>

<%--    a, button{--%>
<%--        cursor: pointer;--%>
<%--    }--%>

<%--    .header .logo a {--%>
<%--        display: block;--%>
<%--        width: 350px;--%>
<%--        height: 24px;--%>
<%--    }--%>

<%--    .header .hotelFind:after {--%>
<%--        content: '';--%>
<%--        display: inline-block;--%>
<%--        margin-left: 2px;--%>
<%--        width: 11px;--%>
<%--        height: 11px;--%>
<%--        background: url(--%>
<%--        https://www.josunhotel.com/static/home/images/ko/pc/common/ico_search_black_11x11.png) no-repeat 0 0;--%>
<%--    }--%>


<%--    .header .logo {--%>
<%--        display: block;--%>
<%--        position: absolute;--%>
<%--        left: 840px;--%>
<%--        top: 37px;--%>
<%--        z-index: 1;--%>
<%--        text-indent: -9999px;--%>
<%--        overflow: hidden;--%>
<%--        width: 350px;--%>
<%--        height: 24px;--%>
<%--        background: url(https://www.josunhotel.com/static/home/images/ko/pc/common/bg_logo_shinsegae02.png) no-repeat 0 0;--%>
<%--    }--%>

<%--    .header .btnMenu {--%>
<%--        display: block;--%>
<%--        position: absolute;--%>
<%--        left: 50px;--%>
<%--        top: 30px;--%>
<%--        z-index: 1;--%>
<%--        text-indent: -9999px;--%>
<%--        overflow: hidden;--%>
<%--        width: 35px;--%>
<%--        height: 35px;--%>
<%--        margin: 0 auto;--%>
<%--        background: url(https://www.josunhotel.com/static/home/images/ko/pc/common/btn_menu.png) no-repeat -35px 0;--%>
<%--        transition: .5s;--%>
<%--        border: none; /*테두리 박스 없애기*/--%>
<%--    }--%>

<%--    .topUtil .hotelFind {--%>
<%--        font-size: 15px;--%>
<%--        color: #000;--%>
<%--    }--%>
<%--    a, button {--%>
<%--        cursor: pointer;--%>
<%--    }--%>
<%--    a {--%>
<%--        box-sizing: border-box;--%>
<%--    }--%>

<%--    .topUtil .hotelFind:after {--%>
<%--        content: '';--%>
<%--        display: inline-block;--%>
<%--        margin-left: 2px;--%>
<%--        width: 20px;--%>
<%--        height: 20px;--%>
<%--        background: url(https://www.josunhotel.com/static/home/images/ko/pc/common/ico_search_black_11x11.png) no-repeat 0 0;--%>
<%--    }--%>

<%--    .topUtil {--%>
<%--        position: absolute;--%>
<%--        left: 110px;--%>
<%--        top: 30px;--%>
<%--    }--%>

<%--    div {--%>
<%--        display: block;--%>
<%--    }--%>

<%--    body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, form, fieldset, legend, input, textarea, button, select, div {--%>
<%--        margin: 0;--%>
<%--        padding: 0;--%>
<%--        box-sizing: border-box;--%>
<%--        word-break: keep-all;--%>
<%--        word-wrap: break-word;--%>
<%--    }--%>

<%--    .gnbUtil {--%>
<%--        position: absolute;--%>
<%--        right: 50px;--%>
<%--        top: 30px;--%>
<%--    }--%>

<%--    div {--%>
<%--        display: block;--%>
<%--    }--%>

<%--    ul:after {--%>
<%--        content: '';--%>
<%--        display: block;--%>
<%--        clear: both;--%>
<%--    }--%>

<%--    ul {--%>
<%--        margin: 0;--%>
<%--        padding: 0;--%>
<%--        list-style: none;--%>
<%--    }--%>


<%--    .gnbUtil {--%>
<%--        position: absolute;--%>
<%--        right: 50px;--%>
<%--        top: 30px;--%>
<%--    }--%>

<%--    .gnbUtil > ul {--%>
<%--        display: inline-block;--%>
<%--        vertical-align: middle;--%>
<%--        margin-top: -6px;--%>
<%--    }--%>

<%--    .gnbUtil > ul > li:first-child {--%>
<%--        margin-left: 0;--%>
<%--    }--%>

<%--    .gnbUtil > ul > li {--%>
<%--        display: inline-block;--%>
<%--        vertical-align: middle;--%>
<%--        margin-left: 20px;--%>
<%--        font-size: 15px;--%>
<%--    }--%>

<%--    .gnbUtil > .resvBtn {--%>
<%--        display: inline-block;--%>
<%--        margin-left: 35px;--%>
<%--    }--%>

<%--    .gnbUtil > .resvBtn .dropdown_list {--%>
<%--        display: inline-block;--%>
<%--        min-width: auto;--%>
<%--        width: 145px;--%>
<%--        position: relative;--%>
<%--        right: auto;--%>
<%--        top: auto;--%>
<%--        z-index: 1;--%>
<%--    }--%>

<%--    .dropdown_list {--%>
<%--        display: inline-block;--%>
<%--        min-width: 230px;--%>
<%--        position: absolute;--%>
<%--        right: 0;--%>
<%--        top: 140px;--%>
<%--        z-index: 999;--%>
<%--    }--%>


<%--    .dropdown_list {--%>
<%--        display: inline-block;--%>
<%--        min-width: 230px;--%>
<%--        position: absolute;--%>
<%--        right: 0;--%>
<%--        top: 140px;--%>
<%--        z-index: 999;--%>
<%--    }--%>

<%--    .dropdown_list .dropdown_value {--%>
<%--        position: relative;--%>
<%--    }--%>

<%--    ul:after {--%>
<%--        content: '';--%>
<%--        display: block;--%>
<%--        clear: both;--%>
<%--    }--%>

<%--    .dropdown_value ul{--%>
<%--        padding: 5px;--%>
<%--        border: 1px solid black;--%>
<%--        width: 120px;--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    .dropdown_value ul>li{--%>
<%--        font-size: 15px;--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    .contents01 {--%>
<%--        top: 0px;--%>

<%--    }--%>

<%--    .mainBg img {--%>
<%--        position: absolute;--%>
<%--        top: 50%;--%>
<%--        left: 50%;--%>
<%--        min-width: 100%;--%>
<%--        min-height: 100%;--%>
<%--        transform: translate(-50%, -50%);--%>
<%--    }--%>

<%--    body > .wrapper {--%>
<%--        height: auto;--%>
<%--        min-height: 100%;--%>
<%--    }--%>

<%--    .wrapper {--%>
<%--        min-height: 100%;--%>
<%--        position: relative;--%>
<%--        padding-bottom: 900px;--%>
<%--        min-width: 1500px;--%>
<%--        overflow-x: auto;--%>
<%--    }--%>

<%--    .header {--%>
<%--        position: fixed;--%>
<%--        left: 0;--%>
<%--        right: 0;--%>
<%--        top: 0;--%>
<%--        z-index: 100;--%>
<%--        height: 100px;--%>
<%--        background: #fff;--%>
<%--    }--%>






<%--</style>--%>

<%--<body>--%>
<%--<div class="wrapper mainWrapper">--%>
<%--    <div class="header">--%>
<%--        <div class="headArea">--%>
<%--            <strong class="logo">--%>
<%--                <a href="">JOSUN HOTELS & RESORTS--%>
<%--                </a>--%>
<%--            </strong>--%>
<%--            <button type="button" class="btnMenu">메뉴 열기</button>--%>
<%--            <div class="topUtil">--%>
<%--                <a href="" class="hotelFind" style="font-size: 15px;">--%>
<%--                    상품찾기--%>
<%--                </a>--%>
<%--            </div>--%>

<%--            <div class="gnbUtil" >--%>
<%--                <ul>--%>
<%--                    <li>--%>
<%--                        <a href="" id="login">로그인</a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="" id="join">회원가입</a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="" id="confirmReserve">예약확인</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>


<%--                <div class="resvBtn">--%>
<%--                    <div class="dropdown_list" aria-expanded="false">--%>
<%--                        <div class="dropdown_value">--%>
<%--                            &lt;%&ndash;                    <input type="text" role="combobox" value="RESERVATION" aria-expanded="false" tabindex="-1" readonly>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                    <button type="button" aria-label="목록열기" class="btn_opener">RESERVATION</button>&ndash;%&gt;--%>
<%--                            <ul>--%>
<%--                                <li>RESERVATION</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        &lt;%&ndash;            <ul class="item_list" role="listbox">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                <li role="option">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                    <a href="" id="roomSearch">Room</a>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                </li>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                <li role="option">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                    <a href="">MEMBERSHIP</a>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                </li>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            </ul>&ndash;%&gt;--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div> &lt;%&ndash;headArea END&ndash;%&gt;--%>

<%--    </div> &lt;%&ndash;head END&ndash;%&gt;--%>

<%--</div>--%>

<%--</body>--%>