let cookies = document.cookie.split("; ");
for (let i = 0; i < cookies.length; i++) {
    let cookie = cookies[i].split("=");
    if(cookie[0] == "saveid") {
        $("#login_saveid").attr("checked", true);
        $("#login_id").val(cookie[1]);
    }
}
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






