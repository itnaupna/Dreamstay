<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/mypage/updatepass.css" />

<div class="up_pass">

    <div class="ps_title">
        <p>비밀 번호 변경</p>
        <span>현재 비밀번호를 올바르게 입력해야만 비밀번호 변경이 가능합니다.</span>
    </div>

    <form method="post" action="changepw">
        <div class="ps_pass">
            <div class="ps_field">
                <p>CURRENT PASSWORD *</p>
                <input type="password" name="pw" id="login_pw" placeholder="현재 비밀번호를 입력해주세요" autofocus>
                <span id="nowpwch">현재 비밀번호를 입력해주세요</span>
            </div>
        </div>

        <div class="ps_passck" id="ps_passck">
            <div class="new_pass ps_field">
                <p>NEW PASSWORD *</p>
                <input type="password" name="pw" id="ch_pw" readonly="readonly"
                       placeholder="영문, 숫자, 특수문자 조합 8~12자리를 입력해주세요">
            </div>
            <div class="con_pass ps_field">
                <p>CONFIRM PASSWORD *</p>
                <input type="password" name="pw" id="ch_pw1" class="ch_btn" readonly="readonly"
                       placeholder="동일한 비밀번호를 입력해주세요">
            </div>
        </div>
        <div class="ps_bottom">
            <span class="ps_sub">* 현재 비밀번호가 맞을경우 새로운 비밀번호로 변경이 가능합니다</span>
        </div>
        <div class="upbtn">
            <button type="button" id="updatebtn" class="updatebtn">비밀번호변경</button>
        </div>
    </form>
</div>

<script type="text/javascript" src="/js/mypage/updatepass.js"></script>
