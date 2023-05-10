<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Playfair+Display&family=Playfair+Display+SC&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Playfair+Display&display=swap"
      rel="stylesheet">
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
<link rel="stylesheet" href="/css/member/login.css"/>

<div class="L_main">
    <div class="L_title">
        <%-- 문구1--%>
        <div class="L_signin">
            <p>SIGNIN</p>
        </div>
        <%-- 문구2--%>
        <div class="L_stay">
            <h6>머무는 모든 순간이 특별해집니다.</h6>
        </div>
        <%-- 로그인 타이틀--%>
        <div class="L_Login">
            <div class="L_Logintitle1">
                <a href="#">아이디 로그인</a>
            </div>
            <div class="L_Logintitle2">
                <a href="#">비회원 예약확인</a>
            </div>
        </div>
        <%-- 로그인 입력--%>
        <div class="L_Logintext">
            <div class="L_Logintext1">
                <input type="text" name="id" id="login_id" placeholder="아이디">

                <input type="password" name="pw" id="login_pw" placeholder="비밀번호">

                <label>
                    <input type="checkbox" name="saveid" id="login_saveid">아이디 저장
                </label>

                <button type="button" id="access" class="btn-lg">로그인</button>
                <br>
                <span>CLUB JOSUN 회원이 되시면 더 많은 혜택이 있습니다.</span>
                <div class="L_Link">
                    <a href="/signup/signup">회원가입<span class="material-symbols-outlined">
navigate_next
</span></a>
                    <a href="/signup/findidpw">아이디/비밀번호찾기/계정활성화<span class="material-symbols-outlined">
navigate_next
</span></a>
                </div>
            </div>

            <div class="L_Logintext2">

            </div>
        </div>

        <div>
            <hr>
            <div class="L_bttext">
                <ul>
                    <li>
                        이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다
                    </li>
                    <li>
                        오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다.
                    </li>
                    <li>
                        유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다.
                    </li>
                    <li>
                        메리어트 호텔에서 예약하신 경우, 메리어트 사이트에서만 예약 확인이 가능합니다.
                    </li>
                    <li>
                        카카오페이 간편가입 및 신세계 면세점 동시가입 회원은 '계정활성화' 버튼을 통해 서비스 이용이 가능합니다.
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>


<script type="text/javascript" src="/js/member/login.js"></script>
