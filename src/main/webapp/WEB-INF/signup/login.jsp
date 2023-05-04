<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
loginpage
<br><br><br>
<input type="text" name="id" id="login_id" placeholder="아이디">
<input type="password" name="pw" id="login_pw" placeholder="비밀번호">
<label>
    <input type="checkbox" name="saveid" id="login_saveid">아이디 저장
</label>
<button type="button" id="access">로그인</button>
<a href="/findidpw">아이디/비밀번호찾기</a>
<a href="/signup">회원가입</a>

<script type="text/javascript" src="/js/login.js"></script>
