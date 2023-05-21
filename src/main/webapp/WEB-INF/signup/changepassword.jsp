<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/member/changepassword.css"/>

<div class="changepassword_box">
    <div class="changepassword_mainbox">
        <div class="changepassword_titlebox">
            <span class="changepassword_title">비밀번호 재설정</span>
        </div>
        <div class="changepassword_subjectbox">
            <p class="changepassword_subject1">새로운 비밀번호를 입력해주세요.</p>
            <p class="changepassword_subject2"> 영문/숫자/특수문자 조합 8~15자리 형태로 사용가능</p>
            <form action="/signup/updatepassword" method="post" id="findpw_submit">
                <input type="hidden" name="id" id="findpw_id" value="${mDto.id}">
                <input type="password" name="pw" class="changepassword_textbox" id="findpw_pw" placeholder="새 비밀번호">
                <span class="changepassword_warning" id="findpw_pwform"></span>
                <input type="password" class="changepassword_textbox" id="findpw_pw2" placeholder="새 비밀번호 확인">
                <span class="changepassword_warning" id="findpw_pwchk"></span>
                <button type="button" id="changepassword_confirm">비밀번호 변경</button>
            </form>
        </div>
    </div>
    <div class="changepassword_noticebox">
        <ul class="changepassword_notice">
            <li>변경된 비밀번호는 회원정보에 반영됩니다.</li>
            <li>수정 완료하신 후 로그인하시면 방문 가능합나다.</li>
        </ul>
    </div>
</div>

<script type="text/javascript" src="/js/member/changepassword.js"></script>
