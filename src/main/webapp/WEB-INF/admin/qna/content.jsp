<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    #adminqna{
        width: 1000px;
        font-size: 18px;
    }

    #admin_qnainfo{
        width: 1000px;
        font-size: 18px;
    }

    #adminqna .colortd{
        background-color: #F3F3F3;
        width: 200px;
        text-align: center;
    }

    #admin_qnainfo .colortd{
        background-color: #F3F3F3;
        width: 200px;
        text-align: center;
    }

    #admin_qnainfo .colortd>td{
        background-color: #F3F3F3;
        width: 200px;
        text-align: center;
    }

    .nonetd{
        width: 300px;
    }

    #answer_table{
        width: 1000px;
    }

    .answer_text{
       width: 1000px;
        height: 200px;
    }

    .dream{
        font-size: 25px;
        color: #001100;

    }

    .answer_text{
        border: none;
        resize: none;
    }

    .dream2{
        font-size: 20px;
    }


    #answeradmin .colortd{
        background-color: #F3F3F3;

    }

    .btnanswer, .btnlist, .btndel{
        width: 120px;
        height: 60px;
        padding: 0 25px;
        font-size: 15px;
        letter-spacing: -.01em;
        text-align: center;
        vertical-align: middle;
        background-color: black;
        color: white;
        border: thin solid #000000;
        border-radius: 0;
        cursor: pointer;
        overflow: hidden;
        z-index: 1;


    }

    .btnanswer:hover,.btnlist:hover, .btndel:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
        background-color: white;
        color: black;

    }

    .btnalldel{
        width: 120px;
        height: 60px;
        padding: 0 25px;
        font-size: 15px;
        letter-spacing: -.01em;
        text-align: center;
        vertical-align: middle;
        background-color: white;
        color: black;
        border: thin solid #000000;
        border-radius: 0;
        cursor: pointer;
        overflow: hidden;
        z-index: 1;

    }

    .btnalldel:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
        background-color: black;
        color: white;

    }



</style>

<span><strong>* 회원정보</strong></span>
<table class="table table-bordered" id="admin_qnainfo">
    <tr>
        <td class="colortd">이름</td>
        <td class="nonetd">${dto.qna_name}</td>
        <td class="colortd">ID</td>
        <td class="nonetd">${dto.writer}</td>
    </tr>
    <tr>
        <td class="colortd">연락처</td>
        <td class="nonetd">${dto.qna_phone}</td>
        <td class="colortd">이메일</td>
        <td class="nonetd">${dto.qna_email}</td>
    </tr>
</table>

<span><strong>* 문의내역</strong></span>
<table class="table table-bordered"  id="adminqna">
    <tr>
        <td class="colortd">제목</td>
        <td colspan="3">${dto.subject}</td>
    </tr>

    <tr>
        <td class="colortd">카테고리</td>
        <td class="nonetd"> ${dto.category == 1 ? '가입문의' : dto.category == 2 ? '예약문의' : dto.category == 3 ? '객실문의' : dto.category == 4 ? '기타' : ''}</td>
        <td class="colortd">타입</td>
        <td class="nonetd">${dto.qna_type}</td>
    </tr>

    <tr>
        <td class="colortd">작성일</td>
        <td class="nonetd"><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
        <td class="colortd">답변상태</td>
        <td class="nonetd">${dto.answer}</td>
    </tr>

    <tr>
        <c:if test="${dto.qna_type=='의견'}">
            <td class="colortd">사용일</td>
            <td class="nonetd" colspan="3">${dto.useday}</td>
        </c:if>
        <c:if test="${dto.qna_type=='문의'}">
            <td class="colortd">예약번호</td>
            <td class="nonetd" colspan="3">${dto.reservenum}</td>
        </c:if>
    </tr>

    <c:if test="${dto.qna_photo!=null && not empty dto.qna_photo}">
        <tr>
            <td class="colortd" style="line-height: 90px;">첨부파일</td>
            <td colspan="3">
                <c:forEach var="photo" items="${dto.qna_photo}">
                    <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/qnaboard/${photo}?type=f&w=80&h=80"
                         onclick="location.href='https://kr.object.ncloudstorage.com/dreamsstaybucket/qnaboard/${photo}'">
                </c:forEach>
            </td>
        </tr>
    </c:if>

    <tr>
        <td colspan="5" style="height: 200px;">${dto.content}</td>
    </tr>

</table>



<c:if test="${dto.answer== '답변완료'}">

    <table class="table table-bordered" id="answeradmin" style=" width: 1000px;">
        <tr>
            <td class="colortd">
                <span class="dream2">관리자답글</span> <br>
            </td>
        </tr>
        <tr>
            <td style="height: 200px;">
                <span id="answer-admin">${dto.answer_text}</span>
            </td>
        </tr>
    </table>
</c:if>


<form name="answer-form" method="post">
    <input type="hidden" name="num" value="${dto.num}">
    <span><strong class="dream">DreamStay</strong></span><br>
    <table class="table table-bordered" id="answer_table">
        <tr>
            <td>
                <textarea name="answer_text" class="answer_text"></textarea><br>

                <c:if test="${dto.answer== '답변대기'}">
                    <button type="button" class="btnanswer" id="answer-btn" style="margin-right: 10px;">답변완료</button>
                    <button type="button" class="btnlist" onclick="history.back()" style="margin-right: 10px;">목록</button>
                    <button type="button" class="btnalldel">문의 삭제</button>
                </c:if>

                <c:if test="${dto.answer== '답변완료'}">
                    <button type="button" class="btnlist"  onclick="history.back()" style="margin-right: 10px;">목록</button>
                    <button type="button" class="btndel" id="delQna">삭제</button>
                    <button type="button" class="btnalldel" >문의 삭제</button>
                </c:if>
            </td>
        </tr>
    </table>
</form>


<script type="text/javascript">
    $(document).ready(function() {
        $("#answer-btn").click(function() {
            $.ajax({
                type: 'POST',
                url: './answerupdate',
                data: $("form[name=answer-form]").serialize(),
                dataType: 'text',
                success: function(e) {

                    $("#answer-admin").html(e.answer_text);
                    $("form[name=answer-form]")[0].reset(); // 폼 리셋
                    alert("답변 작성 완료되었습니다");
                    location.reload(); // 새로고침
                }
            });
        });
    });
    SetAdminTitle("문의사항");

    // 댓글 삭제
    $("#delQna").click(function (){
        let a = confirm("삭제하려면 확인을 누르세요");
        if(a){
            let num = $("input[name='num']").val();
            location.href = "/admin/qna/delete?num=" + num;
        }
    });

    // 게시글 삭제
    $(".btnalldel").click(function (){
        let a = confirm("삭제하려면 확인을 누르세요");
        if(a){
            let num = $("input[name='num']").val();
            location.href = "/mypage/deleteqna?num=" + num;
        }
    });

</script>