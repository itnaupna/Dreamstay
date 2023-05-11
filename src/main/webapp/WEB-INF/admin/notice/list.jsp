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

<table id="noticeTable" class="table-bordered">
    <caption>
        <button type="button" class="btn btn-secondary"><i class="bi bi-pencil-square" style="padding-right:8px;"></i>Write</button>
    </caption>
    <thead>
    <tr>
        <th>num</th>
        <th>subject</th>
        <th>writer</th>
        <th>count</th>
        <th>writeday</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="dto">
        <tr>
            <td>${dto.num}</td>
            <td>${dto.subject}</td>
            <td>${dto.writer}</td>
            <td>${dto.count}</td>
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
    #noticeTable{
        width: 100%;
    }
</style>


<script>
    function Paging(page){

        $.ajax({
            url:'./notice/list/' + page,
            dataType:'json',
            success:(e)=>{
                $('#noticeTable tbody').empty();
                $.each(e[0],(i,e)=>{
                    $('#noticeTable tbody').append(
                        `<tr>
                            <td>\${e.num}</td>
                            <td>\${e.subject}</td>
                            <td>\${e.writer}</td>
                            <td>\${e.count}</td>
                            <td>\${new Date(e.writeday).toLocaleString()}</td>
                        </tr>`
                    );
                });

                $('#noticeTable tfoot>tr>td').empty();
                if(e[1][0]>10)
                    $('#noticeTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][0]-1})'>&lt;</span> `);

                let pages = "";
                for(let idx=e[1][0];idx<=e[1][2];idx++){

                    if(idx==e[1][1])
                        pages+=`<span class="currpage pagenumber">\${idx}</span> `;
                    else
                        pages+=`<span class="pagenumber" onclick='Paging(\${idx})'>\${idx}</span> `;
                    if(idx>=e[1][3]) break;
                }
                $('#noticeTable tfoot>tr>td').append(pages);

                if(e[1][2]<e[1][3])
                    $('#noticeTable tfoot>tr>td').append(`<span class='pagenumber' onclick='Paging(\${e[1][2]+1})'>&gt;</span>`);
            }
        });
    }
</script>