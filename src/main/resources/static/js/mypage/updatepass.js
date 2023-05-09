// 현재 비밀 번호 입력시 텍스트,글씨색깔 변경 후 new pw 의 readonly 를 변경해줌
$("#login_pw").on("keyup", function() {
    let pw = $(this).val();
    if (pw === "") {
        $("#ch_pw").prop("readonly", true);
        $("#ch_pw1").prop("readonly", true);
        $("#ps_passck").hide();
    } else {
        $.ajax({
            url: "/mypage/chkidpw",
            data: {"pw": pw},
            type: "post",
            success:function (res){
                if(res === 1 ){
                    $("#nowpwch").text("비밀번호가 맞습니다.");
                    $("#nowpwch").css("color", "green");
                    $("#ch_pw").prop("readonly", false);
                    $("#ch_pw1").prop("readonly", false);
                    $("#ps_passck").show(300);
                } else {
                    $("#nowpwch").text("현재 비밀번호가 일치하지 않습니다");
                    $("#nowpwch").css("color", "red");
                    $("#ch_pw").prop("readonly", true);
                    $("#ch_pw1").prop("readonly", true);
                    $("#ps_passck").hide();
                }
            }
        });
    }
});

// 비밀번호 변경 버튼 클릭 시 ..
$("#updatebtn").click(function (){
    let pw = $("#login_pw").val(); // 원래 비밀번호
    let chpw = $("#ch_pw").val(); // 새로 변경할 비밀번호 1
    let chpw1 = $("#ch_pw1").val(); // 새로 변경할 비밀번호 2
    console.log(pw);
    let regExp = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

    if (chpw.match(regExp) == null) {
        alert("새로운 비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 12 자리의 형태로 사용 가능합니다");
        return;
    }

    if (chpw !== chpw1) {
        alert("새로운 비밀번호와 비밀번호 확인 값이 일치하지 않습니다. 다시 확인해주세요.");
        return;
    }


    $.ajax({
        url: "/mypage/chkidpw",
        data: {"pw": pw},
        type: "post",
        success:function (res){
            if(res === 1 ){
                if (chpw === chpw1){
                    $.ajax({
                        url: "/mypage/changepw",
                        data: {"chpw":chpw},
                        type: "post",
                        success:function(res){
                            if (res===1){
                                alert("비밀번호 변경되었습니다");
                                location.href="/mypage";
                            } else{
                                alert("비밀번호 변경에 실패했습니다.");
                            }
                        }
                    });
                } else {
                    alert("새로운 비밀번호와 비밀번호 확인 값이 일치하지 않습니다. 다시 확인해주세요.");
                }
            } else {
                $("#nowpwch").text("비밀번호가 맞지않습니다. 다시 입력해주세요");
                $("#nowpwch").css("color","red");
            }
        }
    });
});