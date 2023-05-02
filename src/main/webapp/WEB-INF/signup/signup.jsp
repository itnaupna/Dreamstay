<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="css/signup.css" rel="stylesheet" type="text/css"/>

<html>
<%-- 상혁입니다 --%>
<head>
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
</head>
<body>
<%-- 인증번호 보내는 폼 --%>
<form method="post" action="sendemail">
    <table>
        <caption align="top"><b>회원가입</b></caption>
        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" id="email"></td>
            <td>
                <button type="submit" id="SendEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 받기</button>
            </td>
        </tr>
    </table>
</form>

<%-- 인증번호 확인하는 폼 --%>
<form method="post" action="checkemail" id="checkForm">
    <table>
        <tr>
            <td><label for="email_code">인증번호</label></td>
            <td><input type="text" name="email_code" id="email_code"></td>
            <td>
                <button type="button" id="CheckEmailBtn" class="btn btn-outline-primary btn-sm">인증번호 확인</button>
            </td>
            <td>
                <span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
            </td>
        </tr>
    </table>
</form>

<%-- 나머지 데이터 입력 폼 --%>
<form method="post" action="insert" id="signupForm">
    <table>
        <tr>
            <th>아이디</th>
            <td><label for="id"></label><input type="text" name="id" id="id" class="form-control"></td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><label for="pw"></label><input type="password" name="pw" id="pw" class="form-control"></td>
        </tr>

        <tr>
            <th>이름</th>
            <td><label for="user_name"></label><input type="text" id="user_name" name="user_name" readonly/></td>
        </tr>

        <tr>
            <th>번호</th>
            <td><label for="phone"></label><input type="text" id="phone" name="phone" readonly/></td>
        </tr>

        <tr>
            <th>주소</th>
            <td><label for="addr"></label><input type="text" id="addr" name="addr" readonly/></td>
        </tr>
        <tr>
            <th>상세 주소</th>
            <td><label for="addrdetail"></label><input type="text" name="addrdetail" id="addrdetail"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit" class="btn btn-outline-primary btn-sm">회원가입</button>
            </td>
        </tr>
    </table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- ajax script -->
<script>
    $(document).ready(function () {
        $('#SendEmailBtn').click(function (e) {
            e.preventDefault(); // 기존의 form 전송 방지
            $.ajax({
                type: 'POST',
                url: '/sendemail',
                data: $('#email').serialize(), // 이메일 정보를 전달
                success: function (data) {
                    alert('인증번호가 발송되었습니다'); // 발송 성공시 alert
                },
                error: function () {
                    alert('인증번호 발송에 실패하였습니다'); // 발송 실패시 alert
                }
            })
        });

        $('#CheckEmailBtn').click(function (e) {
            e.preventDefault(); // 기존의 form 전송 방지
            $.ajax({
                type: 'POST',
                url: 'checkemail',
                data: $('checkForm').serialize(), // 입력한 인증번호 전달 ( form id 로 전달가능)
                success: function (data) {
                    alert("인증번호가 맞습니다");
                    $(".successEmailChk").text("인증번호가 일치합니다."); // ( 인증번호 일치 할때 )
                    $(".successEmailChk").css("color", "green");     //  ( 폰트색 변경 )
                },
                error: function () {
                    alert('인증번호가 일치하지 않습니다'); // 인증번호 실패 alert
                    $(".successEmailChk").text("인증번호가 틀립니다.");
                    $(".successEmailChk").css("color", "red");
                }
            });
        });
    });
</script>

</html>
