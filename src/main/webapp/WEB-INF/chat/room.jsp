<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type="text" id="rname">
<button onclick="createroom($('#rname').val());">만들기</button>
<div id="res"></div>
<script>
    getroomlist();

    function getroomlist(){
        $.ajax({
            url:'/chat/rooms',
            type:'get',
            dataType:'json',
            success:e=>{
                // console.log(e);
                $('#res').empty();
                $.each(e,(i,e)=>{
                    $('#res').append("<div onclick='enterRoom(\""+ e.roomId + "\");'>" + e.roomId + " " + e.roomName + "</div>");
                });
            }
        });
    }
    function createroom(rname){
        console.log(rname,'makeroom');
        $.ajax({
            url:'room',
            type:'post',
            dataType:'json',
            data:{name:rname},
            success:(e)=>{
                console.log(e);
                getroomlist();
                //TODO : 이부분 봐서 수정해야함.
                //방생성 누를경우 리턴이 어떻게 넘어오고 있는거지???
                //푸시용 수정
            }
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