<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>

<br><br>
<input type="text" id="rname">
<button onclick="createroom($('#rname').val());">만들기</button>
<div id="res"></div>
<br><br>
<br><br>

<div style="border:1px solid">
    <span>메뉴1</span><span>메뉴1</span><span>메뉴1</span><span>메뉴1</span>
</div>
<div id="testblock">
    test
</div>



<style>
    #testblock{
        position:absolute;
        left:100px;
        top:100px;
        width:400px;
        height:200px;
        border:1px solid;
        background-image:url("https://kr.object.ncloudstorage.com/dreamsstaybucket/hotel/eac75ef9-5980-4d43-8bd0-9e43dc08979b");
        background-size:contain;
        background-repeat: no-repeat;
        transition: all ease 1s;
    }
    #testblock:hover{
        background-size:120%;
    }
    span:not(:last-child)::after{
        content:'|';
        margin:0px 3px;
    }
    span:hover{
        text-decoration: underline;
    }
</style>
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