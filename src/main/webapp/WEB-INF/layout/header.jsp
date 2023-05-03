<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/header.css" />

<script type="text/javascript">
    $(function(){
        //btn 메뉴 dropdown
        var dropdownBtn = document.querySelector('.resvBtn .btn_opener');
        var dropdownList = document.querySelector('.resvBtn .dropdown_list');

        dropdownBtn.addEventListener('click', function() {
            dropdownList.classList.toggle('open');
        });

        dropdownList.addEventListener('mouseleave', function() {
            dropdownList.classList.remove('open');
        });

        // 3줄 메뉴
        var dropdownMenuBtn = document.querySelector('.resvBtn .btn_opener');
        var dropdownMenuList = document.querySelector('.resvBtn .dropdown_list');

        dropdownBtn.addEventListener('click', function() {
            dropdownList.classList.toggle('open');
        });

        dropdownList.addEventListener('mouseleave', function() {
            dropdownList.classList.remove('open');
        });



    });



</script>

<style>


</style>

<body>
<div class="wrapper mainWrapper">
    <div class="header">
        <div class="headArea">
            <strong class="logo">
                <a href="/">JOSUN HOTELS & RESORTS
                </a>
            </strong>
            <button type="button" class="btnMenu">메뉴 열기</button>

                <div class="topUtil">
                    <a href="" class="hotelFind" style="font-size: 8px;">
                        상품찾기
                    </a>
                </div>

                <div class="gnbUtil" >
                    <ul>
                        <li>
                            <a href="/login" id="login">로그인</a>
                        </li>
                        <li>
                            <a href="/signup" id="join">회원가입</a>
                        </li>
                        <li>
                        <a href="" id="confirmReserve">예약확인</a>
                        </li>
                    </ul>


                <div class="resvBtn">
                    <div class="dropdown_list" aria-expanded="false">
                        <div class="dropdown_value" style="font-size: 10px;">
                            <button type="button" aria-label="목록열기" class="btn_opener">RESERVATION</button>
                        </div>
                        <ul class="item_list" role="listbox" style="width: 120px;">
                            <li role="option" style="font-size: 10px"><a href="">ROOM</a></li>
                            <li role="option" style="font-size: 10px"><a href="">MEMBERSHIP</a></li>
                        </ul>
                    </div>
                </div>

        </div> <%--headArea END--%>

    </div> <%--head END--%>

</div> <%--wrapper mainWrapper END--%>



</body>
