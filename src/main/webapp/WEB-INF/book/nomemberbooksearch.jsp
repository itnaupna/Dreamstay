<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br><br><br><br><br><br><br>

    <span>${booksearch.user_name}님 예약 정보</span>
    <table>
        <tr><td colspan="3"><span>호텔 정보</span></td></tr>
        <tr>
            <td>호텔명</td>
            <td>주소</td>
            <td>전화번호</td>
        </tr>
        <tr>
            <td>
                <span><img src="https://ukkzyijeexki17078490.cdn.ntruss.com/hotel/${booksearch.photo}?type=f&w=160&h=160&faceopt=true"></span>
                <span>${booksearch.name}</span>
            </td>
            <td>
                <span>${booksearch.addr}</span>
            </td>
            <td>
                <span>${booksearch.phone}</span>
            </td>
        </tr>
    </table>

    <table>
        <tr><td colspan="6" ><span>객실 정보</span></td></tr>
        <tr>
            <td>객실 타입</td>
            <td>체크 인</td>
            <td>체크 아웃</td>
            <td>인원 수</td>
            <td>요청 사항</td>
            <td>이용 요금</td>
        </tr>
        <tr>
            <td>${booksearch.roomtype}</td>
            <td>${booksearch.checkin}</td>
            <td>${booksearch.checkout}</td>
            <td>성인: ${booksearch.adult}, 어린이: ${booksearch.kids} </td>
            <td>${booksearch.memo}</td>
            <td>${booksearch.total_price}</td>
        </tr>

    </table>
