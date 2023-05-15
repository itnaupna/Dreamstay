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

<style>
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



</style>
<form name="search-form" autocomplete="off">
    <table class="table table-bordered searchQnas">
        <tr>
            <td>호텔</td>
            <td>
                <select name="hotelname" class="form-select">
                    <option value="전체">전체</option>
                    <option value="그랜드조선 서울">그랜드조선 서울</option>
                    <option value="그랜드조선 부산">그랜드조선 부산</option>
                    <option value="그랜드조선 제주">그랜드조선 제주</option>
                    <option value="그랜드조선 여수">그랜드조선 여수</option>
                    <option value="그랜드조선 속초">그랜드조선 속초</option>
                </select>
            </td>

            <td>카테고리 조회</td>
            <td>
                <select name="category" class="form-select">
                    <option value="0" selected>전체</option>
                    <option value="1">가입문의</option>
                    <option value="2">예약문의</option>
                    <option value="3">객실문의</option>
                    <option value="4">기타</option>
                </select>
            </td>

            <td>게시글찾기</td>
            <td>
                <select name="searchtype">
                    <option value="title" selected >제목</option>
                    <option value="writer">작성자</option>
                    <option value="content">내용</option>
                </select>

                <input type="text" name="keyword" value="">

            </td>

            <td>답변상태</td>
            <td>
                <input class="form-check-input" type="radio"  name="answer" value="전체" checked>전체
                <input class="form-check-input" type="radio"  name="answer" value="답변대기">답변대기
                <input class="form-check-input" type="radio"  name="answer" value="답변완료">답변완료
            </td>

            <td>카테고리</td>
            <td>
                <input class="form-check-input" type="radio"  name="qna_type" value="전체" checked>전체
                <input class="form-check-input" type="radio"  name="qna_type" value="의견">의견
                <input class="form-check-input" type="radio"  name="qna_type" value="문의">문의
            </td>

            <td colspan="2">
                <input type="button" class="btn btn-outline-secondary" onclick="Paging()" value="검색">
            </td>
    </table>
</form>


<table id="qnaTable" class="table-bordered">
    <caption>
        <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square" style="padding-right:8px;"></i>Write</button>
    </caption>
    <thead>
    <tr>
        <th>num</th>
        <th>subject</th>
        <th>writer</th>
        <th>answer</th>
        <th>writeday</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${qnaList}" var="dto">
        <tr>
            <td>${dto.num}</td>
            <td>
                <a href="qna/content?num=${dto.num}">
                    <span class="qna_sub">${dto.subject}</span>
                </a>
            </td>
            <td>${dto.writer}</td>
            <c:if test="${dto.answer=='답변대기'}">
                <td><span class="answer_before">${dto.answer}</span></td>
            </c:if>
            <c:if test="${dto.answer=='답변완료'}">
                <td><span class="answer_after">${dto.answer}</span></td>
            </c:if>
            <td><fmt:formatDate value="${dto.writeday}" type="both"/> </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="5">
            <c:if test="${page[0]>10}">
                <span class="pagenumber" onclick="Paging(${page[0]-1})">&lt;</span>
            </c:if>
            <c:forEach begin="${page[0]}" end="${page[2]}" var="i">
                <c:if test="${i==page[1]}">
                    <span class="currpage pagenumber">${i}</span>
                </c:if>
                <c:if test="${i!=page[1]}">
                    <span class="pagenumber" onclick="Paging(${i})">${i}</span>
                </c:if>
            </c:forEach>
            <c:if test="${page[2]<page[3]}">
                <span class="pagenumber" onclick="Paging(${page[2]+1})">&gt;</span>
            </c:if>
        </td>
    </tr>
    </tfoot>
</table>

<style>
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
        font-size:.7rem;
        color:#5a5c69!important;
        font-weight: 700!important;
    }
    #qnaTable{
        width: 100%;
    }

    #qnaTable a{
        color:#5a5c69;
        text-decoration: none;

    }

</style>


<script>

    // 검색함수
    function getSearchQna(){
        $.ajax({
            type: 'GET',
            url : "./getSearchQna",
            data : $("form[name=search-form]").serialize(),
            dataType: 'json',
            success : function(result){
                //테이블 초기화
                $('#qnaTable > tbody').empty();
                if(result.length>=1){
                    result.forEach(function(item){
                        str='<tr>'
                        str += "<td>"+item.num+"</td>";
                        str+="<td><a href = 'qna/content?num=" + item.num + "'>" + item.subject + "</a></td>";
                        str+="<td>"+item.writer+"</td>";
                        str+="<td>"+item.answer+"</td>";
                        str+="<td>"+new Date(item.writeday).toLocaleString()+"</td>";
                        str+="</tr>"
                        $('#qnaTable').append(str);

                    })
                }
            }
        })
    }

    // 페이지 호출 함수
    function Paging(page){

        $.ajax({
            url:'./qna/list/' + page,
            data:  $("form[name=search-form]").serialize(),
            dataType:'json',
            success:(e)=>{
                $('#qnaTable tbody').empty();
                $.each(e[0],(i,e)=>{
                    $('#qnaTable tbody').append(
                        `<tr>
                            <td>\${e.num}</td>
                            <td>
                            <a href="qna/content?num=\${e.num}">\${e.subject}</a></td>
                            <td>\${e.writer}</td>
                            <td>\${e.answer}</td>
                            <td>\${new Date(e.writeday).toLocaleString()}</td>
                        </tr>`
                    );
                });

                $('#qnaTable tfoot>tr>td').empty();
                if(e[1][0]>10)
                   $('#qnaTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][0]-1})'>&lt;</span> `);

                    let pages = "";
                    for(let idx=e[1][0];idx<=e[1][2];idx++){

                        if(idx==e[1][1])
                            pages+=`<span class="currpage pagenumber">\${idx}</span> `;
                        else
                            pages+=`<span class="pagenumber" onclick='Paging(\${idx})'>\${idx}</span> `;
                        if(idx>=e[1][3]) break;
                    }
                $('#qnaTable tfoot>tr>td').append(pages);

                if(e[1][2]<e[1][3])
                    $('#qnaTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][2]+1})'>&gt;</span>`);
            }
        });
    }


</script>

