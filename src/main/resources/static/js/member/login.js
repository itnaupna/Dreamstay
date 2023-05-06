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
            if(res) {
                location.href = "/";
            } else {
                alert("아이디나 비밀번호를 확인해주세요");
            }
        }
    });
});

$("#login_id, #login_pw").keyup(function(e) {
    if(e.code == "Enter" ) {
        $("#access").click();
    }
});






