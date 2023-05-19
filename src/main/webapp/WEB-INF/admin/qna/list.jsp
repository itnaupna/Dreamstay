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
<form name="search-form" autocomplete="off">
    <table class="table table-bordered searchQnas">
        <tr>
            <td class="colortd">호텔</td>
            <td>
                <select name="hotelname" class="form-select">
                    <option value="전체">전체</option>
                        <c:forEach var="hotel" items="${hotelList}">
                            <option value="${hotel.name}">${hotel.name}</option>
                        </c:forEach>
                </select>
            </td>

            <td class="colortd">카테고리 조회</td>
            <td>
                <select name="category" class="form-select">
                    <option value="0" selected>전체</option>
                    <option value="1">가입문의</option>
                    <option value="2">예약문의</option>
                    <option value="3">객실문의</option>
                    <option value="4">기타</option>
                </select>
            </td>

            <td class="colortd">게시글찾기</td>
            <td>
                <div id="findarticlediv" class="input-group">
                    <select name="searchtype" class="form-select" style="width:100px;">
                        <option value="title" selected >제목</option>
                        <option value="writer">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <style>
                        #findarticlediv .form-select{
                            flex:initial !important;
                        }
                    </style>
                    <input type="text" name="keyword" value="" class="form-control">
                </div>
            </td>

            <td class="colortd">답변상태</td>
            <td>
                <label><input class="form-check-input" type="radio"  name="answer" value="전체" checked>전체</label>
                <label><input class="form-check-input" type="radio"  name="answer" value="답변대기">답변대기</label>
                <label><input class="form-check-input" type="radio"  name="answer" value="답변완료">답변완료</label>
            </td>

            <td class="colortd">타입 조회</td>
            <td>
                <label><input class="form-check-input" type="radio"  name="qna_type" value="전체" checked>전체</label>
                <label><input class="form-check-input" type="radio"  name="qna_type" value="의견">의견</label>
                <label><input class="form-check-input" type="radio"  name="qna_type" value="문의">문의</label>
            </td>

            <td colspan="2">
                <input type="button" class="btn btn-outline-secondary" onclick="getSearchQna(1)" value="검색">
            </td>
    </table>
</form>
<table id="qnaTable" class="table">
    <caption>
        <%--        <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square" style="padding-right:8px;"></i>Write</button>--%>
    </caption>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>답변여부</th>
        <th>카테고리</th>
        <th>타입</th>
        <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${qnaList}" var="dto">
        <tr onclick="location.href='qna/content?num=${dto.num}';">
            <td>${dto.num}</td>
            <td>
                    <%--                <a href="qna/content?num=${dto.num}">--%>
                <span class="qna_sub">
                    ${dto.subject}
                   <%-- <c:if test="${dto.qna_photo!='' || dto.qna_photo!=null}">
                        <i class="bi bi-image"></i>
                    </c:if>--%>
                </span>
                    <%--                </a>--%>
            </td>

            <td>${fn:replace(dto.qna_name,"/","")}</td>
            <c:if test="${dto.answer=='답변대기'}">
                <td><span class="answer_before">${dto.answer}</span></td>
            </c:if>
            <c:if test="${dto.answer=='답변완료'}">
                <td><span class="answer_after">${dto.answer}</span></td>
            </c:if>

            <td>
                ${dto.category == 1 ? '가입문의' : dto.category == 2 ? '예약문의' : dto.category == 3 ? '객실문의' : dto.category == 4 ? '기타' : ''}
            </td>

            <td>${dto.qna_type}</td>

            <td><fmt:formatDate value="${dto.writeday}" type="both"/> </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="8">
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
<style>
    .pagenumber:hover{
        text-decoration: underline;
        cursor:pointer;
    }
    .pagenumber{
        padding:5px;
    }
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
        /*font-size:.7rem;*/
        /*color:#5a5c69!important;*/
        /*font-weight: 700!important;*/
    }
    #qnaTable tbody tr:hover{
        background-color: rgba(136, 93, 54, 0.26);
        cursor:pointer;
    }
    #qnaTable{
        width: 100%;
    }

    #qnaTable a{
        color:#5a5c69;
        text-decoration: none;

    }

    .colortd{
        background-color: #F3F3F3 !important;
    }

    #searchtype{
        width: 100px;
    }

</style>
<script>

    function getSearchQna(page) {
        $.ajax({
            type: 'GET',
            url:'./qna/list/' + page,
            data: $("form[name=search-form]").serialize(),
            dataType: 'json',
            success:(e)=>{
                $('#qnaTable > tbody').empty();
                $('#qnaTable tbody').empty();
                    $.each(e[0], (i, e) => {
                        $('#qnaTable tbody').append(
                            `<tr>
                            <td>\${e.num}</td>
                            <td> <a href="qna/content?num=\${e.num}">\${e.subject}</a></td>
                            <td>\${e.qna_name.replace("/","")}</td>
                            <td>\${e.answer=="답변완료"?"<span class='answer_after'>답변완료</span>":"<span class='answer_before'>답변대기</span>"}</td>
                            <td>\${e.category==1?"가입문의":e.category==2?"예약문의":e.category==3?"객실문의":"기타"}</td>
                            <td>\${e.qna_type}</td>
                            <td>\${new Date(e.writeday).toLocaleString()}</td>
                        </tr>`
                        );
                    });

                $('#qnaTable tfoot>tr>td').empty();
                if(e[1][0]>10)
                    $('#qnaTable tfoot>tr>td').append(`<span class='pagenumber' onclick='getSearchQna(\${e[1][0]-1})'>&lt;</span> `);

                let pages = "";
                for(let idx=e[1][0];idx<=e[1][2];idx++){

                    if(idx==e[1][1])
                        pages+=`<span class="currpage pagenumber">\${idx}</span> `;
                    else
                        pages+=`<span class="pagenumber" onclick='getSearchQna(\${idx})'>\${idx}</span> `;
                    if(idx>=e[1][3]) break;
                }
                $('#qnaTable tfoot>tr>td').append(pages);

                if(e[1][2]<e[1][3])
                    $('#qnaTable tfoot>tr>td').append(`<span class='pagenumber' onclick='getSearchQna(\${e[1][2]+1})'>&gt;</span>`);
            }
        });
    }
    SetAdminTitle("문의사항");
</script>
