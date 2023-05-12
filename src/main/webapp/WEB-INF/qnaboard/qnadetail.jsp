<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


<h1>detail</h1>

<div style="border: 1px solid gray">

        제목 : ${dto.subject} <br>
        작성일 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /><br>
        작성자 : ${dto.qna_name}<br>
        email : ${dto.qna_email}<br>
        호텔 : ${dto.hotelname}<br>
        내용 : ${dto.content}<br>
        <c:if test="${dto.qna_photo != ''}">
            <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/qna_board/${dto.qna_photo}?type=f&w=160&h=160&faceopt=true">
        </c:if>
    <br>
    <div>
        <button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록</button>
        <c:if test="${dto.answer== '답변대기'}">
            <button type="button" class="btn btn-outline-secondary" id="delQna">삭제</button>
            <button type="button" class="btn btn-outline-secondary">수정</button>
        </c:if>
    </div>

</div>
<br>
<c:if test="${dto.answer_text !=''}">
<div class="anserwqna" style="border: 1px solid gray; height: 200px;">

        <span>관리자 답글 : ${dto.answer_text}</span>

</div>
</c:if>

<br>
<form action="/answerupdate" method="post">
    <input type="hidden" name="num" value="${dto.num}">
 <div>
     <textarea style="width: 700px; height: 200px;" name="answer_text"></textarea><br>
     <button type="submit" class="btn btn-outline-secondary">답변완료</button>
 </div>
</form>


<script type="text/javascript">
    $("#delQna").click(function (){
        let a = confirm("삭제하려면 확인을 누르세요");
        if(a){
            location.href="/mypage/deleteqna?num="+${dto.num}
        }
    });

</script>