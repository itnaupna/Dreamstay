
$("#access").click(function(){
    let login_id = $("#login_id").val();
    let login_pw = $("#login_pw").val();
    if(login_id == "") {
        alert("아이디를 입력해주세요");
        return;
    } else if(login_pw == "") {
        alert("비밀번호를 입력해주세요");
        return;
    }

    $.ajax({
        url: "/access",
        type: "post",
        data: {"id": login_id, "pw": login_pw},
        success: function(res) {
            if(res) {
                location.href = "/";
            } else {
                alert("아이디나 비밀번호를 확인해주세요");
            }
        }
    });
});




