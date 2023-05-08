<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            <option value="Hotel in Seoul">서울점</option>
                            <option value="Hotel In Busan">부산점</option>
                            <option value="Hotel in Yeosu">여수점</option>
                            <option value="Hotel in Jeju">제주점</option>
                            <option value="Hotel in Sokcho">속초점</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <td style="width: 250px;"><span>*</span>관련문의</td>
                <td style="width: 350px;">
                    <select name="category" style="width: 200px;">
                        <option value="1">가입문의</option>
                        <option value="2">포인트적립/사용</option>
                        <option value="3">포인트조정</option>
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
                    <input type="text" name="user_name" value="${memberDto.user_name}" readonly style="background-color:#ececec;">
                </td>
            </tr>

            <tr>
                <td><span>*</span>이메일</td>
                <td><input type="text" name="email" value="${memberDto.email}" readonly style="background-color:#ececec;"> </td>
            </tr>

            <tr>
                <td><span>*</span>핸드폰번호</td>
                <td><input type="text" name="phone" value="${memberDto.phone}" readonly style="background-color:#ececec;"> </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button type="submit">등록</button>
                </td>
            </tr>


        </table>

    </form>
</div>