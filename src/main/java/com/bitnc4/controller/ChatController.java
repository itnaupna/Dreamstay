package com.bitnc4.controller;


import com.bitnc4.dto.ChatMessageDto;
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
    public void message(ChatMessageDto msg){
      log.info(msg.toString());
        switch (msg.getType()){
            case ENTER:
                msg.setMsg(msg.getMemberNum() + "님이 입장!");
                break;
            case SAY:
                break;
        }
        smso.convertAndSend("/sub/chat/room/"+ msg.getRoomId(),msg);

    }


}
