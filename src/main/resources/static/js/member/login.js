let cookies = document.cookie.split("; ");
for (let i = 0; i < cookies.length; i++) {
    let cookie = cookies[i].split("=");
    if(cookie[0] == "saveid") {
        $("#login_saveid").attr("checked", true);
        $("#login_id").val(cookie[1]);
    }
}

// 로그인
$("#access").click(function(){
    let login_id = $("#login_id").val();
    let login_pw = $("#login_pw").val();
    let login_saveid = $("#login_saveid").is(":checked");
    if(login_id == "") {
        alert("아이디를 입력해주세요");
        return;
    } else if(login_pw == "") {
        alert("비밀번호를 입력해주세요");
        return;
    }
    $.ajax({
        url: "/signup/access",
        type: "post",
        data: {"id": login_id, "pw": login_pw, "saveid": login_saveid},
        success: function(res) {
            if(res == 1) {
                location.href = "/";
            } else if(res == 0){
                $.ajax({
                    url: "/signup/lockcount",
                    type: "post",
                    data: {"id" : login_id},
                    success : function(data) {
                        if(data < 5) {
                            alert("비밀번호 \"" + data + "\"회 오류 입니다. 비밀번호 5회 오류 시 계정이 잠금 됨으로 유의하시기 바랍니다.")
                        } else {
                            alert("계정이 잠겼습니다 계정 활성화를 통해 잠금을 해제해주세요");
                        }
                    }
                })
            } else {
                alert("등록되지 않은 아이디입니다");
            }
        }
    });
});

$("#login_id, #login_pw").keyup(function(e) {
    if(e.code == "Enter" ) {
        $("#access").click();
    }
});

$("#login_login_select").click(function() {
   $("#login_login_subject").css("display", "flex");
   $("#login_reservation").css("display", "none");
});

$("#login_nomember_select").click(function() {
    $("#login_reservation").css("display", "block");
    $("#login_login_subject").css("display", "none");
});

$("#login_login_select").click(function() {
    $(this).css({
        "border-top": "1px solid black",
        "border-left": "1px solid black",
        "border-bottom": "none",
        color: "black"
    });
    $("#login_nomember_select").css({
         "border-top": "1px solid #cccccc",
         "border-right": "1px solid #cccccc",
         "border-bottom": "1px solid black",
         color: "#cccccc"
    });
});

$("#login_nomember_select").click(function() {
    $(this).css({
        "border-top": "1px solid black",
        "border-right": "1px solid black",
        "border-bottom": "none",
        color: "black"
    });
    $("#login_login_select").css({
        "border-top": "1px solid #cccccc",
        "border-left": "1px solid #cccccc",
        "border-bottom": "1px solid black",
        color: "#cccccc"
    });
    $("#login_id").val("");
    $("#login_pw").val("");
});


// 카카오 로그인
$("#kakao_login").click(function() {

    Kakao.init("09e7bd588320e6991f62d894f6a723a6");
    // location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=f3d379546c1b36b64b38a67e6b3b2e27&redirect_uri=http://localhost:8080/signup/login&response_type=code';

    // var kakaoCode = window.location.href;
    // console.log(kakaoCode);
    Kakao.Auth.login({
        success: function(response) {
            Kakao.API.request({
                url: "/v2/user/me",
                success:function(response) {
                    let id = JSON.stringify(response.id);
                    let nickname = " /" + JSON.stringify(response.properties.nickname).replaceAll("\"", "");
                    let email = JSON.stringify(response.kakao_account.email).replaceAll("\"", "");
                    console.log(id);
                    console.log(nickname);
                    console.log(email);
                    $.ajax({
                        url: "/signup/kakaologin",
                        data: {"id": id, "user_name": nickname, "email": email},
                        type: "post",
                        success: function() {
                            alert("카카오 로그인 성공");
                            location.href = "/";
                        },
                        error: function () {
                            alert("카카오 로그인 실패")
                        }
                    });
                },
                fail : function (error) {
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function(error) {
            alert(JSON.stringify(error));
        }
    });
});