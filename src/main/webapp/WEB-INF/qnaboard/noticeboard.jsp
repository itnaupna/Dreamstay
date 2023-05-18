<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .noticeboard_content {
        display: none;
    }
</style>
<br><br><br><br><br><br><br><br><br>

<div>
    <div>
        <span>제목</span>
        <span>작성자</span>
        <span>작성일</span>
        <span>조회수</span>
    </div>
    <c:forEach var="notice" items="${data}">
        <div>
            <div class="noticeboard_subject" value="${notice.num}">
                <span>${notice.num} ${notice.subject}</span>
                <span>${notice.writer}</span>
                <span>${notice.writeday}</span>
                <span class="noticeboard_viewcnt">${notice.count}</span>
            </div>
            <div class="noticeboard_content">
                <span>${notice.content}</span>
            </div>
        </div>
    </c:forEach>
    <!-- 페이징 처리 -->
    <div>
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
       // $(".noticeboard_content").css("display", "none");
        let num = $(this).attr("value");
        let target = $(this);
        if($(this).next().is(":visible")) {
            console.log(true);
        } else {
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
</script>