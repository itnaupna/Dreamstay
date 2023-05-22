<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/qnaboard/noticeboard.css">

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
            <div class="noticeboard_subjectbox"  value="${notice.num}">
                <span class="noticeboard_title">${notice.subject}</span>
                <span class="noticeboard_witer">${notice.writer}</span>
                <span class="noticeboard_writeday"><fmt:formatDate value="${notice.writeday}" pattern="yyyy-MM-dd H:mm"/></span>
                <span class="noticeboard_viewcnt noticeboard_view">${notice.count}</span>
            </div>
            <div class="noticeboard_contentbox">
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

<script type="text/javascript" src="/js/qnaboard/noticeboard.js"></script>