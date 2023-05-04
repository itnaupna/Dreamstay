<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    ul{
        list-style: none;
        font-size:2rem;
        padding:0px 0px;
        margin:0px;
    }
    li{
        text-align: center;
    }
    li:hover{
        background: linear-gradient(90deg, #c8c8c8cc,transparent) transparent;
        cursor:pointer;
    }
    li:hover>ul{
        display:block;
    }
    .ulMaster>li{
        padding:16px 0px;
    }
    .liclicked{
        background: linear-gradient(90deg, #c8c8c8cc,transparent) transparent;
    }
</style>

<ul class="ulMaster">
    <li id="liAdmin" onclick="location.href='/admin'"><i class="bi bi-clipboard-data"></i></li>
    <li id="liChat" onclick="location.href='/admin/chat'"><i class="bi bi-chat-dots"></i></li>
    <li id="liBoard" onclick="location.href='/admin/board'"><i class="bi bi-person-circle"></i></li>
</ul>
