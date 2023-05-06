let f_id = false;
let f_pw = false;
let f_pwform = false;
let f_email = false;
let timer = "";


// 이메일 인증번호 전송 이벤트
$('#SendEmailBtn').click(function (e) {
    f_email = false;
    e.preventDefault(); // 기존의 form 전송 방지
    $.ajax({
        type: "post",
        url: "/signup/overlapemail",
        data: $("#email").serialize(),
        success: function(overlap) {
            if(overlap != 0) {
                alert("가입된 이메일입니다");
            } else {
                $.ajax({
                    type: 'POST',
                    url: '/signup/sendemail',
                    data: $('#email').serialize(), // 이메일 정보를 전달
                    success: function (data) {
                        alert('인증번호가 발송되었습니다');
                        let time = 180;// 발송 성공시
                        let min = "";
                        let sec = "";
                        timer =  setInterval(function() {
                            min = parseInt(time / 60);
                            sec = time % 60;

                            $("#timer").html(min + "분" + sec + "초");
                            time--;

                            var email = $("#email").val();

                            if (time < 0) {
                                $.ajax({
                                    type: "post",
                                    url: '/signup/deletemail',
                                    data: {"email": email},
                                    success: function(data) {
                                        $("#timer").html("");
                                        alert("인증 시간이 초과되었습니다");
                                        clearInterval(timer);
                                    }
                                });
                            }
                        }, 1000);// 발송 성공시 alert
                    },
                    error: function () {
                        alert('인증번호 발송에 실패하였습니다'); // 발송 실패시 alert
                    }
                });
            }
        }
    });

});
// 이메일 인증번호 확인 버튼 이벤트
$('#CheckEmailBtn').click(function (e) {
    // 인증번호 입력, 이메일 값 가져오기
    let email_code = $("#email_code").val();
    let email = $("#email").val();

    e.preventDefault(); // 기존의 form 전송 방지

    $.ajax({
        type: 'POST',
        url: '/signup/checkemail',
        data: {"email_code": email_code, "email": email},
        success: function (data) {
            if(f_email == true) {
                alert("인증 되었습니다");
                return;
            }
            if (data === true) { // data 가 success 일 때
                clearInterval(timer);
                $("#timer").html("");
                f_email = true;
                console.log("email=" + f_email);
                alert("인증번호가 맞습니다");
            } else {
                alert("인증번호가 일치하지 않습니다"); // 인증번호 일치하지 않을 때
            }

        },
        error: function () {
            alert('인증번호 확인에 실패하였습니다');
        }
    });
});

// 아이디 중복체크 스크립트
$("#id_check").click(function (e) {

    let id = $("#id").val();

    $.ajax({
        type: 'get',
        url: '/signup/overlapid',
        data: {"id": id},
        success: function (data) {
            if (data == 0) {
                alert("회원가입 가능한 아이디입니다");
                f_id = true;
                console.log("id=" + f_id);
            } else {
                alert("아이디가 이미 있습니다.");
            }
        },
        error: function () {
            alert('중복확인 오류메세지입니다');
        }
    });
});
let pw;
let pwchk;
$("#pw").on("input", function() {
    // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
    let regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    pw = $("#pw").val();
    pwchk = $("#pwchk").val();
    if (pw.match(regExp) == null) {
        //정규식에 맞지않으면 return null
        $("#pwform").text("비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다");
        $("#pwform").css("color", "red");
        f_pwform = false;
        console.log("f_pwform=" + f_pwform);
    }
    else {
        $("#pwform").text("사용가능한 비밀번호 입니다");
        $("#pwform").css("color", "green");
        f_pwform = true;
        console.log("f_pwform=" + f_pwform);
    }
});

// 비밀번호 일치할때 text랑 color 변경
$("#pw,#pwchk").on('input', function() {
    pw = $("#pw").val();
    pwchk = $("#pwchk").val();

    if (pw != pwchk) {
        $("#successpwCheck").text("비밀번호가 일치하지 않습니다");
        $("#successpwCheck").css("color", "red");
        f_pw = false;
    } else {
        $("#successpwCheck").text("비밀번호가 일치합니다");
        $("#successpwCheck").css("color", "green");
        f_pw = true;
    }
});

// 이메일 인증, 중복확인, 비밀번호 확인 중 한개라도 하지 않을 시 가입 x
$("#signupBtn").click(function(){
    console.log(f_email, f_id, f_pw, confirm_pwform);
    if(f_email == false) {
        alert("이메일 인증해주세요");
        $("#email_code").focus();
    } else if(f_id == false) {
        alert("아이디 중복확인 해주세요");
        $("#id").focus();
    } else if(f_pw == false || f_pwform == false) {
        alert("비밀번호를 확인해주세요");
        $("#pw").focus();
    }
});

// 이메일 인증 후 이메일을 바꿀 시 재인증
$("#email").on("input", function(){
    f_email = false;
    console.log("email=" + f_email);

});

// 아이디 중복검사 후 아이디 변경 시 다시 중복검사
$("#id").on("input", function() {
    f_id = false;
    console.log("id=" + f_id);
});
