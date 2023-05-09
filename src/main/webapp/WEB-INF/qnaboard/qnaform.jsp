<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


<style>
    .qnaboard table{
        position: absolute;
        top: 150px;
    }
</style>

<div class="qnaboard">
    <form action="/insertqna" method="post" name="qnaboard">
        <table class="table table qnatable" style="width: 600px;">
            <tr>
                <td style="width: 250px;"><span>*</span>호텔</td>
                <td style="width: 350px;">
                    <div class="hotelselect">
                        <select name="hotelname">
                            <option value="그랜드조선 서울">그랜드조선 서울</option>
                            <option value="그랜드조선 부산">그랜드조선 부산</option>
                            <option value="그랜드조선 제주">그랜드조선 제주</option>
                            <option value="그랜드조선 여수">그랜드조선 여수</option>
                            <option value="그랜드조선 속초">그랜드조선 속초</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <td style="width: 250px;"><span>*</span>관련문의</td>
                <td style="width: 350px;">
                    <select name="category" style="width: 200px;">
                        <option value="1">가입문의</option>
                        <option value="2">예약문의</option>
                        <option value="3">객실/패키지문의</option>
                        <option value="4">기타</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>예약번호</td>
                <td><input type="text" name="resrevenum"></td>
            </tr>

            <tr>
                <td><span>*</span>제목</td>
                <td><input type="text" name="subject"></td>
            </tr>

            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content"></textarea>
                </td>
            </tr>

            <tr>
                <td><span>*</span>성명</td>
                <td>
                    <input type="text" name="qna_name" value="${memberDto.user_name}">
                </td>
            </tr>

            <tr>
                <td><span>*</span>이메일</td>
                <td><input type="text" name="qna_email" value="${memberDto.email}"> </td>
            </tr>

            <tr>
                <td><span>*</span>핸드폰번호</td>
                <td><input type="text" name="qna_phone" value="${memberDto.phone}"></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center">
                    <button type="submit">등록</button>
                </td>
            </tr>


        </table>

    </form>
</div>