<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .adminQnaTable{
        width: 500px;
    }

</style>

<div style="border: 1px solid gray">

    제목 : ${dto.subject} <br>
    작성일 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /><br>
    작성자 : ${dto.qna_name}<br>
    email : ${dto.qna_email}<br>
    호텔 : ${dto.hotelname}<br>
    내용 : ${dto.content}<br>
    <c:if test="${dto.qna_photo != ''}">
    <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/qnaboard/${dto.qna_photo}?type=f&w=160&h=160&faceopt=true"
         onclick="location.href='https://kr.object.ncloudstorage.com/dreamsstaybucket/qnaboard/${dto.qna_photo}'">
    </c:if>
    <br>
    <div>
        <%--<button type="button" class="btn btn-outline-secondary" onclick="location.href = '/admin/qna'">목록</button>--%>
            <button type="button" class="btn btn-outline-secondary" onclick="location.href = '/qna/list/${sessionScope.currentPage}">목록</button>
        <c:if test="${dto.answer== '답변대기'}">
            <button type="button" class="btn btn-outline-secondary" id="delQna">삭제</button>
            <button type="button" class="btn btn-outline-secondary">수정</button>
        </c:if>
    </div>
</div>

<c:if test="${dto.answer== '답변완료'}">
    <div class="anserwqna" style="border: 1px solid gray; height: 200px;">

        <span>관리자 답글</span>
        <span>${dto.answer_text}</span>
    </div>
</c:if>

<form action="./answerupdate" method="post">
    <input type="hidden" name="num" value="${dto.num}">
    <div>
        <textarea style="width: 700px; height: 200px;" name="answer_text"></textarea><br>
        <button type="submit" class="btn btn-outline-secondary">답변완료</button>
    </div>
</form>


