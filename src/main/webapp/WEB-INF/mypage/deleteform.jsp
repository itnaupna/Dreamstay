<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/mypage/deleteform.css" />

<div class="del">
    <div class="del_title">
        <p>회원 탈퇴</p>
        <span>정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</span>
    </div>

    <%--    <form method="get" name="deleteUserForm">--%>
    <div class="del_ps">
        <div class="ps_pass">
            <p>PASSWORD *</p>
            <input type="password" name="pw" id="deleteform_pw" placeholder="비밀번호를 입력해주세요" autofocus>
        </div>
        <br>
        <div class="ps_btn">
            <button type="button" id="deleteBtn" class="delete-btn">회원탈퇴</button>
        </div>
    </div>
    <%--    </form>--%>
    <div class="del_info">
        <div class="info_title">
            <p>DREAM STAY 동시가입 고객 안내</p>
        </div>
        <div class="info_ul">
            <ul>
                <li>
                    회원가입 동의철회 : <span>www.dreamstay.com</span> 접속 > 로그인 회원탈퇴
                </li>
                <li>
                    광고 / 마케팅 동의철회 : <span>www.dreamstay.com</span> 접속 > 로그인 > 회원정보수정 > 동의철회
                </li>
                <li>
                    문의번호: 1234-5678 (09:00~18:00 연중무휴)
                </li>
            </ul>
        </div>
    </div>
</div>


<script type="text/javascript" src="/js/mypage/deleteuser.js"></script>
