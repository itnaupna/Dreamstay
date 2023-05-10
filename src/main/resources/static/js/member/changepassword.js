let confirm_pw = false;
let confirm_pwform = false;
let pw;
let pwchk;
// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
let regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
$("#findpw_pw").on("input", function() {
    pw = $("#findpw_pw").val();
    if (pw.match(regExp) == null) {
        //정규식에 맞지않으면 return null
        $("#findpw_pwform").text("비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다").css("color", "red")
        confirm_pwform = false;
        console.log("confirm_pwform=" + confirm_pwform);
    } else {
        $("#findpw_pwform").text("사용가능한 비밀번호 입니다").css("color", "green");
        confirm_pwform = true;
        console.log("confirm_pwform=" + confirm_pwform);
    }
});

// 비밀번호 일치할때 text랑 color 변경
$("#findpw_pw, #findpw_pw2").on('input', function() {
    pw = $("#findpw_pw").val();
    pwchk = $("#findpw_pw2").val();

    if (pw != pwchk || pwchk.match(regExp) == null) {
        $("#findpw_pwchk").text("비밀번호가 일치하지 않습니다").css("color", "red");
        confirm_pw = false;
    } else if(pwchk != "" && pw == pwchk && pwchk.match(regExp) != null){
        $("#findpw_pwchk").text("비밀번호가 일치합니다").css("color", "green");
        confirm_pw = true;
    }
});

$("#changepassword_confirm").click(function() {
    if(confirm_pwform && confirm_pw) {
        alert("비밀번호가 재설정 되었습니다 변경된 비밀번호로 로그인 하십시오");
        $("#findpw_submit").submit();
    }
});