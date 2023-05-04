<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input id="chatMsg"><button onclick="chat($('#chatMsg').val());">전송</button>
<div id="res"></div>
<button onclick="connect()">연결</button>
<div id="rID"></div>
<div id="uID"></div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stomp-websocket@2.3.4-next/lib/stomp.min.js"></script>



<script>
    let ws;
    connect();
    function connect(){
        let sock=new SockJS("/ws-stomp");
        ws = Stomp.over(sock);
        let reconnect = 0;
        ws.connect({}, function(f){
            ws.subscribe("/sub/chat/room/" + localStorage.getItem("wschat.roomId"),function(msg){
                let recv = JSON.parse(msg.body);
                console.log(recv);
                $('#res').append(recv.msg + "<br/>");
                $('#rID').text(localStorage.getItem("wschat.roomId"));
                $('#uID').text(localStorage.getItem("wschat.mem"));
                //alert();
            });
            ws.send("/pub/chat/message",{},JSON.stringify({type:'ENTER',roomId:localStorage.getItem("wschat.roomId"),memberNum:localStorage.getItem("wschat.mem")}));
        },function(err){
            console.log("err");
        });
    }

    function chat(msg){
        ws.send("/pub/chat/message",{},JSON.stringify({type:'SAY',roomId:localStorage.getItem("wschat.roomId"),memberNum:localStorage.getItem("wschat.mem"),msg:msg}));
    }

</script>


