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
    <li id="liAdmin" onclick="location.href='/admin'"><i class="bi bi-clipboard-data"></i></li>
    <li id="liChat" onclick="location.href='/admin/chat'"><i class="bi bi-chat-dots"></i></li>
    <li id="liBoard" onclick="location.href='/admin/notice'"><i class="bi bi-person-circle"></i></li>
    <li id="liHotel" onclick="location.href='/admin/hotel'"><i class="bi bi-hospital"></i></li>
</ul>
<div id="liLogout" onclick="if(confirm('로갓?'))location.href='/signup/logout'"><i class="bi bi-box-arrow-left"></i></div>

