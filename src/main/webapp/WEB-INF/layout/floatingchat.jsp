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

        <div class="chatMsgWrapper chatLeft">
            <div class="chatMsgBody">
                안녕하세요, 채팅메세지 css뷰 테스트입니다.
            </div>
            <div class="chatMsgTail">
                <div class="chatMsgTailLeft">d</div>
                <div class="chatMsgTime">오전 00:00</div>
                <div class="chatMsgTailRight">d</div>
            </div>
        </div>
        <div class="chatMsgWrapper chatRight">
            <div class="chatMsgBody">
                안녕하세요, 채팅메세지 css뷰 테스트입니다.
            </div>
            <div class="chatMsgTail">
                <div class="chatMsgTailLeft">d</div>
                <div class="chatMsgTime">오전 00:00</div>
                <div class="chatMsgTailRight">d</div>
            </div>
        </div>
        <div class="chatMsgWrapper chatLeft">
            <div class="chatMsgBody">
                안녕하세요, 채팅메세지 css뷰 테스트입니다.
            </div>
            <div class="chatMsgTail">
                <div class="chatMsgTailLeft">d</div>
                <div class="chatMsgTime">오전 00:00</div>
                <div class="chatMsgTailRight">d</div>
            </div>
        </div>
        <div class="chatMsgWrapper chatRight">
            <div class="chatMsgBody">
                안녕하세요, 채팅메세지 css뷰 테스트입니다.
            </div>
            <div class="chatMsgTail">
                <div class="chatMsgTailLeft">d</div>
                <div class="chatMsgTime">오전 00:00</div>
                <div class="chatMsgTailRight">d</div>
            </div>
        </div>

    </div>
    <div id="txtChatBottom">
        <input type="text" id="txtChat" placeholder="메세지를 입력하세요." class="form-control"><button class="btn">[&gt;]</button>
    </div>
</div>
<style>
    .chatMsgWrapper{
        border: 2px solid skyblue;
        border-radius: 0.5rem;
    }
    .chatMsgTail>div{
        display:inline-flex;
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
    }
    #txtChatViewPort{
        order:2;
        flex-grow: 98;
        /*background:gray;*/
        overflow-x: hidden;
        overflow-y: auto;
    }
    #txtChatBottom{
        order:3;
        flex-grow:1;
        display:flex;
        justify-content: space-between;
    }
    #txtChat{
        width:200px;
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

<script>
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
</script>
