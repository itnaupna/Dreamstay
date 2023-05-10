let timer = "";
let joinConfirm =
    {"c_name" : false, "c_id" : false, "c_pwform" : false, "c_pw" : false, "c_email" : false, "c_phonenum" : false, "c_addr" : false};

window.onload = function () {
    document.getElementById("search_addr").addEventListener("click", function () {
        //주소입력칸을 클릭하면카카오 지도 발생
        new daum.Postcode({
            oncomplete: function (data) { //선택시 입력값 세팅
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr").value = data.address; // 주소 넣기
                joinConfirm.c_addr = true;
                console.log("addr = " + joinConfirm.c_addr);
                $("#join_null_check_addr").html("");
                document.querySelector("input[name=addrdetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
//우편번호, 주소 text박스에 포커싱 될 시 우편번호 검색 클릭후 포커싱
$("#zipcode, #addr").focus(function() {
   $("#search_addr").click();
   $("#search_addr").focus();
});

// 이메일 select box 이벤트
$("#join_domain").click(  function () {
    $("#signup_custom_option").slideToggle().css("left", $(this).position().left + 30);
});

// select option 선택시 domain 에 적용
$(".signup_select_option").click(function() {
    if($(this).text() == "직접 입력") {
        $("#email_domain").val("").attr("readonly", false);
        $("#join_domain").text($(this).text()).click();
    } else {
        $("#email_domain").val($(this).text()).attr("readonly", true);
        $("#join_domain").text($(this).text()).click();
    }
});

// 이메일 인증번호 전송 이벤트
$('#SendEmailBtn').click(function (e) {
    joinConfirm.c_email = false;
    let email = $("#email").val() + "@" + $("#email_domain").val();
    if($("#email").val() == ""|| $("#email_domain").val() == "") {
        $("#join_email_notice").html("이메일을 입력해주세요").css("color", "red");
    } else {
        $("#join_email_notice").html("");
        e.preventDefault(); // 기존의 form 전송 방지
        $.ajax({
            type: "post",
            url: "/signup/overlapemail",
            data: {"email" : email},
            success: function(overlap) {
                if(overlap != 0) {
                    alert("가입된 이메일입니다");
                } else {
                    $.ajax({
                        type: 'post',
                        url: '/signup/sendemail',
                        data: {"email" : email}, // 이메일 정보를 전달
                        success: function () {
                            alert('인증번호가 발송되었습니다');
                            clearInterval(timer);
                            $("#timer").html("");
                            let time = 180;// 발송 성공시
                            let min = "";
                            let sec = "";
                            timer =  setInterval(function() {
                                min = parseInt(time / 60);
                                sec = time % 60;

                                $("#timer").html(min + "분" + sec + "초").css("color", "red");
                                time--;

                                if (time < 0) {
                                    $.ajax({
                                        type: "post",
                                        url: '/signup/deletemail',
                                        data: {"email": email},
                                        success: function() {
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
    }
});
// 이메일 인증번호 확인 버튼 이벤트
$('#CheckEmailBtn').click(function (e) {
    // 인증번호 입력, 이메일 값 가져오기
    let email_code = $("#email_code").val();
    let email = $("#email").val() + "@" + $("#email_domain").val();

    e.preventDefault(); // 기존의 form 전송 방지

    $.ajax({
        type: 'post',
        url: '/signup/checkemail',
        data: {"email_code": email_code, "email": email},
        success: function (data) {
            if(joinConfirm.c_email == true) {
                alert("인증 되었습니다");
                return;
            }
            if (data === true) { // data 가 success 일 때
                clearInterval(timer);
                $("#timer").html("");
                joinConfirm.c_email = true;
                $("#join_code_chk").html("");
                console.log("email=" + joinConfirm.c_email);
                alert("인증번호가 일치합니다");
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
    console.log(id.length);
    if(id != "" && (id.length >= 5 && id.length <= 15)) {
        $.ajax({
            type: 'get',
            url: '/signup/overlapid',
            data: {"id": id},
            success: function (data) {
                if (data == 0) {
                    alert("사용가능한 아이디입니다");
                    $("#join_idchk").html("");
                    joinConfirm.c_id = true;
                    console.log("id=" + joinConfirm.c_id);
                } else {
                    alert("중복된 아이디 입니다.");
                }
            },
            error: function () {
                alert('중복확인 오류메세지입니다');
            }
        });
    } else {
        alert("아이디는 5자리 이상 15이하로 사용가능합니다");
    }

});
let pw;
let pwchk;
// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
let regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
$("#pw").on("input", function() {
    pw = $("#pw").val();
    if (pw.match(regExp) == null) {
        //정규식에 맞지않으면 return null
        $("#pwform").text("비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다").css("color", "red");
        joinConfirm.c_pwform = false;
        console.log("pwform=" + joinConfirm.c_pwform);
    } else {
        $("#pwform").text("사용가능한 비밀번호 입니다").css("color", "green");
        joinConfirm.c_pwform = true;
        console.log("pwform=" + joinConfirm.c_pwform);
    }
});

// 비밀번호 일치할때 text랑 color 변경
$("#pw, #pwchk").on('input', function() {
    pw = $("#pw").val();
    pwchk = $("#pwchk").val();

    if (pw != pwchk || pwchk.match(regExp) == null) {
        $("#successpwCheck").text("비밀번호가 일치하지않습니다").css("color", "red");
        joinConfirm.c_pw = false;
    } else if(pwchk != "" && pw == pwchk && pwchk.match(regExp) != null){
        $("#successpwCheck").text("비밀번호가 일치합니다").css("color", "green");
        joinConfirm.c_pw = true;
    }
});

// 이메일 인증, 중복확인, 비밀번호 확인 중 한개라도 하지 않을 시 가입 x
$("#signupBtn").click(function(){
        if(joinConfirm.c_addr == false) {
            $("#join_null_check_addr").html("주소를 입력해주세요").css("color", "red");
            $("#search_addr").focus();
        }
        if(joinConfirm.c_phonenum == false) {
            $("#join_null_check_phonenum").html("휴대폰 번호를 입력해주세요").css("color", "red");
            $("#phone").focus();
        }
        if (joinConfirm.c_email == false) {
            $("#join_code_chk").html("인증확인이 필요합니다").css("color", "red");
            $("#email_code").focus();
        }
        if (joinConfirm.c_pw == false || joinConfirm.c_pwform == false) {
            $("#pwform").text("비밀번호는 특수문자, 문자, 숫자 포함 8 ~ 15 자리의 형태로 사용 가능합니다").css("color", "red");
            $("#pw").focus();
        }
        if (joinConfirm.c_id == false) {
            $("#join_idchk").html("중복확인이 필요합니다").css("color", "red");
            $("#id").focus();
        }
        if (joinConfirm.c_name == false) {
            $("#join_null_check_name").html("이름을 입력해주세요").css("color", "red");
            $("#family_name").focus();
        }
        if(joinConfirm.c_name && joinConfirm.c_id && joinConfirm.c_pw && joinConfirm.c_pwform && joinConfirm.c_email && joinConfirm.c_phonenum && joinConfirm.c_addr) {
            $("#join_form").submit();
        }

});


$("#family_name, #user_name").on("input", function() {
    if($("family_name").val() != "" && $("#user_name").val() != "") {
        $("#join_null_check_name").html("");
        joinConfirm.c_name = true;
        console.log(joinConfirm.c_name);
    }
});

// 아이디 중복검사 후 아이디 변경 시 다시 중복검사
$("#id").on("input", function() {
    joinConfirm.c_id = false;
    console.log("id=" + joinConfirm.c_id);
});

// 이메일 인증 후 이메일을 바꿀 시 재인증
$("#email").on("input", function(){
    joinConfirm.c_email = false;
    console.log("email=" + joinConfirm.c_email);
});

$("#phone").on("input", function() {
    if($(this).val() != "") {
        joinConfirm.c_phonenum = true;
        $("#join_null_check_phonenum").html("");
    }
});

$("#signup_back").click(function() {
    location.href="/";
});

