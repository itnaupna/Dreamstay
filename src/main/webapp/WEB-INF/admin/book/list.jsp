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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--${blst}--%>
<%--<form name="search-form" autocomplete="off">--%>
<%--    <table class="table table-bordered searchQnas">--%>
<%--        <tr>--%>
<%--            <td class="colortd">호텔</td>--%>
<%--            <td>--%>
<%--                <select name="hotelname" class="form-select">--%>
<%--                    <option value="전체">전체</option>--%>
<%--                        <c:forEach var="hotel" items="${hotelList}">--%>
<%--                            <option value="${hotel.name}">${hotel.name}</option>--%>
<%--                        </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>

<%--            <td class="colortd">카테고리 조회</td>--%>
<%--            <td>--%>
<%--                <select name="category" class="form-select">--%>
<%--                    <option value="0" selected>전체</option>--%>
<%--                    <option value="1">가입문의</option>--%>
<%--                    <option value="2">예약문의</option>--%>
<%--                    <option value="3">객실문의</option>--%>
<%--                    <option value="4">기타</option>--%>
<%--                </select>--%>
<%--            </td>--%>

<%--            <td class="colortd">게시글찾기</td>--%>
<%--            <td>--%>
<%--                <div id="findarticlediv" class="input-group">--%>
<%--                    <select name="searchtype" class="form-select" style="width:100px;">--%>
<%--                        <option value="title" selected >제목</option>--%>
<%--                        <option value="writer">작성자</option>--%>
<%--                        <option value="content">내용</option>--%>
<%--                    </select>--%>
<%--                    <style>--%>
<%--                        #findarticlediv .form-select{--%>
<%--                            flex:initial !important;--%>
<%--                        }--%>
<%--                    </style>--%>
<%--                    <input type="text" name="keyword" value="" class="form-control">--%>
<%--                </div>--%>
<%--            </td>--%>

<%--            <td class="colortd">답변상태</td>--%>
<%--            <td>--%>
<%--                <label><input class="form-check-input" type="radio"  name="answer" value="전체" checked>전체</label>--%>
<%--                <label><input class="form-check-input" type="radio"  name="answer" value="답변대기">답변대기</label>--%>
<%--                <label><input class="form-check-input" type="radio"  name="answer" value="답변완료">답변완료</label>--%>
<%--            </td>--%>

<%--            <td class="colortd">타입 조회</td>--%>
<%--            <td>--%>
<%--                <label><input class="form-check-input" type="radio"  name="qna_type" value="전체" checked>전체</label>--%>
<%--                <label><input class="form-check-input" type="radio"  name="qna_type" value="의견">의견</label>--%>
<%--                <label><input class="form-check-input" type="radio"  name="qna_type" value="문의">문의</label>--%>
<%--            </td>--%>

<%--            <td colspan="2">--%>
<%--                <input type="button" class="btn btn-outline-secondary" onclick="getSearchQna(1)" value="검색">--%>
<%--            </td>--%>
<%--    </table>--%>
<%--</form>--%>
<div id="bookTableWrapper">
<table id="bookTable" class="table">
    <caption>
    </caption>
    <thead>
    <tr>
        <th rowspan="2" style="width:50px;">체크인<br>여부</th>
        <th rowspan="2" style="width:40px;">번호</th>
        <th rowspan="2" style="width:155px;">예약ID</th>
        <th rowspan="2" style="width:140px;">이름</th>
        <th rowspan="2" style="width:105px;">기간</th>
        <th colspan="2" style="width:100px">인원정보</th>
        <th rowspan="2" style="width:200px;">요청사항</th>
        <th rowspan="2" style="width:80px;">예약금액</th>
        <th rowspan="2" style="width:220px;">이메일</th>
        <th rowspan="2" style="width:150px;">연락처</th>
        <th rowspan="2" style="width:180px;">호텔</th>
        <th rowspan="2" style="width:110px;">객실타입</th>
        <th rowspan="2" style="width:150px;">호텔전화</th>
    </tr>
    <tr>
        <th style="width:50px;">성인</th>
        <th style="width:50px;">어린이</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${blst}" var="dto">
            <tr>
                <td>${dto.realcheckin}</td>
                <td>${dto.num}</td>
                <td>${dto.id}</td>
                <td>${dto.name}</td>
                <td>${fn:substringBefore(dto.checkin,"T")} ~ <br/>
                        ${fn:substringBefore(dto.checkout,"T")}</td>
                <td>${dto.adult}</td>
                <td>${dto.kids}</td>
                <td>${dto.memo}</td>
                <td><fmt:formatNumber value="${dto.totalprice}"/></td>
                <td class="noover">${dto.memberemail}</td>
                <td>${dto.memberphone}</td>
                <td>${dto.hotelname}</td>
                <td>${dto.roomtype}</td>
                <td>${dto.hotelphone}</td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="14">
            <c:if test="${page[0]>10}">
                <span class="pagenumber" onclick="getSearchQna(${page[0]-1})">&lt;</span>
            </c:if>
            <c:forEach begin="${page[0]}" end="${page[2]}" var="i">
                <c:if test="${i==page[1]}">
                    <span class="currpage pagenumber">${i}</span>
                </c:if>
                <c:if test="${i!=page[1]}">
                    <span class="pagenumber" onclick="getSearchQna(${i})">${i}</span>
                </c:if>
            </c:forEach>
            <c:if test="${page[2]<page[3]}">
                <span class="pagenumber" onclick="getSearchQna(${page[2]+1})">&gt;</span>
            </c:if>
        </td>
    </tr>
    </tfoot>
</table>
</div>
<style>
    .noover{
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        /*text-align: center;*/
    }
    #bookTableWrapper{
        width:100vw;
    }
    #bookTable{
        width:100%;
        table-layout: fixed;
    }
    .pagenumber:hover{
        text-decoration: underline;
        cursor:pointer;
    }
    .pagenumber{
        padding:5px;
    }

    .currpage{
        font-weight:bolder;
    }

    thead {
        font-weight: bold;
        color: #fff;
        background: #73685d;
    }
    td, th {
        padding: 0.1rem !important;
        vertical-align: middle;
        text-align: center;
    }

    #bookTable tbody tr:hover{
        background-color: rgba(136, 93, 54, 0.26);
        cursor:pointer;
    }
    </style>

<script>

</script>
