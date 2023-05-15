<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/mypage/updateinfo.css"/>
<link href="https://fonts.googleapis.com/css2?family=Carlito&display=swap" rel="stylesheet">

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

<div class="u_info">

    <div class="u_title">
        <p>회원 정보 수정</p>
    </div>

    <div class="u_information">
        <span>MY INFORMATION</span>
    </div>
    <div class="u_username">
        <span>${memberDto.user_name} / ${memberDto.email}</span>
    </div>

    <div class="u_name1">
        <span>FIRST NAME *</span>
        <span class="last_name">LAST NAME *</span>
    </div>

    <div class="u_name2">
        <input type="text" id="ch_name" class="ch_name" value="${familyname}" placeholder="FIRST NAME">
        <input type="text" id="ch_name2" class="ch_name2" value="${firstname}" placeholder="LAST NAME">
    </div>

    <div class="u_phone">
        <span>PHONE NUMBER *</span>
    </div>
    <div class="u_chphoe">
        <input type="text" id="u_phone" class="u_phone" value="${memberDto.phone}">
        <%--        <button type="button" class="ch_phbtn">번호 수정</button>--%>
    </div>

    <div class="u_addr">
        <span>ADDRESS *</span>
    </div>

    <div class="u_addrdetail">
        <input type="text" id="addr" name="addr" value="${memberDto.addr}"/>
        <input type="text" name="addrdetail" id="addrdetail"/>
    </div>

    <div class="u_email">
        <span>E-MAIL *</span>
    </div>

    <div class="u_emaildetail">
        <input type="text" id="email" class="email" value="${memberDto.email}" readonly="readonly">
    </div>

    <div class="up_btn">
        <button type="button" class="update_btn" id="update_btn">저장</button>
    </div>
</div>

<script>
    $("#update_btn").click(function () {
        // 값 가져오기
        let form = new FormData();

        let familyname = $("#ch_name").val(); // 이름 ( 성 )
        let username = $("#ch_name2").val(); // 이름 (이름)
        let phone = $("#u_phone").val(); // 휴대폰번호
        let addr = $("#addr").val();

        form.append("user_name", familyname + "/" + username);
        form.append("phone", phone);
        form.append("addr", addr);
        $.ajax({
            url: "/mypage/changeinfo",
            data: form,
            type: "post",
            dataType: "text",
            processData: false,
            contentType: false,
            success: function () {
                alert("정보가 수정되었습니다");
            }
        });
    });
</script>