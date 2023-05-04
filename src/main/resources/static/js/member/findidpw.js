// 아이디 찾기 클릭 시
$("#findidpw_findid").click(function() {
    $("#findidpw_id").attr("type", "hidden");
    $("#findidpw_id").val("");
    $("#findidpw_email").val("");
    $("#findidpw_email_code").val("");
    $("#findidpw_text").text("            아이디를 잊으셨나요?\n            이메일인증을 통해\n            아이디를 확인하실 수 있습니다.");
});

// 비밀번호 찾기 클릭 시
$("#findidpw_findpw").click(function() {
    $("#findidpw_id").attr("type", "text");
    $("#findidpw_email").val("");
    $("#findidpw_email_code").val("");
    $("#findidpw_text").text("            비밀번호를 잊으셨나요?\n            휴대폰 본인인증을 통해 고객님의 비밀번호를\n            안전하게 재설정 가능합니다.");
});

// 아이디 입력값이 "" 이면 이메일 인증번호 발송 
// 아이디 입력값이 있다면 db에 id, email 대조 후 인증번호 발송
$("#findidpw_sendmail").click(function() {
    let id = $("#findidpw_id").val();
    let email = $("#findidpw_email").val();

    $.ajax({
       url:"/searchidpw",
       type: "post",
       data: {"email": email, "id" : id},
       success: function(chk) {
            if(chk == 1) {
                $.ajax({
                    type: 'post',
                    url: '/sendemail',
                    data: {"email" : email}, // 이메일 정보를 전달
                    success: function () {
                        alert('인증번호가 발송되었습니다');
                        let time = 180;// 발송 성공시
                        let min = "";
                        let sec = "";
                        timer =  setInterval(function() {
                            min = parseInt(time / 60);
                            sec = time % 60;

                            $("#findidpw_timer").html(min + "분" + sec + "초");
                            time--;

                            if (time < 0) {
                                $.ajax({
                                    type: "post",
                                    url: '/deletemail',
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
                alert("아이디나 이메일을 확인해주세요");
            }
       }
    });
});

// 이메일 인증
$("#findidpw_chkcode").click(function() {
    let id = $("#findidpw_id").val();
    let email = $("#findidpw_email").val();
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
            url: '/checkemail',
            data: {"email_code": email_code, "email": email},
            success: function (data) {
                if (data === true) { // data 가 success 일 때
                    clearInterval(timer);
                    $("#findidpw_timer").html("");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "/findid");
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
            url: '/checkemail',
            data: {"email_code": email_code, "email": email},
            success: function (data) {
                if (data === true) { // data 가 success 일 때
                    clearInterval(timer);
                    $("#findidpw_timer").html("");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "/changepassword");
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
