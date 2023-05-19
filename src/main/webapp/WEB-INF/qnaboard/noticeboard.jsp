<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .noticeboard_content {
        display: none;
    }

    #noticeboard_mainbox {
        border: 1px solid red;
    }

    #noticeboard_searchbox {
        border: 1px solid hotpink;
    }

    #noticeboard_titlebox {
        border: 1px solid orange;
    }

    #noticeboard_noticebox {
        border: 1px solid gray;
    }

    #noticeboard_subjectbox{
        border: 1px solid purple;
    }

    #noticeboard_contentbox {
        border: 1px solid green;
    }

    #noticeboard_pagingbox {
        border: 1px solid blue;
    }


</style>
<br><br><br><br><br><br><br><br><br>

<div id="noticeboard_mainbox">
    <div id="noticeboard_searchbox">
        <input type="text" id="noticeboard_search">
        <button type="button" id="noticeboard_searchbtn">검색</button>
    </div>
    <div id="noticeboard_titlebox">
        <span>제목</span>
        <span>작성자</span>
        <span>작성일</span>
        <span>조회수</span>
    </div>
    <c:forEach var="notice" items="${data}">
        <div id="noticeboard_noticebox">
            <div class="noticeboard_subject" id="noticeboard_subjectbox" value="${notice.num}">
                <span>${notice.num} ${notice.subject}</span>
                <span>${notice.writer}</span>
                <span>${notice.writeday}</span>
                <span class="noticeboard_viewcnt">${notice.count}</span>
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
            <a href="/notice/noticeboard?currentPage=${paging.startPage - 1}">이전</a>
        </c:if>
        &nbsp;
        <!-- 페이지번호 출력 -->
        <c:forEach var="pp" begin="${paging.startPage}" end="${paging.endPage}">
            <c:if test="${paging.currentPage == pp}">
                <a href="/notice/noticeboard?currentPage=${pp}">${pp}</a>
            </c:if>
            <c:if test="${paging.currentPage != pp}">
                <a href="/notice/noticeboard?currentPage=${pp}">${pp}</a>
            </c:if>
            &nbsp;
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${paging.endPage < paging.totalPage}">
            <a href="/notice/noticeboard?currentPage=${paging.endPage+1}">다음</a>
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