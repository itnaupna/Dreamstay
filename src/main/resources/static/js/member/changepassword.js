// let f_pw = false;
// let f_pwform = false;
// let pw;
// let pwchk;
// $("#findpw_pw").on("input", function() {
//     // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
//     let regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//     pw = $("#pw").val();
//     pwchk = $("#pwchk").val();
//     if (pw.match(regExp) == null) {
//         //정규식에 맞지않으면 return null
//         $("#pwform").text("비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다");
//         $("#pwform").css("color", "red");
//         f_pwform = false;
//         console.log("f_pwform=" + f_pwform);
//     }
//     else {
//         $("#pwform").text("사용가능한 비밀번호 입니다");
//         $("#pwform").css("color", "green");
//         f_pwform = true;
//         console.log("f_pwform=" + f_pwform);
//     }
// });
//
// // 비밀번호 일치할때 text랑 color 변경
// $("#findpw_pw2").on('input', function() {
//     pw = $("#pw").val();
//     pwchk = $("#pwchk").val();
//
//     if (pw != pwchk) {
//         $("#successpwCheck").text("비밀번호가 일치하지 않습니다");
//         $("#successpwCheck").css("color", "red");
//         f_pw = false;
//     } else {
//         $("#successpwCheck").text("비밀번호가 일치합니다");
//         $("#successpwCheck").css("color", "green");
//         f_pw = true;
//     }
// });