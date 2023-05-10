<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 다음 맵 주소 입력 코드 Key -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
    }

    #signup_main {
        border: 1px solid sienna; /*영역*/
        font-family: 'Noto Sans KR', sans-serif;
        margin: 180px auto 0 auto;
        width: 1000px;
        height: 1000px;
    }

    #signup_titlebox {
        border: 1px solid orange; /*영역*/
    }

    #signup_namebox{
        border: 1px solid red; /*영역*/
    }

    #signup_idbox {
        border: 1px solid blue; /*영역*/
    }

    #signup_pwbox {
        border: 1px solid deeppink; /*영역*/
    }

    #signup_pwform {
        border: 1px solid magenta; /*영역*/
    }

    #signup_pwchk {
        border: 1px solid brown; /*영역*/
    }

    #signup_email_send {
        border: 1px solid cornflowerblue; /*영역*/
    }

    #signup_full_email {
        display: flex;
        justify-content: center;
    }

    #join_domain {
        width: 200px;
        height: 50px;
        line-height: 50px;
        text-align: left;
        border-bottom: 1px solid black;
        margin: 0 30px 0 30px;
        background: #ffffff url("/photo/arrow_196221.png") no-repeat;
        background-size: 10px 10px;
        background-position: 96% center;
        overflow: hidden;
        cursor: pointer;
    }

    #signup_custom_option {
        width: 200px;
        height: 150px;
        list-style-type: none;
        overflow-x: hidden;
        overflow-y: scroll;
        position: relative;
        display: none;
        left: 30px;
        text-align: left;
        padding-left: 0;
        border: 1px solid black;
        border-top: none;
    }

    #signup_custom_option li {
        height: 50px;
        line-height: 50px;
        padding-left: 10px;
    }

    #signup_custom_option li:hover {
        background-color: #eeeeee;
    }

    #signup_email_codechk {
        border: 1px solid green; /*영역*/
    }

    #signup_phonebox {
        border: 1px solid purple; /*영역*/
    }

    #signup_addressbox {
        border: 1px solid gray; /*영역*/
    }

    #signup_searchaddr {
        border: 1px solid gold; /*영역*/
    }

    #signup_btnbox {
        border: 1px solid olive; /*영역*/
    }

    .signup_title {
        display: block;
        font-weight: bold;
    }

    .signup_notice {
        display: block;
    }
</style>

<div id="signup_main">
    <form method="post" action="/signup/joinmember" id="join_form">

        <div id="signup_titlebox">
            <span class="signup_title">회원가입</span>
        </div>

        <div id="signup_namebox">
            <span class="signup_title">NAME *</span>
            <input type="text" id="family_name" name="family_name" placeholder="Family Name(성)">
            <input type="text" id="user_name" name="user_name" placeholder="First Name(이름)"/>
            <span class="signup_notice" id="join_null_check_name"></span>
        </div>

        <div id="signup_idbox">
            <span class="signup_title">ID *</span>
            <input type="text" name="id" id="id" placeholder="아이디는 5자리 이상 15이하로 사용가능합니다">
            <button type="button" id="id_check" name="id_check">중복확인</button>
            <span class="signup_notice" id="join_idchk"></span>
        </div>

        <div id="signup_pwbox">
            <div id="signup_pwform">
                <span class="signup_title">PASSWORD *</span>
                <input type="password" name="pw" id="pw" placeholder="비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다">
                <span class="signup_notice" id="pwform"></span>
            </div>
            <div id="signup_pwchk">
            <span class="signup_title">CONFIRM PASSWORD *</span>
            <input type="password" id="pwchk" placeholder="비밀번호 확인">
            <span class="signup_notice" id="successpwCheck"></span>
            </div>
        </div>

        <div id="signup_email_send">
            <span class="signup_title">E-MAIL *</span>
            <div id="signup_full_email">
                <input type="text" name="email" id="email">
                <span id="at">@</span>
                <input tpye="text" name="email_domain" id="email_domain">
                <div>
                    <div name="join_domain" id="join_domain">직접 입력</div>
                    <ul id="signup_custom_option">
                        <li class="signup_select_option">직접 입력</li>
                        <li class="signup_select_option">naver.com</li>
                        <li class="signup_select_option">gmail.com</li>
                        <li class="signup_select_option">hanmail.net</li>
                        <li class="signup_select_option">hotmail.com</li>
                        <li class="signup_select_option">nate.com</li>
                    </ul>
                </div>
                <button type="button" id="SendEmailBtn">인증번호 받기</button>
            </div>
        </div>

        <div id="signup_email_codechk">
            <span class="signup_title">인증번호</span>
            <input type="text" name="email_code" id="email_code" placeholder="인증번호를 입력해주세요">
            <span id="timer"></span>
            <button type="button" id="CheckEmailBtn">인증번호 확인</button>
            <span class="signup_notice" id="join_code_chk"></span>
        </div>

        <div id="signup_phonebox">
            <span class="signup_title">PHONE *</span>
            <input type="text" id="phone" name="phone"/>
            <span class="signup_notice" id="join_null_check_phonenum"></span>
        </div>

        <div id="signup_addressbox">
            <div id="signup_searchaddr">
                <span class="signup_title">ADDRESS *</span>
                <input type="text" id="zipcode" name="zipcode">
                <button type="button" id="search_addr">우편번호 검색</button>
            </div>

            <input type="text" id="addr" name="addr"/>

            <input type="text" name="addrdetail" id="addrdetail" placeholder="상세주소를 입력해주세요"/>
            <span class="signup_notice" id="join_null_check_addr"></span>
        </div>

        <div id="signup_btnbox">
            <button type="button" id="signup_back">취소</button>
            <button type="button" id="signupBtn" >회원가입</button>
        </div>

    </form>
</div>
<script type="text/javascript" src="/js/member/join.js"></script>




