<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Playfair+Display&family=Playfair+Display+SC&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Playfair+Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%--font-family: 'Nanum Myeongjo', serif     font-family: 'Playfair Display SC', serif;;--%>
<link rel="stylesheet" href="/css/member/login.css"/>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<div id="login_main">
    <div id="login_title">
        <span id="login_maintitle">LOGIN</span>
        <span id="login_subtitle">머무는 모든 순간이 특별해집니다.</span>
    </div>
    <div id="login_select_barbox">
        <ul id="login_select_bar">
            <li class="login_select" id="login_login_select">아이디 로그인</li><li class="login_select" id="login_nomember_select">비회원 예약확인</li>
        </ul>
    </div>
    <div id="login_login_subject">
        <div id="login_member_login">
            <input type="text" name="id" class="login_input" id="login_id" placeholder="아이디">

            <input type="password" name="pw" class="login_input" id="login_pw" placeholder="비밀번호">

            <label>
                <input type="checkbox" name="saveid" id="login_saveid">아이디 저장
            </label>
            <button type="button" id="access">로그인</button>

            <span class="login_subtext">회원이 되시면 더 많은 혜택이 있습니다.</span>
            <hr>
            <a href="/signup/signup" id="login_joinlink">회원가입</a>
            <a href="/signup/findidpw">아이디/비밀번호찾기/계정활성화</a>
        </div>
        <div id="login_social_login">
            <button type="button" id="kakao_login">카카오톡 로그인</button>
            <button type="button" id="naver_loginbox">
                <div id="naver_loginwrap">
                    <div id="naver_id_login"></div>
                    <span id="naver_logintext">네이버 로그인</span>
                </div>
            </button>
        </div>
    </div>
    <div id="login_reservation">
        <form action="/book/nomemberbooksearch" method="post" id="search_nomember_book">
            <div id="nomembersearchbox">
                <input type="text" class="login_input login_booksearch_input" name="searchnum" id="login_book_searchnum" placeholder="예약 번호">
                <input type="text" class="login_input login_booksearch_input" name="bookpw" id="login_book_pw" placeholder="예약 비밀번호">
                <button type="button" id="booksearch">비회원 예약 확인</button>
                <span class="login_subtext">회원이 되시면 더 많은 혜택이 있습니다.</span>
            </div>
        </form>
    </div>
    <hr>
    <div id="login_bottom_textbox">
        <ul id="login_bottom_text">
            <li>이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다</li>
            <li>오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다.</li>
            <li>유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다.</li>
        </ul>
    </div>
</div>


<script type="text/javascript" src="/js/member/login.js"></script>
