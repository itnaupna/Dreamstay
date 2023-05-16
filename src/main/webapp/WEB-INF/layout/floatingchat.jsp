<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<i id="btnChat" class="bi bi-chat-text" style="font-size:2rem;"></i>
<div id="chatInner">
    <div id="chatTitle">
        <span><img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/con3.png" style="width:30px;height:30px;margin-right:5px;">DreamStay</span>
        <span id="btnCloseChat">X</span>
    </div>
    <div id="txtChatViewPort">
        <%--        <div class="chatMsgWrapper chatLeft">--%>
        <%--            <div class="chatMsgBody">--%>
        <%--                안녕하세요, 채팅메세지 css뷰 테스트입니다.--%>
        <%--            </div>--%>
        <%--            <div class="chatMsgBottom">--%>
        <%--                <span class="chatMsgTime">오전 00:00</span>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="chatMsgWrapper chatRight">--%>
        <%--            <div class="chatMsgBody">--%>
        <%--                안녕하세요, 채팅메세지 css뷰 테스트입니다.--%>
        <%--            </div>--%>
        <%--            <div class="chatMsgBottom">--%>
        <%--                <span class="chatMsgTime">오전 00:00</span>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>

    <div id="txtChatBottom" class="form-floating">
        <input type="text" id="txtChat" placeholder="_" class="form-control">
        <label class="form-label">실시간 문의 입력</label>
    </div>
</div>
<style>
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
    .chatMsgBody{
        font-size:.9rem;
        color:#000000b8;
        /*font-weight: 700!important;*/
        margin-bottom: 0.25rem!important;
        word-break: break-all;
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
        left: 150px;
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
        right: 150px;
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
        padding-top: 10px;
    }
    .chatMsgTime{
        font-size:.7rem;
        color:#000000b8;
        /*font-weight: 700!important;*/
        /*text-transform: uppercase!important;*/
        margin-bottom: 0.25rem!important;
    }

    #chatInner{
        display:none;
        flex-direction: column;
        margin : 10px 25px;
        position:relative;
        height: calc(100% - 20px);
    }
    #chatTitle{
        order:1;
        flex-grow:1;
        justify-content: space-between;
        display:flex;
        font-size:1.1rem;
        color:#000000b8;
        font-weight: 600!important;
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

    aside.floatingchat{
        position:fixed;
        bottom: 10px;
        right: 10px;
        z-index:999;
        border: 3px solid rgb(152,129,34);
        background-color:white;
        border-radius:1.775rem;
        height:4rem;
        width:4rem;
        text-align:center;
    }
    #chatTitle #btnCloseChat{
        cursor:pointer;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stomp-websocket@2.3.4-next/lib/stomp.min.js"></script>
<script>
    CheckUsingChat();
    GetRecent();
    function CheckUsingChat(){
        $.ajax({
            url:'/chat/chkconnect',
            type:'post',
            success:(e)=>{
                if(e) {
                    //GetRecent();
                    NewConnect();
                }
            }
        });
    }

    function NewConnect(msg){
        $.ajax({
            url:'/chat/start',
            type:'post',
            dataType:'json',
            success:(e)=>{
                if(e){
                    connect(msg);
                }
            }
        });
    }
    let ws;
    //connect();
    function connect(msg){
        let sock=new SockJS("/ws-stomp");
        ws = Stomp.over(sock);
        let reconnect = 0;
        ws.connect({}, function(f){
            ws.subscribe("/sub/chat/${loginuser.num}",function(msg){
                let data = JSON.parse(msg.body);
                let LR = data.recv==0?'L':'R';
                $('#txtChatViewPort').append(
                    CreateChat(data.msg,new Date().toLocaleString(),`\${data.recv ? 'R' : 'L'}`));
                    $('#txtChatViewPort').scrollTop($('#txtChatViewPort')[0].scrollHeight);

            });
            if(msg !== undefined)
                ws.send("/pub/chat/message", {}, JSON.stringify({msg:msg,room:'${loginuser.num}'}));
        },function(err){
            console.log("err");
        });
    }

    function chat(msg){
        if(ws===undefined){
            NewConnect(msg);
        }else{
            ws.send("/pub/chat/message", {}, JSON.stringify({msg:msg,room:'${loginuser.num}'}));
            $('#txtChatViewPort').scrollTop($('#txtChatViewPort')[0].scrollHeight);
        }
    }


    function GetRecent(){
        $.ajax({
            url:'/chat/recent',
            type:'post',
            dataType:'json',
            success:(e)=>{
                $('#txtChatViewPort').empty();
                $.each(e,(i,item)=>{
                    $('#txtChatViewPort').append(
                        CreateChat(item.msg,new Date(item.date).toLocaleString(),`\${item.recv ? 'R' : 'L'}`)
                    );
                });
                $('#txtChatViewPort').scrollTop($('#txtChatViewPort')[0].scrollHeight);
            },
            error:(e)=>{

            }
        });
    }
    $('#btnChat').on({
        'click':(e)=>{
            $('aside.floatingchat').css({
                'height':'500px',
                'width':'300px',
                'background-color':'rgba(255,255,255,0.9)',
                'transition':'all ease 0.2s 0s'
            });
            $(e.target).hide();
            $('#chatInner').css({
                'display':'flex'
            });
            $('#txtChatViewPort').scrollTop($('#txtChatViewPort')[0].scrollHeight);
        }
    });
    $('#chatTitle #btnCloseChat').on({
        'click':(e)=>{
            $('#btnChat').show();
            $('aside.floatingchat').css({
                'height':'4rem',
                'width':'4rem',
                'background-color':'white',
                'transition':'all ease 0.2s 0s'
            });
            $('#chatInner').hide();
        }
    });
    function CreateChat(msg,time,direction){
        return $('<div>')
            .addClass('chatMsgWrapper')
            .addClass(`\${direction === 'L' ? 'chatLeft' : 'chatRight'}`)
            .append(
                $('<div>')
                    .addClass('chatMsgBody')
                    .text(msg)
            )
            .append(
                $('<div>')
                    .addClass('chatMsgBottom')
                    .append(
                        $('<span>')
                            .addClass('chatMsgTime')
                            .text(time)
                    )
            );
    }
    $('#txtChat').on({
        'keyup':(e)=>{
            let msg = $(e.target).val().trim();
            if(e.keyCode==13 && msg.length>0) {
                chat(msg);
                $(e.target).val('');
            }
        }
    });
</script>
