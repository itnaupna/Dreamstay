<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<br><br><br><br>
<div>
    <h2>비밀번호 재입력</h2>
    <div>

        <p>새로운 비밀번호를 입력해주세요.</p>
        <p> 영문/숫자/특수문자 조합 8~12자리
            ID 포함, 연속되는 문자/숫자 3자리 이상 사용 불가
        </p>
        <input type="password" name="pw" id="findpw_pw">
        <input type="password" id="findpw_pw2">
    </div>
    <p>*변경된 비밀번호는 회원정보에 반영됩니다.</p>
    <p>*수정 완료하신 후 로그인하시면 방문 가능합나다.</p>
</div>