<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2023-05-10
  Time: 10:55:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .answer_before{
        background-color: #fff;
        border: 1px solid #73685D;
        padding: 6px;
    }

    .answer_after{
        background-color: #73685D;
        border: 1px solid #73685D;
        color: #fff;
        padding: 6px;
    }



</style>

<table id="qnaTable" class="table-bordered">
    <caption>
        <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square" style="padding-right:8px;"></i>Write</button>
    </caption>
    <thead>
    <tr>
        <th>num</th>
        <th>subject</th>
        <th>writer</th>
        <th>answer</th>
        <th>writeday</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${qnaList}" var="dto" varStatus="num">
        <tr>
            <td>${num.count}</td>
            <td><span class="qna_sub">${dto.subject}</span></td>
            <td>${dto.writer}</td>
            <c:if test="${dto.answer=='답변대기'}">
                <td><span class="answer_before">${dto.answer}</span></td>
            </c:if>
            <c:if test="${dto.answer=='답변완료'}">
                <td><span class="answer_after">${dto.answer}</span></td>
            </c:if>
            <td><fmt:formatDate value="${dto.writeday}" type="both"/> </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="5">
            <c:if test="${page[0]>10}">
                <span class="pagenumber" onclick="Paging(${page[0]-1})">&lt;</span>
            </c:if>
            <c:forEach begin="${page[0]}" end="${page[2]}" var="i">
                <c:if test="${i==page[1]}">
                    <span class="currpage pagenumber">${i}</span>
                </c:if>
                <c:if test="${i!=page[1]}">
                    <span class="pagenumber" onclick="Paging(${i})">${i}</span>
                </c:if>
            </c:forEach>
            <c:if test="${page[2]<page[3]}">
                <span class="pagenumber" onclick="Paging(${page[2]+1})">&gt;</span>
            </c:if>
        </td>
    </tr>
    </tfoot>
</table>
<style>
    .currpage{
        font-weight:bolder;
    }
    th {
        text-align: left;
    }

    thead {
        font-weight: bold;
        color: #fff;
        background: #73685d;
    }
    td, th {
        padding: 1em .5em;
        vertical-align: middle;
        text-align: center;
    }
    td, th tr{
        font-size:.7rem;
        color:#5a5c69!important;
        font-weight: 700!important;
    }
    #qnaTable{
        width: 100%;
    }
</style>

