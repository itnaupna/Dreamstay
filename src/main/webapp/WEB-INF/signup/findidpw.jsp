<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br><br><br><br><br>
<div>
    <div>
        <span id="findidpw_findid">아이디 찾기</span>
        <span id="findidpw_findpw">비밀번호 찾기,계정활성화</span>
    </div>
    <div>
        <pre id="findidpw_text">
            아이디를 잊으셨나요?
            이메일인증을 통해
            아이디를 확인하실 수 있습니다.
        </pre>
        <input type="hidden" name="id" id="findidpw_id" placeholder="아이디">
        <input type="text" name="email" id="findidpw_email" placeholder="이메일">@
        <input type="text" name="findidpw_domain" id="findidpw_domain">
        <select id="findidpw_select_domain">
            <option value="직접 입력" selected="selected">직접&nbsp;입력</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="nate.com">nate.com</option>
        </select>
        <button type="button" id="findidpw_sendmail">인증번호 받기</button>
        <span id="findidpw_timer"></span>
        <input type="text" name="email_code" id="findidpw_email_code" placeholder="인증번호">
        <button type="button" id="findidpw_chkcode">인증번호 확인</button>
    </div>
</div>

<script type="text/javascript" src="/js/member/findidpw.js"></script>
