<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .adminmain{
    }
    #card1{
        margin: 10px;
        padding: 10px;
        width:398px;
        height:102px;
        /*border:1px solid;*/
        border-radius: 0.825rem;
        border-left:0.25rem solid #0000ffaa !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15)!important;
        transition: box-shadow 0.1s ease;
    }
    #card1:hover{
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.9)!important;
    }
    #card2{
        margin:10px;
        padding:10px;
        width:398px;
        height: 102px;
        border-radius: 0.825rem;
        border-left: 0.25rem solid #1cc88a!important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15)!important;
        transition: box-shadow 0.1s ease;
    }
    #card2:hover{
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.9)!important;
    }
    #card3{
        margin:10px;
        padding:10px;
        width:398px;
        height: 102px;
        border-radius: 0.825rem;
        border-left: .25rem solid #36b9cc!important ;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15) !important;
        transition: box-shadow 0.1s ease;
    }
    #card3:hover{
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.9) !important;
    }
    #card4{
        margin:10px;
        padding:10px;
        width: 398px;
        height: 102px;
        border-radius: 0.825rem;
        border-left:.25rem solid #f6c23e!important ;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15) !important;
        transition: box-shadow 0.1s ease;
    }
    #card4:hover{
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.9) !important;
    }
    .card0{
        display: flex;
        flex-wrap: wrap;

    }
    .text-area1{
        font-size:.7rem;
        color:#0000ffaa;
        font-weight: 700!important;
        text-transform: uppercase!important;
        margin-bottom: 0.25rem!important;
    }
    .count-area1{
        color:#5a5c69!important;
        font-weight: 700!important;
        margin-bottom: 0!important;
        font-size: 1.25rem;
        line-height: 1.2;
    }
    .icon-area1{
        color:#dddfeb!important;
        font-weight: 900;
        font-size:2em;
        -webkit-font-smoothing:antialiased;
        display: inline-block;
        font-style: normal;
        font-variant: normal;
        text-rendering: auto;
        line-height: 1;

    }
    .icon-area0{
        flex:0 0 auto;
        width: auto;
        max-width: 100%;
    }
    .info0{
        margin-right: 0;
        margin-left: 0;
        display: flex;
        height: 100%;
        align-items: center;

    }
    .info1{
        padding-right: 0;
        padding-left: 0;
        margin-right: 0.5rem!important;
        flex-basis: 0;
        flex-grow: 1;
        max-width: 100%;
        position: relative;
        width: 100%;
    }
    #box0{
        position: relative;
        padding-top: 10px;
        display: flex;
        margin:10px;
    }
    #box1 {
        margin-bottom: 1.5rem !important;
        width:398px;
        height:400px;
        box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15) !important;
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border:1px solid #e3e6f0;
        border-radius: 0.35rem;
        margin-right: 10px;

    }
    .boxtitle1{
        border-radius: calc(0.35rem - 1px) calc(0.35rem - 1px) 0 0;
        padding-bottom: 1rem !important;
        padding-top: 1rem !important;
        align-items: center!important;
        justify-content: space-between !important;
        flex-row: row !important;
        display: flex !important;
        padding:0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #f8f9fc;
        border-bottom: 1px solid #e3e6f0;
    }
    #box2 {
        margin-bottom: 1.5rem !important;
        width:398px;
        height:400px;
        box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15) !important;
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border:1px solid #e3e6f0;
        border-radius: 0.35rem;
        margin-right: 10px;


    }
    .boxtitle2{
        border-radius: calc(0.35rem - 1px) calc(0.35rem - 1px) 0 0;
        padding-bottom: 1rem!important;
        padding-top: 1rem!important;
        align-items: center!important;
        justify-content: space-between!important;
        flex-row: row!important;
        display: flex!important;
        padding:0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #f8f9fc;
        border-bottom: 1px solid #e3e6f0;
    }
    #box3 {
        margin-bottom: 1.5rem!important;
        width:398px;
        height:400px;
        box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15) !important;
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border:1px solid #e3e6f0;
        border-radius: 0.35rem;
        margin-right: 10px;


    }
    .boxtitle3{
        border-radius: calc(0.35rem - 1px) calc(0.35rem - 1px) 0 0;
        padding-bottom: 1rem!important;
        padding-top: 1rem!important;
        align-items: center!important;
        justify-content: space-between!important;
        flex-row: row!important;
        display: flex!important;
        padding:0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #f8f9fc;
        border-bottom: 1px solid #e3e6f0;
    }
    #box4 {
        margin-bottom: 1.5rem!important;
        width:398px;
        height:400px;
        box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15) !important;
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border:1px solid #e3e6f0;
        border-radius: 0.35rem;


    }
    .boxtitle4{
        border-radius: calc(0.35rem - 1px) calc(0.35rem - 1px) 0 0;
        padding-bottom: 1rem!important;
        padding-top: 1rem!important;
        align-items: center!important;
        justify-content: space-between!important;
        flex-row: row!important;
        display: flex!important;
        padding:0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #f8f9fc;
        border-bottom: 1px solid #e3e6f0;
    }
    .boxlist1{
        margin: 10px;
        width:100%;
        height:30px;
        border-bottom:0.25rem solid rgba(246, 242, 201, 0.67) !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15)!important;
        transition: box-shadow 0.1s ease;
        list-style-type: none;
        float: left;


    }
    .test2{
        overflow: auto;
    }
    .test2 ul{
        padding-left: 0px;
        font-size:.7rem;
        color:#5a5c69!important;
        font-weight: 700!important;
        text-transform: uppercase!important;
        margin-bottom: 0.25rem!important;
    }
</style>
<div class="card0">
    <div id="card1">
        <div class="info0">
            <div class="info1">
                <div class="text-area1">회원수</div>
                <div class="count-area1">${data.MemberCount}</div>
            </div>
            <div class="icon-area0">
                <div class="icon-area1"><i class="bi bi-person-circle"></i></div>
            </div>
        </div>
    </div>
    <div id="card2">
        <div class="info0">
            <div class="info1">
                <div class="text-area1">등록된 호텔 수</div>
                <div class="count-area1">${data.HotelCount}</div>
            </div>
            <div class="icon-area0">
                <div class="icon-area1"><i class="bi bi-hospital"></i></div>
            </div>
        </div>
    </div>
    <div id="card3">
        <div class="info0">
            <div class="info1">
                <div class="text-area1">예약현황</div>
                <div class="count-area1">500/200/30</div>
            </div>
            <div class="icon-area0">
                <div class="icon-area1"><i class="bi bi-calendar-check"></i></div>
            </div>
        </div>
    </div>
    <div id="card4">
        <div class="info0">
            <div class="info1">
                <div class="text-area1">신규문의</div>
                <div class="count-area1">500</div>
            </div>
            <div class="icon-area0">
                <div class="icon-area1"><i class="bi bi-telephone-inbound-fill"></i></div>
            </div>
        </div>
    </div>
</div>
<div id="box0">
    <div id="box1">
        <div class="boxtitle1">
            <span style="font-size:1.25rem;color:#5a5c69;font-weight: 700!important;"><i class="bi bi-megaphone" style="margin-right: 10px;">
            </i>최근 공지사항</span> <span style="cursor: pointer"><i class="bi bi-pencil-square"></i></span>
        </div>
        <div class="test2">
        <ul>
            <c:forEach items="${data.Notice}" var="item">
                <li class="boxlist1">${item.subject}</li>
            </c:forEach>
        </ul>
        </div>
    </div>
    <div id="box2">
        <div class="boxtitle2">
            <span style="font-size:1.25rem;color:#5a5c69;font-weight: 700!important;"><i class="bi bi-megaphone" style="margin-right: 10px;">
            </i>문의게시판</span>
        </div>
    </div>
    <div id="box3">
        <div class="boxtitle3">
            <h6>제목 000</h6>
        </div>
    </div>
    <div id="box4">
        <div class="boxtitle4">
            <h6>제목 000</h6>
        </div>
    </div>
</div>