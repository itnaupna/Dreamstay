<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 다음 맵 주소 입력 코드 Key -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/member/join.css"/>

<div id="signup_main">
    <form method="post" action="/signup/joinmember" id="join_form">

        <div id="signup_titlebox">
            <span class="signup_title">회원가입</span>
        </div>
        <hr>

        <div class="signup_subbox" id="signup_namebox">
            <span class="signup_title signup_subtitle">NAME *</span>
            <input type="text" id="family_name" class="signup_input" name="family_name" placeholder="Family Name(성)">
            <input type="text" id="user_name" class="signup_input" name="user_name" placeholder="First Name(이름)"/>
            <span class="signup_notice" id="join_null_check_name"></span>
        </div>
        <hr>

        <div class="signup_subbox" id="signup_idbox">
            <span class="signup_title signup_subtitle">ID *</span>
            <input type="text" class="signup_input" name="id" id="id" placeholder="아이디는 5자리 이상 15이하로 사용가능합니다">
            <button type="button" class="signup_btn" id="id_check" name="id_check">중복확인</button>
            <span class="signup_notice" id="join_idchk"></span>
        </div>
        <hr>

        <div id="signup_pwbox">
            <div class="signup_subbox" id="signup_pwform">
                <span class="signup_title signup_subtitle">PASSWORD *</span>
                <input type="password" class="signup_input" name="pw" id="pw" placeholder="특수문자, 문자, 숫자 포함 8 ~ 15 자리 형태로 사용 가능합니다">
                <span class="signup_notice" id="pwform"></span>
            </div>
            <div class="signup_subbox" id="signup_pwchk">
            <span class="signup_title signup_subtitle">CONFIRM PASSWORD *</span>
            <input type="password" class="signup_input" id="pwchk" placeholder="비밀번호 확인">
            <span class="signup_notice" id="successpwCheck"></span>
            </div>
        </div>
        <hr>

        <div class="signup_subbox" id="signup_email_send">
            <span class="signup_title signup_subtitle">E-MAIL *</span>
            <div id="signup_full_email">
                <input type="text" class="signup_input" name="email" id="email">
                <span id="at">@</span>
                <input tpye="text" class="signup_input" name="email_domain" id="email_domain">
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
                <button type="button" class="signup_btn" id="SendEmailBtn">인증번호 받기</button>
            </div>
        </div>

        <div class="signup_subbox" id="signup_email_codechk">
            <input type="text" class="signup_input" name="email_code" id="email_code" placeholder="인증번호를 입력해주세요">
            <span id="timer"></span>
            <button type="button" class="signup_btn" id="CheckEmailBtn">인증번호 확인</button>
            <span class="signup_notice" id="join_code_chk"></span>
        </div>
        <hr>


        <div class="signup_subbox" id="signup_phonebox">
            <span class="signup_title signup_subtitle">PHONE *</span>
            <input type="text" class="signup_input" id="phone" name="phone" placeholder="숫자만 입력해주세요"/>
            <span class="signup_notice" id="join_null_check_phonenum"></span>
        </div>
        <hr>

        <div id="signup_fulladdrbox">
            <div class="signup_subbox" id="signup_searchaddr">
                <span class="signup_title signup_subtitle">ADDRESS *</span>
                <input type="text" class="signup_input" id="zipcode" name="zipcode">
                <button type="button" class="signup_btn" id="search_addr">우편번호 검색</button>
            </div>
            <div class="signup_subbox" id="signup_addrbox">
                <input type="text" class="signup_input" id="addr" name="addr"/>
                <input type="text" class="signup_input" name="addrdetail" id="addrdetail" placeholder="상세주소를 입력해주세요"/>
                <span class="signup_notice" id="join_null_check_addr"></span>
            </div>
        </div>
        <hr>

        <div class="signup_subbox" id="signup_btnbox">
            <button type="button" class="signup_btn" id="signup_back">취소</button>
            <button type="button" class="signup_btn" id="signupBtn" >회원가입</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="/js/member/join.js"></script>




