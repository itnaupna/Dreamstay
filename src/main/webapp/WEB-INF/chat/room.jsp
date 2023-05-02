<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type="text" id="rname">
<button onclick="createroom($('#rname').val());">만들기</button>
<div id="res"></div>
<script>


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
    function createroom(rname){
        $.ajax({
            url:'room',
            type:'post',
            dataType:'json',
            data:{name:rname},
            success:getroomlist
        });
    }
    function enterRoom(roomId){
        let membernum = prompt('멤버idx입력');
        if(membernum != ""){
            localStorage.setItem('wschat.mem',membernum);
            localStorage.setItem('wschat.roomId',roomId);
            location.href="/chat/room/enter/"+roomId;
        }
    }
</script>