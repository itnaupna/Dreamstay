<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .qnaboardlist {
        position: absolute;
        top: 150px;
    }

    .qnaboardlist a{
        text-decoration: none;
        color: #000;
    }


</style>

<div class="qnaboardlist">
    <table class="table table-bordered qmalisttable" style="width: 1100px;">
        <tr style="text-align: center">
            <td style="width: 250px">호텔</td>
            <td style="width: 600px">제목</td>
            <td style="width: 200px">답변상태</td>
            <td style="width: 200px">작성일</td>
        </tr>

        <c:forEach items="${qnaBoardList}" var="qnaBoardDto">
            <tr>
                <td>${qnaBoardDto.hotelname}</td>
                <td><span style="color: #989442">${qnaBoardDto.category_txt}</span>
                    <a href='/mypage/qnadetail?num=${qnaBoardDto.num}'>${qnaBoardDto.subject}</a>
                </td>
                <td>${qnaBoardDto.answer}</td>
                <td><fmt:formatDate value="${qnaBoardDto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
        </c:forEach>


    </table>

    <!-- 페이징 처리 -->
    <div  style="width: 700px;text-align: center;font-size: 17px;">
        <!-- 이전 -->
        <c:if test="${startPage>1}">
            <a style="color:black;text-decoration: none;cursor: pointer;"
               href="/mypage/qnalist?currentPage=${startPage-1}">이전</a>
        </c:if>
        &nbsp;
        <!-- 페이지번호 출력 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${currentPage==pp}">
                <a style="color:green;text-decoration: none;cursor: pointer;"
                   href="/mypage/qnalist?currentPage=${pp}">${pp}</a>
            </c:if>
            <c:if test="${currentPage!=pp}">
                <a style="color:black;text-decoration: none;cursor: pointer;"
                   href="/mypage/qnalist?currentPage=${pp}">${pp}</a>
            </c:if>
            &nbsp;
        </c:forEach>
        <!-- 다음 -->
        <c:if test="${endPage<totalPage}">
            <a style="color:black;text-decoration: none;cursor: pointer;"
               href="list?currentPage=${endPage+1}">다음</a>
        </c:if>
    </div>

</div>