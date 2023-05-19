<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@400&display=swap"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair Display SC:wght@400&display=swap"/>
<link rel="stylesheet" href="css/footer.css" type="text/css">
<script type="text/javascript" src="/js/footer.js"></script>
<style>
    /* footer 기본 틀 */
    .f_footer {
        position: relative;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 1;
        height: 400px;
        width: 100%;
        background-color: black;
    }

    /* top1 div 위치 크기 설정 */
    .f_top1 {
        display: flex;
        position: relative;
        /*border: 2px solid yellow;*/
        width: 1800px;
        height: 150px;
        margin: 0 auto;
    }

    /* 정렬 */
    .f_footer .f_top1 .f_toplogo {
        text-align: center;
    }

    /* img 크기, 마진설정 */
    .f_footer .f_top1 .f_toplogo img {
        display: inline-block;
        width: 90px;
        height: auto;
        margin: 50px 50px auto;
        /*vertical-align: middle;*/
        align-content: space-between;
    }

    /* 두번째 div */
    .f_footer .f_top2 {
        display: flex;
        text-align: center;
        /*border: 3px solid red;*/
        width: 1800px;
        height: 230px;
        /*margin: 0 50px;*/

        /*vertical-align: middle;*/
    }

    .f_footer .f_top2 .f_logo {
        display: flex;
        align-items: center;
        /*border: 1px solid aqua;*/
        width: 250px;
        height: 230px;
        justify-content: center;
    }

    .f_footer .f_top2 .f_banner {
        /*border: 2px solid beige;*/
        width: 1200px;
        margin-left: auto;
        margin-right: auto;

    }

    .f_footer .f_top2 .f_banner .f_info {
        /*border: 3px solid chartreuse;*/
        /*float: left;*/
        width: 900px;
        height: 20px;
    }

    .f_footer .f_top2 .f_banner .f_info a {
        display: inline-block;
        font-size: 15px;
        margin-right: 20px;
        color: white;
    }

    /* 개인정보 방침만 색상 다르게*/
    .f_footer .f_top2 .f_banner .f_info .f_gaein {
        color: #989442;
    }

    .f_footer .f_top2 .f_banner .f_company {
        /*border: 2px dotted pink;*/
        width: 900px;
        height: 100px;
        font-size: 14px;
        color: #ccc;
        /*align-items: center;*/
        /*margin-top: 20px;*/
    }
    .f_footer .f_top2 .f_banner .f_company p{
        margin-top: 30px;
    }

    @media (max-width: 768px) {
        .f_top1 {
            width: 100%;
            height: auto;
            padding: 10px;
            box-sizing: border-box;
            flex-wrap: wrap;
        }

        .f_footer .f_top1 .f_toplogo img {
            margin: 10px;
        }

        .f_top2 {
            width: 100%;
            flex-wrap: wrap;
        }

        .f_logo {
            width: 100%;
            justify-content: center;
        }

        .f_banner {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        .f_banner .f_info {
            float: none;
            margin-bottom: 10px;
            width: 100%;
        }

        .f_footer .f_top2 .f_banner .f_info a {
            margin-right: 10px;
        }

        .f_footer .f_top2 .f_banner .f_company {
            width: 100%;
            font-size: 12px;
        }

        .f_footer .f_top2 .f_banner .f_company p {
            margin-top: 10px;
        }
    }
</style>
<footer class="f_footer">
    <div class="f_top1">
        <div class="f_toplogo">
            <a href="#"><img src="./photo/josu.png"></a>
            <a href="#"><img src="./photo/westinjosun.png"></a>
            <a href="#"><img src="./photo/westinjosunbusan.png"></a>
            <a href="#"><img src="./photo/grandjosunbusan.png"></a>
            <a href="#"><img src="./photo/grandjosunjeju.png"></a>
            <a href="#"><img src="./photo/Lescape.png"></a>
            <a href="#"><img src="./photo/gravity.png"></a>
            <a href="#"><img src="./photo/fourpoints.png"></a>
            <a href="#"><img src="./photo/fourpoints2.png"></a>
        </div>
    </div>

    <div class="f_top2">
        <div class="f_logo">
            <a href="#">
                <img src="./photo/josunresort.png">
            </a>
        </div>

        <div class="f_banner">
            <div class="f_info">
                <a href="#">고객센터</a>
                <a href="#">웹사이트 이용약관</a>
                <a href="#">멤버십 이용약관</a>
                <a href="#">모바일 상품권 이용약관</a>
                <a href="#">지류 이용권 이용약관</a>
                <a href="#" class="f_gaein">개인정보처리방침</a>
                <br>
                <div class="f_info2">
                    <a href="#">영상정보처리기기운영·관리방침</a>
                    <a href="#">이메일무단수집금지</a>
                </div>
            </div>
            <div class="f_company">
                <p>서울시 강남구 Dream Stay <span class="ceo">대표이사 </span><span class="tel">T. 02-123-4567</span></p>
                <p>사업자등록번호 222-11-00000 통신판매신고번호 강남 0000호</p>
                <p>© 2023 Dream Stay &amp; RESORTS Co. All rights reserved.</p>
            </div>

        </div>
    </div>

</footer>