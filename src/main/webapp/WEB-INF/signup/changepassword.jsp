<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .changepassword_box {
        border: 1px solid pink;
        margin: 180px auto 0 auto;
        width: 600px;
        height: 500px;
    }
    .changepassword_mainbox {
        border: 1px solid blue;
        text-align: center;
    }
    .changepassword_titlebox {
        border: 1px solid red;
    }
    .changepassword_subjectbox {
        border: 1px solid green;
    }

    .changepassword_textbox {
        display: block;
    }

    .changepassword_notice {
        border: 1px solid orange;
        margin-left: auto;
        margin-right: auto;
    }


</style>
<div class="changepassword_box">
    <div class="changepassword_mainbox">
        <div class="changepassword_titlebox">
            <span>비밀번호 재입력</span>
        </div>
        <div class="changepassword_subjectbox">
            <p>새로운 비밀번호를 입력해주세요.</p>
            <p> 영문/숫자/특수문자 조합 8~15자리 형태로 사용가능</p>
            <form action="/signup/updatepassword" method="post" id="findpw_submit">
                <input type="hidden" name="id" class="changepassword_textbox" id="findpw_id" value="${mDto.id}">
                <input type="password" name="pw" class="changepassword_textbox" id="findpw_pw">
                <span id="findpw_pwform"></span>
                <input type="password" id="findpw_pw2">
                <span id="findpw_pwchk"></span>
                <button type="button" id="changepassword_confirm">비밀번호 변경</button>
            </form>
        </div>
    </div>
    <div class="changepassword_notice">
        <p>*변경된 비밀번호는 회원정보에 반영됩니다.</p>
        <p>*수정 완료하신 후 로그인하시면 방문 가능합나다.</p>
    </div>
</div>


<script type="text/javascript" src="/js/member/changepassword.js"></script>
