<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script type="text/javascript">
    var naver_id_login = new naver_id_login("2plAFu6gKZlsog8ZfGkK", "http://localhost:8080/signup/callbacknaver");
    // 접근 토큰 값 출력
    // alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        let naverEmail = naver_id_login.getProfileData('email');
        let id = naverEmail.split("@");
        let userName = naver_id_login.getProfileData('name');
        let social = "naver-";
        let issocial = 2;
        $.ajax({
            type: 'post',
            url: "/signup/naverlogin",
            data: {"email": naverEmail, "id": id[0], "user_name": userName, "issocial": issocial, "social": social},
            success: function () {
                alert("네이버 로그인");
                opener.location.href='http://localhost:8080/';
                window.close();
            }
        });
    }
</script>