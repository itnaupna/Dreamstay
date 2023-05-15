<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/mypage/info.css" />

<div class="m_main">
    <div class="mtop_area">
        <div class="mtop_inner">
            <div class="m_title">
                <p>My Page</p>
            </div>
            <span>멤버십 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
        </div>

    </div>
    <div class="m_maininfo">

        <div class="m_myinfo">
            <div class="m_userid">
                <p>${loginuser.user_name}님</p>
            </div>
        </div>

        <div class="m_info">
            <ul class="m_infoul">
                <li>
                    <span>멤버십</span>
                    <ul>
                        <li>
                            <a href="/mypage/membership">멤버십 안내</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <span>문의</span>
                    <ul>
                        <li>
                            <a href="/mypage/qnalist">문의 내역 확인</a>
                        </li>

                        <li>
                            <a href="/mypage/qnaboard">문의 하기</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <span>개인정보관리</span>
                    <ul>
                        <li>
                            <a href="/mypage/updateinfo">회원 정보 수정</a>
                        </li>

                        <li>
                            <a href="/mypage/updatepass">비밀 번호 변경</a>
                        </li>

                        <li>
                            <a href="/mypage/deleteform">회원 탈퇴</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
