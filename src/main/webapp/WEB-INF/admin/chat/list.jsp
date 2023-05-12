<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="chatWrapper">
    <div id="chatList">
        <c:forEach items="${list}" var="item">
            <div class="chatlistWrapper">
                <div class="chatBody">
                    <div class="chatlistName">
                        ${fn:replace(item.memberName,"/","")}
                    </div>
                    <div class="chatlistContent">
                        ${item.memberLastchat}
                    </div>
                </div>
                <div class="chatlistTimestamp">
                        <fmt:formatDate value="${item.lastTimeStamp}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            </div>
        </c:forEach>
<%--        <div class="chatlistWrapper">--%>
<%--            <div class="chatBody">--%>
<%--                <div class="chatlistName">--%>
<%--                    애옹이--%>
<%--                </div>--%>
<%--                <span class="chatlistContent">이 호텔은 고양이 말고 사람도 숙박이 가능한가요.알고 싶어요.</span>--%>
<%--            </div>--%>
<%--            <span class="chatlistTimestamp">2023-05-10 23:23</span>--%>
<%--        </div>--%>
    </div>
    <div id="chatView">
        <div id="chatViewTitle">
            <span>애옹이</span>
        </div>
        <div id="txtChatViewPort">
            <div class="chatMsgWrapper chatLeft">
                <div class="chatMsgBody">
                    채팅내용
                </div>
                <div class="chatMsgBottom">
                    <span class="chatMsgTime">2023-05-10 23:23</span>
                </div>
            </div>
            <div class="chatMsgWrapper chatRight">
                <div class="chatMsgBody">
                    안녕하세요, 채팅메세지 css뷰 테스트입니다.
                </div>
                <div class="chatMsgBottom">
                    <span class="chatMsgTime">오전 00:00</span>
                </div>
            </div>
        </div>
        <div id="txtChatBottom" class="form-floating">
            <input type="text" id="txtChat" placeholder="_" class="form-control">
            <label class="form-label">실시간 문의 입력</label>
        </div>
    </div>
</div>
<style>
    #chatWrapper{
        display: inline-flex;
        width:100%;
        justify-content: center;
        height:100%;
    }
    #chatList{
        width:400px;
        max-width:50%;
        border-radius:0.825rem;
        border:0.25rem solid #dbc396 !important;
        padding:15px;
        overflow-y:auto;
        height:100%;
        position:relative;
        overflow-x:hidden;
        margin-right: 10px;

    }

    #chatView{
        width:800px;
        max-width:50%;
        border-radius:0.825rem;
        border:0.25rem solid #dbc396 !important;
        padding:15px;
        overflow-y:auto;
        height:100%;
        position:relative;
        overflow-x:hidden;
        /*display:none;*/
    }
    .chatlistWrapper{
        border-radius: 0.825rem;
        border-left: 0.25rem solid rgba(106,184,193,0.33) !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15) !important;
        transition: box-shadow 0.1s ease;
        padding:10px;
        width:100%;
        height:100px;
        display:inline-flex;
        margin-bottom:10px;
        align-items: center;
        font-size:.5rem;
        color:gray;
        justify-content: space-between;
    }
    .chatlistWrapper:hover{
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.4) !important;
        transition: box-shadow 0.1s ease;
        cursor:pointer;
    }
    .chatlistName{
        margin-bottom: 10px;
        font-weight: bold;
    }
    .chatlistTimestamp{
        padding-left:20px;

    }
    #chatViewTitle{
        border-radius: 0.825rem;
        border-left: 0.25rem solid rgba(106,184,193,0.33) !important;
        box-shadow: 0 .15rem 1.0rem 0 rgba(58,59,69,.15) !important;
        transition: box-shadow 0.1s ease;
        padding:10px;
        width:100%;
        height:10px;
        display:inline-flex;
        margin-bottom:10px;
        align-items: center;
        color:gray;
        font-weight: bold;
        justify-content: space-between;
    }
    .chatMsgBody{
        color:#000000b8;
        font-weight: 700!important;
        text-transform: uppercase!important;
        margin-bottom: 0.25rem!important;
    }
    .chatRight{
        float:right;
        border-left: .25rem solid #eb971f5c!important;
        align-self: flex-start;
    }
    .chatRight:before{
        content:"";
        position: absolute;
        border-style:solid;
        border-width: 0 15px 15px 0;
        border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) transparent transparent;
        bottom:-15px;
        left: 430px;
    }
    .chatLeft{
        float:left;
        border-right: .25rem solid #7899fb5c!important;
        align-self: flex-end;

    }
    .chatLeft:after{
        content:"";
        position: absolute;
        border-style: solid;
        border-width: 15px 15px 0 0;
        border-color:rgba(0,0,0,0.1) transparent transparent transparent;
        bottom:-15px;
        right: 430px;
    }
    .chatLeft .chatMsgBottom{
        text-align:left;
    }
    .chatRight .chatMsgBottom{
        text-align:right;
    }
    .chatMsgBottom>div{
        display:inline-flex;
    }
    .chatMsgBottom{
        margin-bottom:-5px;
        padding-top: 20px;
    }
    .chatMsgTime{
        font-size:.8rem;
        color:#000000b8;
        font-weight: 700!important;
        text-transform: uppercase!important;
        margin-bottom: 0.25rem!important;
    }
    #txtChatViewPort{
        order:2;
        flex-grow: 98;
        padding: 10px 0px;
        /*background:gray;*/
        overflow-x: hidden;
        overflow-y: auto;
    }
    #txtChatBottom{
        order:3;
        flex-grow:1;
        /*display:flex;*/
        /*justify-content: space-between;*/
    }
    #txtChat{
        /*width:200px;*/
        background:transparent;
        border:none;
    }
    #txtChat:focus{
        outline:none !important;
        box-shadow: 0 0 10px rgb(152,129,34);

    }
    .chatMsgWrapper{
        width:80%;
        margin-bottom:10px;
        border-radius: 20px;
        box-shadow: 0px 3px 3px rgba(0,0,0,0.2);
        color:#333333;
        padding: 10px;
        position: relative;
        text-align: left;

    }
</style>
<script>
    SetAdminTitle('채팅관리페이지');
    $('#chatList').on('click','.chatlistWrapper',(e)=>{
        $('#chatView').text($(e.currentTarget).children()[0].children[0].innerText);
    });
    //getroomlist();
    // function getroomlist(){
    //     $.ajax({
    //         url:'/chat/rooms',
    //         type:'get',
    //         dataType:'json',
    //         success:e=>{
    //             $('#chatList').empty();
    //             $.each(e,(i,e)=>{
    //                 $('#chatList').append(
    //                     `<div class="chatlistWrapper">
    //                         <div class="chatlistName">\${e.roomId}</div>
    //                         <div class="chatlistContent">\${e.roomName}</div>
    //                         <div class="chatlistTimestamp">2323.23.23 23:23</div>
    //                     </div>`
    //                 );
    //             });
    //         }
    //     });
    // }
</script>