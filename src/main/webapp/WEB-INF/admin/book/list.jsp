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
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<div id="bookTableWrapper">
    <table id="bookTable" class="table">
        <caption style="caption-side: top">
            <span class="nolook" style="outline: 1px solid;">　　</span> : 노쇼
            <span class="checkedin" style="outline: 1px solid;">　　</span> : 체크인
            <span class="today" style="outline: 1px solid;">　　</span> : 오늘 체크인
        </caption>
        <thead>
        <tr>
<%--            <th rowspan="2" style="width:50px;">체크인<br>여부</th>--%>
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
            <c:set value="${fn:substringBefore(dto.checkin,'T')}" var="tcin"/>
            <c:set value="${fn:substringBefore(dto.checkout,'T')}" var="tcout"/>
            <fmt:parseDate value="${tcin}" pattern="yyyy-MM-dd" var="cin"/>
            <fmt:parseDate value="${tcout}" pattern="yyyy-MM-dd" var="cout"/>
            <fmt:formatDate value="${cin}" pattern="yyyy-MM-dd" var="ucin"/>
            <fmt:formatDate value="${cout}" pattern="yyyy-MM-dd" var="ucout"/>
            <c:if test="${today<=ucout}">
                <c:if test="${today>ucin && dto.realcheckin==0}">
                    <c:set value="nolook" var="strClass"/>
                </c:if>
                <c:if test="${today==ucin && dto.realcheckin==0}">
                    <c:set value="today" var="strClass"/>
                </c:if>
                <c:if test="${dto.realcheckin==1}">
                    <c:set value="checkedin" var="strClass"/>
                </c:if>
                <c:if test="${today<ucin}">
                    <c:set value="notyet" var="strClass"/>
                </c:if>
            </c:if>
            <c:if test="${today>ucout}">
                <c:set value="outdated" var="strClass"/>
            </c:if>
            <tr class="${strClass}">
<%--            <td>${dto.realcheckin}</td>--%>
            <td>${dto.num}</td>
            <td>${dto.id}</td>
            <td>${dto.name}</td>
            <td>${ucin} ~ <br/>
                    ${ucout}</td>
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
<%--        <tfoot>--%>
<%--        <tr>--%>
<%--            <td colspan="13">--%>
<%--                <c:if test="${page[0]>10}">--%>
<%--                    <span class="pagenumber" onclick="getSearchQna(${page[0]-1})">&lt;</span>--%>
<%--                </c:if>--%>
<%--                <c:forEach begin="${page[0]}" end="${page[2]}" var="i">--%>
<%--                    <c:if test="${i==page[1]}">--%>
<%--                        <span class="currpage pagenumber">${i}</span>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${i!=page[1]}">--%>
<%--                        <span class="pagenumber" onclick="getSearchQna(${i})">${i}</span>--%>
<%--                    </c:if>--%>
<%--                </c:forEach>--%>
<%--                <c:if test="${page[2]<page[3]}">--%>
<%--                    <span class="pagenumber" onclick="getSearchQna(${page[2]+1})">&gt;</span>--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tfoot>--%>
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
    .nolook{
        background-color:rgba(255,0,0,0.1);
    }
    .today{
        background-color:rgba(0,255,0,0.1);
    }
    .checkedin{
        background-color:rgba(0,0,255,0.1);
    }
    .outdated{
        background-color:rgba(0,0,0,0.1);
    }
    #bookTable tbody tr:hover{
        background-color: rgba(136, 93, 54, 0.26);
        cursor:pointer;
    }
</style>

<script>
$('#bookTable tbody').on('click','tr',(e)=>{
   let cls = $(e.currentTarget)[0].className;
   let num = $(e.currentTarget)[0].children[0].innerText;
   switch (cls){
       case "nolook":
       case "today":
           if(confirm("체크인하시겠습니까?"))
           $.ajax({
               url:'/admin/book/checkin',
               type:'post',
               data:{num:num},
               success:(e)=>{
                   alert('체크인되었습니다.');
                   location.reload();
               }
           });
           break;
       case "notyet":
       case "checkedin":
           if(confirm("예약을 취소하시겠습니까?"))
               $.ajax({
                   url:'/admin/book/delete',
                   type:'post',
                   data:{num:num},
                   success:(e)=>{
                       alert('취소되었습니다.');
                       location.reload();
                   }
               });
           break;
       case "outdated":
           if(confirm("삭제하시겠습니까?"))
               $.ajax({
                   url:'/admin/book/delete',
                   type:'post',
                   data:{num:num},
                   success:(e)=>{
                       alert('삭제되었습니다.');
                       location.reload();
                   }
               });
           break;
   }
});
SetAdminTitle("예약관리");
</script>
