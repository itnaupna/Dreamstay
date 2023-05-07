<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="css/signup.css" rel="stylesheet" type="text/css"/>

<!-- 다음 맵 주소 입력 코드 Key -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 나머지 데이터 입력 폼 --%>
<br><br><br><br><br><br>
<form method="post" action="/signup/joinmember" id="join_form">
    <table>
        <caption align="top"><b>회원가입</b></caption>

        <tr>
            <th>이메일</th>
            <td>
                <input type="text" name="email" id="email">@
                <input tpye="text" name="email_domain" id="email_domain">
                <select name="join_domain" id="join_domain">
                    <option value="직접 입력" selected="selected">직접&nbsp;입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="nate.com">nate.com</option>
                </select>
                <span id="join_email_notice"></span>
            </td>
            <td>
                <button type="button" id="SendEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 받기</button>
            </td>
        </tr>

        <tr>
            <td><label for="email_code">인증번호</label></td>
            <td><input type="text" name="email_code" id="email_code" placeholder="인증번호를 입력해주세요">
            </td>
            <td>
                <button type="button" id="CheckEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 확인</button>
            </td>
            <td>
                <span class="point successEmailChk" id="timer"></span>
                <span id="join_code_chk"></span>
            </td>
        </tr>

        <tr>
            <th>아이디</th>
            <td><label for="id"></label><input type="text" name="id" id="id" class="form-control">
            </td>
            <%-- label for 사용시 앞에 위치시켜도 연결됨 --%>
            <td>
                <button type="button" id="id_check" name="id_check" class="btn btn-outline-primary btn-sm">중복확인</button>
                <span id="join_idchk"></span>
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><label for="pw"></label><input type="password" name="pw" id="pw" class="form-control"></td>
            <td>
                <span class="point" id="pwform"></span>
            </td>
        </tr>

        <tr>
            <th>비밀번호확인</th>
            <td><label for="pwchk"></label><input type="password" id="pwchk" class="form-control"></td>
            <td>
                <span class="point" id="successpwCheck">비밀번호를 확인해주세요</span>
            </td>
        </tr>

        <tr>
            <th>이름</th>
            <td><label for="user_name"></label>
                <input type="text" id="family_name" name="family_name" placeholder="Family Name(성)">
                <input type="text" id="user_name" name="user_name" placeholder="First Name(이름)"/>
                <span id="join_null_check_name"></span>
            </td>
        </tr>

        <tr>
            <th>번호</th>
            <td>
                <label for="phone"></label><input type="text" id="phone" name="phone"/>
                <span id="join_null_check_phonenum"></span>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" id="zipcode" name="zipcode">
                <button type="button" id="search_addr">우편번호 검색</button>
            </td>
        </tr>
        <tr>
            <th>주소</th>
            <td><label for="addr"></label><input type="text" id="addr" name="addr"/></td>
        </tr>

        <tr>
            <th>상세 주소</th>
            <td>
                <label for="addrdetail"></label><input type="text" name="addrdetail" id="addrdetail" placeholder="상세주소를 입력해주세요"/>
                <span id="join_null_check_addr"></span>
            </td>
        </tr>

        <tr>
            <td>
                <button type="button" class="btn btn-outline-primary btn-sm"
                id="signupBtn" >회원가입</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="/js/member/join.js"></script>




