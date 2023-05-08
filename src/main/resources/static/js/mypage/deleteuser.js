$("#deleteBtn").click(function() {
    let pw = $("#deleteform_pw").val();
    console.log(pw);
    $.ajax({
        url: "/mypage/chkidpw",
        data: {"pw" : pw},
        type: "post",
        success: function(date) {
            if(date == 1) {
                location.href="/mypage/deleteuser";
            } else {
                alert("비밀번호가 틀렸습니다");
            }
        }

    });
});