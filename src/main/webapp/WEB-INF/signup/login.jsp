<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
loginpage
<br><br><br>
<form action="/access" method="post">
    <input type="text" name="id" placeholder="아이디">
    <input type="password" name="pw" placeholder="비밀번호">
    <button type="submit">로그인</button>
</form>
<a href="">아이디찾기</a>
<a href="">비밀번호찾기</a>
<a href="./signup">회원가입</a>

<script type="text/javascript" src="/js/login.js"></script>
