let timer = "";
// 아이디 찾기 클릭 시
$("#findidpw_findid").click(function() {
    $(this).css({
        "border-left": "1px solid black",
        "border-top": "1px solid black",
        "border-right": "1px solid black",
        "border-bottom": "none",
        color: "black"
    });
    $("#findidpw_findpw").css({
        "border-top": "1px solid #cccccc",
        "border-right": "1px solid #cccccc",
        "border-bottom": "1px solid black",
        color: "#cccccc"
    });
    $("#findidpw_id").attr("type", "hidden").val("");
    $("#findidpw_email").val("");
    $("#findidpw_email_code").val("");
    $("#findidpw_domain").val("").attr("readonly", false);
    $("#findidpw_select_domain").text("직접 입력");
    $("#findidpw_text").html("<b>아이디를 잊으셨나요?</b><br>\n이메일인증을 통해\n아이디를 확인하실 수 있습니다.");
    clearInterval(timer);
    $("#findidpw_timer").html("");
});

// 비밀번호 찾기 클릭 시
$("#findidpw_findpw").click(function() {
    $(this).css({
        "border-left": "none",
        "border-top": "1px solid black",
        "border-right": "1px solid black",
        "border-bottom": "none",
        color: "black"
    });
    $("#findidpw_findid").css({
        "border-top": "1px solid #cccccc",
        "border-left": "1px solid #cccccc",
        "border-bottom": "1px solid black",
        color: "#cccccc"
    });
    $("#findidpw_id").attr("type", "text");
    $("#findidpw_email").val("");
    $("#findidpw_email_code").val("");
    $("#findidpw_domain").val("").attr("readonly", false);
    $("#findidpw_select_domain").text("직접 입력");
    $("#findidpw_text").html("<b>비밀번호를 잊으셨나요?</b><br>\n이메일 인증을 통해 고객님의 비밀번호를\n안전하게 재설정 가능합니다.\n계정이 잠겼을경우 비밀번호 찾기를 진행하시면\n계정이 활성화됩니다.");
    clearInterval(timer);
    $("#findidpw_timer").html("");
});

// 이메일 select box 이벤트
$("#findidpw_select_domain").click(  function () {
    let posi = Number($(this).position().left + 30);
    console.log(posi);
    $("#findidpw_custom_option").slideToggle().css("left", posi);
});

// select option 선택시 domain 에 적용
$(".findidpw_select_option").click(function() {
    if($(this).text() == "직접 입력") {
        $("#findidpw_domain").val("").attr("readonly", false);
        $("#findidpw_select_domain").text($(this).text()).click();
    } else {
        $("#findidpw_domain").val($(this).text()).attr("readonly", true);
        $("#findidpw_select_domain").text($(this).text()).click();
    }
});

// 아이디 입력값이 "" 이면 email만 확인 후 인증번호 발송(id찾기),
// 아이디 입력값이 있다면 db에 id, email 대조 후 인증번호 발송 (비밀번호 찾기)
$("#findidpw_sendmail").click(function() {
    let id = $("#findidpw_id").val();
    let email = $("#findidpw_email").val() + "@" + $("#findidpw_domain").val();

    $.ajax({
       url:"/signup/searchidpw",
       type: "post",
       data: {"email": email, "id" : id},
       success: function(chk) {
            if(chk == 1) {
                $.ajax({
                    type: 'post',
                    url: '/signup/sendemail',
                    data: {"email" : email}, // 이메일 정보를 전달
                    success: function () {
                        alert('인증번호가 발송되었습니다');
                        clearInterval(timer);
                        $("#findidpw_timer").html("");
                        let time = 180;// 발송 성공시
                        let min = "";
                        let sec = "";
                        timer =  setInterval(function() {
                            min = parseInt(time / 60);
                            sec = time % 60;

                            $("#findidpw_timer").html(min + "분" + sec + "초").css("color", "red");
                            time--;

                            if (time < 0) {
                                $.ajax({
                                    type: "post",
                                    url: '/signup/deletemail',
                                    data: {"email": email},
                                    success: function(data) {
                                        $("#findidpw_timer").html("");
                                        alert("인증 시간이 초과되었습니다");
                                        clearInterval(timer);
                                    }
                                });
                            }
                        }, 1000);// 발송 성공시 alert
                    }
                });
            } else if(chk == 0) {
                console.log($("#findidpw_id").is(":visible"));
                if($("#findidpw_id").is(":visible")) {
                    alert("아이디나 이메일을 확인해주세요");
                } else {
                    alert("가입된 이메일이 아닙니다");
                }
            }
       }
    });
});

// 이메일 인증
$("#findidpw_chkcode").click(function() {
    let id = $("#findidpw_id").val();
    let email = $("#findidpw_email").val() + "@" + $("#findidpw_domain").val();
    let email_code = $("#findidpw_email_code").val();
    let form = document.createElement("form");
    let object = document.createElement("input");
    object.setAttribute("type", "hidden");
    object.setAttribute("name", "email");
    object.setAttribute("value", email);
    form.appendChild(object);
    if(id == "") {
        $.ajax({
            type: 'post',
            url: '/signup/checkemail',
            data: {"email_code": email_code, "email": email},
            success: function (data) {
                if (data === true) { // data 가 success 일 때
                    clearInterval(timer);
                    $("#findidpw_timer").html("");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "/signup/findid");
                    document.body.appendChild(form);
                    form.submit();
                } else {
                    alert("인증번호가 일치하지 않습니다"); // 인증번호 일치하지 않을 때
                }
            },
            error: function () {
                alert('인증번호 확인에 실패하였습니다');
            }
        });
    } else {
        $.ajax({
            type: 'post',
            url: '/signup/checkemail',
            data: {"email_code": email_code, "email": email},
            success: function (data) {
                if (data === true) { // data 가 success 일 때
                    clearInterval(timer);
                    $("#findidpw_timer").html("");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "/signup/changepassword");
                    document.body.appendChild(form);
                    form.submit();
                } else {
                    alert("인증번호가 일치하지 않습니다"); // 인증번호 일치하지 않을 때
                }
            },
            error: function () {
                alert('인증번호 확인에 실패하였습니다');
            }
        });
    }
});

$(".findidpw_input").focus(function() {
    $(this).css("border-bottom", "1px solid black");
})

$(".findidpw_input").focusout(function() {
    $(this).css("border-bottom", "1px solid #cccccc");
})

