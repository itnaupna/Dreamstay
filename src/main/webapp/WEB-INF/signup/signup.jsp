<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="css/signup.css" rel="stylesheet" type="text/css"/>

<!-- 다음 맵 주소 입력 코드 Key -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 입력 -->
<script>
    window.onload = function () {
        document.getElementById("addr").addEventListener("click", function () {
            //주소입력칸을 클릭하면카카오 지도 발생
            new daum.Postcode({
                oncomplete: function (data) { //선택시 입력값 세팅
                    document.getElementById("addr").value = data.address; // 주소 넣기
                    document.querySelector("input[name=addrdetail]").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }
</script>
<!-- 다음 맵 api script 끝 -->

<%-- 나머지 데이터 입력 폼 --%>
<form method="post" action="joinmember">
    <table>
        <caption align="top"><b>회원가입</b></caption>

        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" id="email" required="required"></td>
            <td>
                <button type="button" id="SendEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 받기</button>
            </td>
        </tr>

        <tr>
            <td><label for="email_code">인증번호</label></td>
            <td><input type="text" name="email_code" id="email_code" placeholder="인증번호를 입력해주세요" required="required">
            </td>
            <td>
                <button type="button" id="CheckEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 확인</button>
            </td>
            <td>
                <span class="point successEmailChk" id="timer"></span>
            </td>
        </tr>

        <tr>
            <th>아이디</th>
            <td><label for="id"></label><input type="text" name="id" id="id" class="form-control" required="required">
            </td>
            <%-- label for 사용시 앞에 위치시켜도 연결됨 --%>
            <td>
                <button type="button" id="id_check" name="id_check" class="btn btn-outline-primary btn-sm">중복확인</button>
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><label for="pw"></label><input type="password" name="pw" id="pw" class="form-control" required="required"></td>
            <td>
                <span class="point" id="pwform"></span>
            </td>
        </tr>

        <tr>
            <th>비밀번호확인</th>
            <td><label for="pwchk"></label><input type="password" id="pwchk" class="form-control" required="required"></td>
            <td>
                <span class="point" id="successpwCheck">비밀번호를 확인해주세요</span>
            </td>
        </tr>

        <tr>
            <th>이름</th>
            <td><label for="user_name"></label><input type="text" id="user_name" name="user_name" required="required"/>
            </td>
        </tr>

        <tr>
            <th>번호</th>
            <td><label for="phone"></label><input type="text" id="phone" name="phone" required="required"/></td>
        </tr>

        <tr>
            <th>주소</th>
            <td><label for="addr"></label><input type="text" id="addr" name="addr" required="required"/></td>
        </tr>

        <tr>
            <th>상세 주소</th>
            <td><label for="addrdetail"></label><input type="text" name="addrdetail" id="addrdetail"
                                                       required="required"/></td>
        </tr>

        <tr>
            <td>
                <button type="submit" class="btn btn-outline-primary btn-sm"
                id="signupBtn" >회원가입</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="/js/member/join.js"></script>




