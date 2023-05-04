<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <div id="res">

    </div>

<script>
    $('section.top').text('DreamStay 채팅문의');
    getroomlist();


    function getroomlist(){
        $.ajax({
            url:'/chat/rooms',
            type:'get',
            dataType:'json',
            success:e=>{
                $('#res').empty();
                $.each(e,(i,e)=>{
                    $('#res').append("<div onclick='enterRoom(\""+ e.roomId + "\");'>" + e.roomId + " " + e.roomName + "</div>");
                });
            }
        });
    }
</script>