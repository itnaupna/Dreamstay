<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="chatWrapper">
    <div id="chatList">
        <div class="chatlistWrapper">
            <div class="chatlistName">애옹이</div>
            <div class="chatlistContent">이 호텔은 고양이 말고 사람도 숙박이 가능한가요. 알고 싶어요.</div>
            <div class="chatlistTimestamp">2323.23.23 23:23</div>
        </div>
    </div>
    <div id="chatView">

    </div>
</div>
<style>
    #chatWrapper{
        background-color:green;
        display: inline-flex;
        width:100%;
        justify-content: center;
        height:100%;
    }
    #chatList{
        border:1px solid gray;
        width:400px;
        max-width:50%;
        background-color:skyblue;

    }

    #chatView{
        border:1px solid gray;
        width:400px;
        background-color:pink;
        max-width:50%;
        overflow-x:hidden;
        /*display:none;*/
    }

</style>
<script>
    SetAdminTitle('채팅관리페이지');
    $('#chatList').on('click','.chatlistWrapper',(e)=>{
       $('#chatView').text($(e.target).text());
    });
    getroomlist();
    function getroomlist(){
        $.ajax({
            url:'/chat/rooms',
            type:'get',
            dataType:'json',
            success:e=>{
                $('#chatList').empty();
                // $('#res').empty();
                $.each(e,(i,e)=>{
                    $('#chatList').append(
                        `<div class="chatlistWrapper">
                            <div class="chatlistName">\${e.roomId}</div>
                            <div class="chatlistContent">\${e.roomName}</div>
                            <div class="chatlistTimestamp">2323.23.23 23:23</div>
                        </div>`
                    );
                    //$('#res').append("<div onclick='enterRoom(\""+ e.roomId + "\");'>" + e.roomId + " " + e.roomName + "</div>");
                });
            }
        });
    }
</script>