<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/member/findidpw.css"/>
<style>

</style>

<div class="findidpw_mainbox">
    <div class="findidpw_titlebox">
        <span class="findidpw_title">아이디/비밀번호 찾기,계정활성화</span>
    </div>
    <div class="findidpw_selectbox">
        <ul class="findidpw_list">
            <li class="findidpw_select" id="findidpw_findid">아이디 찾기</li><li class="findidpw_select" id="findidpw_findpw">비밀번호 찾기,계정활성화</li>
        </ul>
    </div>
    <div class="findidpw_textbox">
        <pre id="findidpw_text"><b>아이디를 잊으셨나요?</b><br><br>이메일인증을 통해<br>아이디를 확인하실 수 있습니다.</pre>
    </div>
    <div class="findidpw_inputbox">
            <input type="hidden" name="id" class="findidpw_input" id="findidpw_id" placeholder="아이디">
        <div class="findidpw_fullemail">
            <input type="text" name="email" class="findidpw_input" id="findidpw_email" placeholder="이메일">
            <span id="at">@</span>
            <input type="text" name="findidpw_domain" class="findidpw_input" id="findidpw_domain">
            <div class="findidpw_selectbox">
                <div id="findidpw_select_domain">직접 입력</div>
                <ul id="findidpw_custom_option">
                    <li class="findidpw_select_option">직접 입력</li>
                    <li class="findidpw_select_option">naver.com</li>
                    <li class="findidpw_select_option">gmail.com</li>
                    <li class="findidpw_select_option">hanmail.net</li>
                    <li class="findidpw_select_option">hotmail.com</li>
                    <li class="findidpw_select_option">nate.com</li>
                </ul>
            </div>
            <button type="button" id="findidpw_sendmail">인증번호 받기</button>
        </div>
        <div class="findidpw_emailcodebox">
            <input type="text" name="email_code" class="findidpw_input" id="findidpw_email_code" placeholder="인증번호">
            <span id="findidpw_timer"></span>
            <button type="button" id="findidpw_chkcode">인증번호 확인</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/member/findidpw.js"></script>
