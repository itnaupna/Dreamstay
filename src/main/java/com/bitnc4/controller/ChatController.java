package com.bitnc4.controller;


import com.bitnc4.dto.ChatMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ChatController {

    private final SimpMessageSendingOperations smso;

    @MessageMapping("/chat/message")
    public void message(ChatMessage msg){
      log.info(msg.toString());
        switch (msg.getType()){
            case ENTER:
                msg.setMsg(msg.getMemberNum() + "님이 입장!");
                break;
            case SAY:
                //채팅입력시 DB에 채팅내용을 저장토록 한다.
                //저장시 관리자가 말한건지, 유저가 말한건지 구분해야함.
                break;
            case EXIT:
                //소켓연결이 끊겼는지, 또는 방나감을 하는지 확인해야한다.
                break;
        }
        smso.convertAndSend("/sub/chat/room/"+ msg.getRoomId(),msg);

    }


}
