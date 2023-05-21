<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    #qnapage .Q {
        width: 45px;
        height: 46px;
        background-color: black;
        border-radius: 40px;
        color: #fff;
        font-size: 27px;
        margin-top: -6px;

    }

    #qnapage{
        border-top: 2px solid #ccc;
        margin-top: 32px;
    }

    #qnapage .Q>span{
        position: relative;
        top: 15px;
        right: 3px;
    }

    .qnatitle{
        display: flex;
    }

    .qnatitle .title{
        margin-left: 20px;
        font-size: 30px;
        font-weight: bold;
        /*        border: 1px solid black;*/
        width: 1000px;
        height: 40px;
        margin-top: 5px;
    }

    .daegi{
        border-radius: 20px;
        border: 1px solid black;
        padding: 6px;
        font-size: 13px;
        position: relative;

    }

    .wan{
        border-radius: 20px;
        border: 1px solid black;
        background-color: black;
        color: white;
        padding: 7px;
        font-size: 13px;
    }

    .qnaanswer{
        /*border: 1px solid black;*/
        width: 100px;
        height: 65px;
        position: relative; /* 추가 */

    }

    .qnainfo span{
        margin-right: 8px;
    }

    .answerinfo span{
        margin-right: 8px;
    }

    #qnapage{
        border-collapse: collapse;
    }

    #qnapage tr{
        border-bottom: 1px solid #ccc;
    }

    #aswertable {
        border-collapse: collapse;
    }

    #aswertable tr{
        border-bottom: 1px solid #ccc;
    }

    #aswertable .A {
        width: 45px;
        height: 46px;
        border-radius: 40px;
        color: #000;
        font-size: 27px;
        border: 1px solid black;

    }

    #aswertable .A>span{
        position: relative;
        top: 21px;
        right: 3px;

    }

    .hotelqna{
        display: flex;
    }

    .hotelqna .answerhotel{
        margin-left: 20px;
        font-size: 25px;
        font-weight: bold;
        /* border: 1px solid black;*/
        height: 40px;
        margin-top: 20px;
    }

    .qnabtnlist, .delQna{
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

    .qnabtnlist:hover,.delQna:hover {
        transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
        background-color: white;
        color: black;

    }
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
        font-style: normal;
    }

    #qnapage, .detailbtns, #aswertable{
        font-family: GmarketSansMedium;
    }

</style>

<table id="qnapage">

    <tr>
        <td style="height: 140px; line-height: 20px;">

            <div class="qnatitle">
                <%--Q모양--%>
                <div class="Q">
                    <span style="margin-left: 13px; margin-top: 5px;">Q</span>
                </div>

                <%--제목--%>
                <span class="title">${dto.subject}</span>
                <%--답변상태--%>
                <div class="qnaanswer">
                    <div>
                        <c:if test="${dto.answer== '답변대기'}">
                            <span class="daegi">${dto.answer}</span>
                        </c:if>
                    </div>
                    <div>
                        <c:if test="${dto.answer== '답변완료'}">
                            <span class="wan">${dto.answer}</span>
                        </c:if>
                    </div>
                </div>

                <div class="qnainfo" style="border: 1px; position: absolute; top: 160px;">
                    <span style="color: #968a8b;">문의구분 : </span><span>${dto.qna_type} / </span>
                    <c:if test="${dto.category==1}">
                        <span>가입문의</span>
                    </c:if>
                    <c:if test="${dto.category==2}">
                        <span>예약문의</span>
                    </c:if>
                    <c:if test="${dto.category==3}">
                        <span>객실/패키지문의</span>
                    </c:if>
                    <c:if test="${dto.category==4}">
                        <span>기타</span>
                    </c:if>
                    <span style="color: #968a8b">|</span>
                    <span style="color: #968a8b">호텔 :</span> <span>${dto.hotelname}</span>
                    <span style="color: #968a8b">|</span>
                    <span style="color: #968a8b">작성일자 :</span> <span><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /></span>
                    <c:if test="${dto.reservenum!='' and dto.reservenum!=null}">
                        <span style="color: #968a8b;">|</span>
                        <span style="color: #968a8b;">예약번호 : </span>
                        <span>${dto.reservenum}</span>
                    </c:if>
                    <c:if test="${dto.useday!='' and dto.useday!=null}">
                        <span style="color: #968a8b;">|</span>
                        <span style="color: #968a8b;">사용일 : </span><span>${dto.useday}</span>
                    </c:if>
                </div>
            </div>
        </td>
    <tr>
        <td style="height: 50px; line-height: 50px;">
            <div class="answerinfo">
                <span style="color: #968a8b;">문의자 :</span> <span>${dto.qna_name}</span>
                <span style="color: #968a8b;">|</span>

                <span style="color: #968a8b;">연락처 :</span> <span>${dto.qna_phone} </span>
                <span style="color: #968a8b;">|</span>

                <span style="color: #968a8b;">이메일 :</span> <span>${dto.qna_email} </span>

            </div>
        </td>
    </tr>

    <c:if test="${dto.qna_photo != ''}">
        <tr>
            <td>
                <c:forEach var="photo" items="${dto.qna_photo}">

                    <img src="https://ukkzyijeexki17078490.cdn.ntruss.com/qnaboard/${photo}?type=f&w=80&h=80"
                         onclick="location.href='https://kr.object.ncloudstorage.com/dreamsstaybucket/qnaboard/${photo}'">
                </c:forEach>
            </td>
        </tr>
    </c:if>

    <tr style="height: 100px;">
        <td style="font-size: 18px;">${dto.content}</td>
    </tr>
</table>

<br>
<%--답변 table--%>
<c:if test="${dto.answer== '답변완료'}">

    <table id="aswertable" style="margin-bottom: 30px; width: 1167px;">
        <tr style="height: 60px; line-height: 6px;">
            <td>
                <div class="hotelqna">
                    <div class="A" >
                        <span style="margin-left: 15px; margin-top: 6px;">A</span>
                    </div>

                    <span class="answerhotel">DreamStay</span>
                </div>
            </td>
        </tr>

        <tr style="height: 100px;">
            <td style="font-size: 18px;">${dto.answer_text}</td>
        </tr>
    </table>
</c:if>


<div class="detailbtns">
    <button type="button" class="qnabtnlist" onclick="history.back()">목록</button>
    <c:if test="${dto.answer== '답변대기'}">
        <button type="button" class="delQna">삭제</button>
    </c:if>
</div>

<%--삭제 버튼--%>
<script type="text/javascript">
    $(".delQna").click(function (){
        let a = confirm("삭제하려면 확인을 누르세요");
        if(a){
            location.href="/mypage/deleteqna?num="+${dto.num}
        }
    });

</script>