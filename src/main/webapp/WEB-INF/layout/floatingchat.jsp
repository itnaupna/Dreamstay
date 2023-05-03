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
    <div id="txtChatViewPort" style="">

    </div>
    <div id="txtChatBottom">
        <input type="text" id="txtChat"><span>[&gt;]</span>
    </div>
</div>
<style>
    #txtChatBottom{
        bottom:0px;
        position: absolute;
    }
    #txtChat{
        width:200px;
    }
    #chatInner{
        display:none;
        margin : 10px 25px;
        position:relative;
        height: calc(100% - 20px);
    }
    #chatTitle{
        display: flex;
        justify-content: space-between;
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
            $('#chatInner').show();
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
