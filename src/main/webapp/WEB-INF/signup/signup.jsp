<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="css/signup.css" rel="stylesheet" type="text/css"/>

<%-- 상혁입니다 --%>

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
                <span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
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
            <td><label for="pw"></label><input type="password" name="pw" id="pw" class="form-control"
                                               required="required"></td>
        </tr>

        <tr>
            <th>비밀번호확인</th>
            <td><label for="pw1"></label><input type="password" name="pw1" id="pw1" class="form-control"
                                                required="required" onkeyup="pw_check()"></td>
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
            <td><label for="phone"></label><input type="text" id="phone" name="phone" title="형식에 맞춰주세요"  required="required"
<%--                                                  pattern="(010)-\d{3,4}-\d{4}"/></td>--%>
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
                        id="signupBtn" disabled="disabled">회원가입
                </button>
            </td>
        </tr>
    </table>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- ajax script -->
<script>
    let f_id = false;
    let f_pw = false;
    let f_email = false;
    let f_user_name = false;
    let f_phone = false;
    let f_addr = false;

    // 이메일 인증번호 전송 이벤트
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
    // 이메일 인증번호 확인 버튼 이벤트
    $('#CheckEmailBtn').click(function (e) {
        // 인증번호 입력, 이메일 값 가져오기
        let email_code = $("#email_code").val();
        let email = $("#email").val();

        e.preventDefault(); // 기존의 form 전송 방지

        $.ajax({
            type: 'POST',
            url: '/checkemail',
            data: {"email_code": email_code, "email": email}, // 입력한 인증번호 전달 ( form id 로 전달가능)
            success: function (data) {
                if (data === true) { // data 가 success 일 때
                    alert("인증번호가 맞습니다");
                    f_email = true;
                } else {
                    alert("인증번호가 일치하지 않습니다"); // 인증번호 일치하지 않을 때
                }
            },
            error: function () {
                alert('인증번호 확인에 실패하였습니다');
            }
        });
    });

    // 아이디 중복체크 스크립트
    $("#id_check").click(function (e) {

        let id = $("#id").val();

        $.ajax({
            type: 'get',
            url: '/overlapid',
            data: {"id": id},
            success: function (data) {
                if (data == 0) {
                    alert("회원가입 가능한 아이디입니다");
                    f_id = true;
                } else {
                    alert("아이디가 이미 있습니다.");
                }
            },
            error: function () {
                alert('중복확인 오류메세지입니다');
            }
        });
    });

    // 비밀번호 일치할때 text랑 color 변경
    $('#pw, #pw1').on('keyup', function () {
        let pw = document.getElementById('pw').value;
        let pw1 = document.getElementById('pw1').value;

        if (pw !== pw1) {
            $("#successpwCheck").text("비밀번호가 일치하지 않습니다");
            $("#successpwCheck").css("color", "red");
        } else {
            $("#successpwCheck").text("비밀번호가 일치합니다");
            $("#successpwCheck").css("color", "green");
            f_pw = true;
        }
    });
</script>

<script type="text/javascript">

    $(function () {

        if ($("#addr").val().length > 0) {
            f_addr = true;
        }

        if ($("#phone").val().length > 0) {
            f_phone = true;
        }

        if ($("#user_name").val().length > 0) {
            f_user_name = true;
        }

        setInterval(function () {
            console.log(f_email, f_id, f_user_name, f_pw, f_phone, f_addr);
            if (f_pw && f_id && f_email && f_user_name && f_phone && f_addr) {
                $("#signupBtn").prop("disabled", false);
            } else {
                $("#signupBtn").prop("disabled", true);
            }
        }, 1000);

    });
</script>
