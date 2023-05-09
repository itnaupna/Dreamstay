<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/member/findid.css"/>

    <div class="findid_titlebox">
        <span class="findid_title">아이디 / 비밀번호 찾기</span>
        <div class="findid_subjectbox">
            <span class="findid_span findid_subject">아이디를 확인해 주세요</span>
            <span class="findid_span findid_text">${mDto.user_name}님의 아이디는 <span style="color: #998465;">${mDto.id}</span> 입니다.</span>
            <button type="button" id="findid_gomain" onclick="location.href='/'">로그인 페이지로 이동</button>
        </div>
    </div>
