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
    .f_footer{
        position: relative;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 1;
        height: 400px;
        width: 100%;
        background-color: black;
        /*display: none;*/

        /*font-family: notokrL, gothamL, playfair,;*/
        /*box-sizing: border-box;*/
    }

    /* top1 div 위치 크기 설정 */
    .f_top1{
        display: flex;
        position: relative;
        /*border: 2px solid yellow;*/
        width: 1800px;
        height: 150px;
        margin: 0 auto;
    }

    /* 정렬 */
    .f_footer .f_top1 .f_toplogo{
        text-align: center;
    }

    /* img 크기, 마진설정 */
    .f_footer .f_top1 .f_toplogo img{
        display: inline-block;
        width: 90px;
        height: auto;
        margin: 50px 50px auto;
        /*vertical-align: middle;*/
        align-content: space-between;
    }

    /* 두번째 div */
    .f_footer .f_top2{
        display: flex;
        text-align: center;
        /*border: 3px solid red;*/
        width: 1800px;
        height: 230px;
        /*margin: 0 50px;*/

        /*vertical-align: middle;*/
    }

    .f_footer .f_top2 .f_logo{
        display: flex;
        align-items: center;
        /*border: 1px solid aqua;*/
        width: 250px;
        height: 230px;
        justify-content:  center;
    }

    .f_footer .f_top2 .f_banner{
        /*border: 2px solid beige;*/
        width: 1200px;
    }

    .f_footer .f_top2 .f_banner .f_info{
        /*border: 3px solid chartreuse;*/
        margin: 0 70px 20px 0;
        width: 900px;
        height: 100px;
    }

    .f_footer .f_top2 .f_banner .f_info a{
        display: inline-block;
        font-size: 15px;
        margin-right: 20px;
        color: white;
    }

    /* 개인정보 방침만 색상 다르게*/
    .f_footer .f_top2 .f_banner .f_info .f_gaein{
        color: #989442;
    }

    .f_footer .f_top2 .f_banner .f_company{
        /*border: 2px dotted pink;*/
        width: 900px;
        height: 100px;
        font-size: 14px;
        color: #ccc;
    }


    .f_itemlist {
        position: relative;
        display: none;

        /* 테스트 */
        z-index: 101;
    }

    .f_footer .f_top2 .f_dropdown_list{
        border: 3px dashed coral;
        width: 200px;
        z-index: 100;
        min-width: 200px;

        /* 테스트 */
        position: relative;
    }

    /* 리스트의 폰트 색상 설정*/
    .f_footer .f_top2 .f_dropdown_list .f_itemlist{
        color: white;
    }

    /* 버튼과 input 의 위치를 일정하게 위치*/
    .f_footer .f_top2 .f_dropdown_list .f_dropdown_value{
        position: relative;
    }

    .f_footer .f_top2 .f_dropdown_list .f_dropdown_value .f_btnopener{
        border: 3px solid fuchsia;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100px;
        height: 100%;
        /*border: 0;*/
        display: block;
        position: absolute;
        outline: 0;
        background: none;
        overflow: hidden;
    }

    .f_footer .f_top2 .f_dropdown_list .f_dropdown_value input[type="text"]{
        font: 400 16px gothamL;
        color: #fff;
        opacity: .7;
        background: #000;
        text-transform: uppercase;
        width: 100%;
        height: 100%;
        border: none;
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
                <a href="#">영상정보처리기기운영·관리방침</a>
                <a href="#">이메일무단수집금지</a>
            </div>
            <div class="f_company">
                <p>서울시 강남구 Dream Stay <span class="ceo">대표이사 </span><span class="tel">T. 02-123-4567</span></p>
                <p>사업자등록번호 222-11-00000 통신판매신고번호 강남 0000호</p>
                <p>© 2023 Dream Stay &amp; RESORTS Co. All rights reserved.</p>
            </div>

        </div>
        <div class="f_dropdown_list" aria-expanded="false">
            <div class="f_dropdown_value">
                <input type="text" role="combobox" value="Family Sites" aria-expanded="false" tabindex="-1" readonly="">
                <button type="button" aria-label="목록열기" class="f_btnopener"><i></i></button>
            </div>
            <ul class="f_itemlist" role="listbox">
                <li role="option"><a href="#" target="_blank">신세계그룹 인사이드</a></li>
                <li role="option"><a href="#" target="_blank">SSG.COM</a></li>
                <li role="option"><a href="#" target="_blank">신세계TV쇼핑</a></li>
                <li role="option"><a href="#" target="_blank">신세계백화점</a></li>
                <li role="option"><a href="#" target="_blank">이마트</a></li>
                <li role="option"><a href="#" target="_blank">이마트 에브리데이</a></li>
                <li role="option"><a href="#" target="_blank">이마트24</a></li>
                <li role="option"><a href="#" target="_blank">까사미아</a></li>
                <li role="option"><a href="#" target="_blank">신세계인터내셔날</a></li>
                <li role="option"><a href="h#" target="_blank">신세계푸드</a></li>
                <li role="option"><a href="#" target="_blank">신세계건설</a></li>
                <li role="option"><a href="#" target="_blank">신세계I&amp;C</a></li>
                <li role="option"><a href="#" target="_blank">스타벅스커피코리아</a></li>
                <li role="option"><a href="#" target="_blank">신세계면세점</a></li>
                <li role="option"><a href="#" target="_blank">신세계사이먼</a></li>
                <li role="option"><a href="#" target="_blank">신세계 L&amp;B</a></li>
                <li role="option"><a href="#" target="_blank">신세계 프라퍼티</a></li>
                <li role="option"><a href="#" target="_blank">신세계센트럴시티</a></li>
            </ul>

<%--            <div class="f_sns">--%>
<%--                <div class="f_snsjosun"><a href="#" target="_blank">josun</a></div>--%>
<%--                <div class="f_kakao"><a href="#" target="_blank">kakao</a></div>--%>
<%--                <div class="f_insta"><a href="#" target="_blank">instagram</a></div>--%>
<%--                <div class="f_youtube"><a href="#" target="_blank">youtube</a></div>--%>
            </div>
<%--        </div>--%>
<%--    </div>--%>
</footer>