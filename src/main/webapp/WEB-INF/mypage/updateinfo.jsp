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

<style>
    #addr {
        font-weight: lighter;
    }

    .u_username span,
    .u_emaildetail span {
        font-weight: lighter;
    }

    .u_emaildetail span {
        margin-left: 20px;
    }

    .u_chphoe input[type=text],
    .u_addrdetail input[type=text],
    .u_emaildetail input[type=text] {
        width: 400px;
    }
</style>

<div class="u_info">

    <div class="u_title">
        <p>회원 정보 수정</p>
    </div>

    <div class="u_information">
        <span>MY INFORMATION</span>
    </div>
    <div class="u_username">
        <span>${familyname}${firstname}님의 아이디는 ${memberDto.id} 입니다</span>
    </div>

    <div class="u_name1">
        <span>FIRST NAME *</span>
        <span class="last_name">LAST NAME *</span>
    </div>

    <div class="u_name2">
        <input type="text" id="ch_name" class="ch_name" value="${familyname}" placeholder="FIRST NAME"
               oninput="onlyKoEng(this)">
        <input type="text" id="ch_name2" class="ch_name2" value="${firstname}" placeholder="LAST NAME"
               oninput="onlyKoEng(this)">
    </div>

    <div class="u_phone">
        <span>PHONE NUMBER *</span>
    </div>
    <div class="u_chphoe">
        <input type="text" id="u_phone" class="u_phone" value="${memberDto.phone}" oninput="onlyPhone(this)"
               maxlength="11" placeholder="숫자만 입력가능합니다.">
    </div>

    <div class="u_addr">
        <span>ADDRESS *</span>
    </div>

    <div class="u_addrdetail">
        <input type="text" id="addr" name="addr" value="${memberDto.addr}"/>
    </div>

    <div class="u_email">
        <span>E-MAIL *</span>
    </div>

    <div class="u_emaildetail">
        <input type="text" id="email" class="email" value="${memberDto.email}" readonly="readonly">
        <span>이메일은 변경할 수 없습니다</span>
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

    // 한글과 영문만
    function onlyKoEng(e) {
        const regex = /[^(ㄱ-힣a-zA-Z)]/gi;
        if (regex.test(e.value)) {
            alert("한글과 영문만 입력 가능합니다");
            e.value = e.value.replace(regex, '');
        }
    }

    // 전화번호 입력
    function onlyPhone(target) {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
    }

    const phoneInput = document.querySelector('#u_phone');
    phoneInput.addEventListener('input', (e) => {
        if (/[^0-9]/g.test(e.target.value)) {
            e.target.value = e.target.value.replace(/[^0-9]/g, '');
        }
    });
</script>