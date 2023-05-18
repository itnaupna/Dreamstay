<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .side ul{
        list-style: none;
        font-size:2rem;
        padding:0px 0px;
        margin:0px;
    }
    .side li{
        text-align: center;
    }
    .side li:hover, .side  #liLogout:hover{
        background: linear-gradient(90deg, #c8c8c8cc,transparent) transparent;
        cursor:pointer;
    }
    .side li:hover>ul{
        display:block;
    }
    .side .ulMaster>li{
        padding:16px 0px;
    }
    .side .liclicked{
        background: linear-gradient(90deg, #c8c8c8cc,transparent) transparent;
    }
    .side #liLogout{
        position:absolute;
        bottom:10px;
        font-size: 2rem;
        text-align: center;
        width:100%;
    }

</style>

<ul class="ulMaster">
    <li id="liAdmin" onclick="location.href='/admin'" data-bs-toggle="tooltip" data-bs-placement="right" title="대시보드"><i class="bi bi-clipboard-data"></i></li>
    <li id="liChat" onclick="location.href='/admin/chat'" data-bs-toggle="tooltip" data-bs-placement="right" title="채팅관리"><i class="bi bi-chat-dots"></i></li>
    <li id="liBoard" onclick="location.href='/admin/notice'" data-bs-toggle="tooltip" data-bs-placement="right" title="공지사항"><i class="bi bi-megaphone"></i></li>
    <li id="liQna" onclick="location.href='/admin/qna'" data-bs-toggle="tooltip" data-bs-placement="right" title="QnA문의"><i class="bi bi-question-circle"></i></li>
    <li id="liHotel" onclick="location.href='/admin/hotel'" data-bs-toggle="tooltip" data-bs-placement="right" title="호텔관리"><i class="bi bi-hospital"></i></li>
    <li id="liBook" onclick="location.href='/admin/book'" data-bs-toggle="tooltip" data-bs-placement="right" title="예약관리"><i class="bi bi-journal-check"></i></li>
</ul>
<div id="liLogout" onclick="if(confirm('로갓?'))location.href='/signup/logout'"><i class="bi bi-box-arrow-left"></i></div>

<script>
    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>