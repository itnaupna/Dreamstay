<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .qnaboardlist {
        position: absolute;
        top: 80px;
        width: 100% !important;
    }

    .qnaboardlist a{
        text-decoration: none;
        color: #000;
    }

    .qnatr{
       /* background-color: #001100;*/
        color: black;
    }

    #qmalisttable{
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }

    #qmalisttable tr{
        height: 80px;
        border-bottom: 1px solid lightgray ;
        z-index: 10;

    }


    .qnaboardlist tr td {
        vertical-align: middle;
    }

    .qnatr{
        height: 80px !important;
        border-bottom: 3px solid lightgray !important;
    }

    .answerend{
        background-color: #001100;
        color: #fff;
        padding: 6px;
        border: 1px solid #001100;
        font-size: 15px;
    }

    .answerstart{
        color: #000;
        padding: 6px;
        border: 1px solid #001100;
        font-size: 15px;
    }




</style>



<div class="qnaboardlist">
    <%--<span>Customer Service</span>--%>
    <table class="table table" id="qmalisttable">
      <tr style="text-align: center;" class="qnatr">
            <td style="width: 250px">호텔</td>
            <td style="width: 600px">제목</td>
            <td style="width: 200px">답변상태</td>
            <td style="width: 200px">작성일</td>
        </tr>

        <c:forEach items="${qnaBoardList}" var="qnaBoardDto">

            <c:if test="${qnaBoardList.size() == 0}">
                <tr>
                    <td colspan="5">등록된 게시물이 없습니다.</td>
                </tr>
            </c:if>

            <tr>
                <td>${qnaBoardDto.hotelname}</td>
                <td>
                    <a href='/mypage/qnadetail?num=${qnaBoardDto.num}'><span style="color: #989442">${qnaBoardDto.category_txt}</span>
                    ${qnaBoardDto.subject}</a>
                </td>
                <c:if test="${qnaBoardDto.answer=='답변대기'}">
                    <td><span class="answerstart">${qnaBoardDto.answer}</span></td>
                </c:if>
                <c:if test="${qnaBoardDto.answer=='답변완료'}">
                    <td><span class="answerend">${qnaBoardDto.answer}</span></td>
                </c:if>
                <td><fmt:formatDate value="${qnaBoardDto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
        </c:forEach>


    </table>

    <br>
    <!-- 페이징 처리 -->
    <div  style="width: 100%;text-align: center;font-size: 17px; ">
        <!-- 이전 -->
        <c:if test="${startPage>1}">
            <a style="color:black;text-decoration: none;cursor: pointer;"
               href="/mypage/qnalist?currentPage=${startPage-1}">이전</a>
        </c:if>
        &nbsp;
        <!-- 페이지번호 출력 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${currentPage==pp}">
                <a style="color:#989442;text-decoration: none;cursor: pointer;"
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