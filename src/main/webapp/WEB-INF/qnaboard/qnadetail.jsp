<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


<h1>detail</h1>

<table class="table table">
    <tr>
        <td>제목 : ${dto.subject}</td>
        <td>작성일 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
    </tr>
    <tr>
        <td>작성자 : ${dto.qna_name}</td>
        <td>email : ${dto.qna_email}</td>
    </tr>
    <tr>
        <td>호텔 : ${dto.hotelname}</td>
    </tr>
    <tr>
        <td>내용 : ${dto.content}</td>
    </tr>

    <tr>
        <td colspan="2">
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록</button>
        </td>
    </tr>

</table>