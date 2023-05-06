<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<br><br><br><br>
<div>
    <div>
        <h2>비밀번호 재입력</h2>
    </div>
    <div>
        <p>새로운 비밀번호를 입력해주세요.</p>
        <p> 영문/숫자/특수문자 조합 8~12자리
            ID 포함, 연속되는 문자/숫자 3자리 이상 사용 불가
        </p>
        <form action="/signup/updatepassword" method="post" id="findpw_submit">
            <input type="hidden" name="id"  id="findpw_id" value="${mDto.id}">
            <input type="password" name="pw" id="findpw_pw">
            <span id="findpw_pwform"></span>
            <input type="password" id="findpw_pw2">
            <span id="findpw_pwchk"></span>
            <button type="button" id="changepassword_confirm">비밀번호 변경</button>
        </form>
    </div>
    <p>*변경된 비밀번호는 회원정보에 반영됩니다.</p>
    <p>*수정 완료하신 후 로그인하시면 방문 가능합나다.</p>
</div>

<script type="text/javascript" src="/js/member/changepassword.js"></script>
