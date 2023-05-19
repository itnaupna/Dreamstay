<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .noticeboard_content {
        display: none;
    }

    #noticeboard_mainbox {
        /*border: 1px solid red; !*영역*!*/
        width: 1200px;
        margin: 180px auto 0 auto;
    }

    #noticeboard_mainbox span {
        display: inline-block;
    }

    #noticeboard_headbox {
        /*border: 1px solid green; !*영역*!*/
    }

    #noticeboard_head {
        font-size: 50px;
        font-weight: bold;
    }

    #noticeboard_searchbox {
        /*border: 1px solid hotpink; !*영역*!*/
        margin: 20px 0 20px 0;
    }

    #noticeboard_search {
        margin: 0 30px 0 0;
        border: none;
        border-bottom: 1px solid #cccccc;
        padding-left: 10px;
        width: 300px;
        height: 40px;
    }

    #noticeboard_search:focus {
        outline: none;
        border-bottom: 1px solid black;
    }

    #noticeboard_searchbtn {
        height: 40px;
        width: 100px;
        border: 1px solid black;
        background-color: black;
        color: white;
        font-size: 18px;
    }

    #noticeboard_searchbtn:hover {
        background-color: white;
        color: black;
    }

    #noticeboard_titlebox {
        /*border: 1px solid orange; !*영역*!*/
        height: 80px;
        line-height: 80px;
        border-top: 3px solid #bbbbbb;
        border-bottom: 2px solid #bbbbbb;
    }

    #noticeboard_titlebox span {
        font-size: 22px;
        font-weight: bold;
        color: #999999;
    }

    .noticeboard_title {
        width: 550px;
        margin: 0 0 0 50px;
    }
    .noticeboard_witer {
        text-align: center;
        width: 250px;
        margin: 0 0 0 0;
    }
    .noticeboard_writeday{
        text-align: center;
        width: 200px;
        margin: 0 0 0 0;
    }
    .noticeboard_view {
        text-align: center;
        width: 100px;
        margin: 0 0 0 0;
    }
    #noticeboard_noticebox {
        /*border: 1px solid gray; !*영역*!*/
    }

    #noticeboard_subjectbox{
        /*border: 1px solid purple; !*영역*!*/
        height: 60px;
        line-height: 60px;
        border-bottom: 1px solid #aaaaaa;
        cursor: pointer;
    }

    #noticeboard_subjectbox span{
        font-size: 18px;
    }

    #noticeboard_contentbox {
        /*border: 1px solid green; !*영역*!*/
        height: 500px;
        overflow-y: scroll;
        padding: 25px 50px 25px 50px;
        border-bottom: 1px solid #aaaaaa;
    }

    #noticeboard_pagingbox {
        /*border: 1px solid blue; !*영역*!*/
        height: 50px;
        line-height: 50px;
        text-align: center;
        margin: 10px 0 10px 0;
    }

    #noticeboard_pagingbox a {
        display: inline-block;
        text-decoration: none;
        color: black;

    }
    .noticeboard_paging {
        font-size: 20px;
        font-weight: bold;
    }
    .noticeboard_page {
        width: 50px;
        height: 50px;
        font-size: 18px;
    }


</style>

<div id="noticeboard_mainbox">
    <div id="noticeboard_headbox">
        <span id="noticeboard_head">Notice</span>
    </div>
    <div id="noticeboard_searchbox">
        <input type="text" id="noticeboard_search" placeholder="제목을 입력해주세요" value="${search}">
        <button type="button" id="noticeboard_searchbtn">검색</button>
    </div>
    <div id="noticeboard_titlebox">
        <span class="noticeboard_title">제목</span>
        <span class="noticeboard_witer">작성자</span>
        <span class="noticeboard_writeday">작성일</span>
        <span class="noticeboard_view">조회수</span>
    </div>
    <c:forEach var="notice" items="${data}">
        <div id="noticeboard_noticebox">
            <div class="noticeboard_subject" id="noticeboard_subjectbox" value="${notice.num}">
                <span class="noticeboard_title">${notice.num} ${notice.subject}</span>
                <span class="noticeboard_witer">${notice.writer}</span>
                <span class="noticeboard_writeday"><fmt:formatDate value="${notice.writeday}" pattern="yyyy-MM-dd H:mm"/></span>
                <span class="noticeboard_viewcnt noticeboard_view">${notice.count}</span>
            </div>
            <div class="noticeboard_content" id="noticeboard_contentbox">
                <span>${notice.content}</span>
            </div>
        </div>
    </c:forEach>
    <!-- 페이징 처리 -->
    <div id="noticeboard_pagingbox">
        <!-- 이전 -->
        <c:if test="${paging.startPage>1}">
            <a href="/notice/noticeboard?currentPage=${paging.startPage - 1}&search=${search}" class="noticeboard_paging"><</a>
        </c:if>
        &nbsp;
        <!-- 페이지번호 출력 -->
        <c:forEach var="pp" begin="${paging.startPage}" end="${paging.endPage}">
            <c:if test="${paging.currentPage == pp}">
                <a href="/notice/noticeboard?currentPage=${pp}&search=${search}" class="noticeboard_page" style="border: 1px solid black; color: black;">${pp}</a>
            </c:if>
            <c:if test="${paging.currentPage != pp}">
                <a href="/notice/noticeboard?currentPage=${pp}&search=${search}" class="noticeboard_page" style="border: 1px solid #cccccc; color: #cccccc;">${pp}</a>
            </c:if>
            &nbsp;
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${paging.endPage < paging.totalPage}">
            <a href="/notice/noticeboard?currentPage=${paging.endPage+1}&search=${search}" class="noticeboard_paging">></a>
        </c:if>
    </div>
</div>

<script>
    $(".noticeboard_subject").click(function() {
        let num = $(this).attr("value");
        let target = $(this);
        if($(this).next().is(":visible")) {
            // $(".noticeboard_content").css("display", "none");
            console.log(true);
        } else {
            $(".noticeboard_subject").not($(this)).next().slideUp();
            $.ajax({
                url: "/notice/viewcount",
                data: {"num": num},
                type: "post",
                success: function(data) {
                    console.log(data);
                    target.find('span.noticeboard_viewcnt').text(data);
                }
            });
        }
       $(this).next().slideToggle();
    });

    $("#noticeboard_searchbtn").click(function() {
        searchValue = $("#noticeboard_search").val();
        location.href = "/notice/noticeboard?search=" + searchValue;
    });
</script>