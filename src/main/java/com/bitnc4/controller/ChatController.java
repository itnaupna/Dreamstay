package com.bitnc4.controller;


import com.bitnc4.dto.ChatDto;
import com.bitnc4.dto.ChatMessage;
import com.bitnc4.dto.MemberDto;
import com.bitnc4.repo.ChatRoomRepository;
import com.bitnc4.service.ChatService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.Collections;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatController {

    private final SimpMessageSendingOperations smso;

    @Autowired
    ChatService cs;

    @Autowired
    ChatRoomRepository crr;

    @PostMapping("/chkconnect")
    @ResponseBody
    public boolean chkConnect(HttpSession session){
        if(session.getAttribute("useChat") != null)
            return (boolean)session.getAttribute("useChat");
        else
            return false;
    }


    @PostMapping("/recent")
    @ResponseBody
    public List<ChatDto> getRecentChatList(HttpSession session){

            MemberDto mdto = (MemberDto) session.getAttribute("loginuser");
            if (mdto == null)
                return null;
            else {
                List result = cs.getRecentChat(mdto.getNum(), 10);
                Collections.reverse(result);
                return result;
            }

    }
@PostMapping("/recent/admin")
@ResponseBody
public List<ChatDto> getRecentChatAdmin(HttpSession session, int room){
    MemberDto mdto = (MemberDto) session.getAttribute("loginuser");
    if (mdto == null)
        return null;
    else {
        if(mdto.getUser_level()<10) return null;
        System.out.println(room);
        List result = cs.getRecentChat(room, 100);
        Collections.reverse(result);
        return result;
    }
}


    @PostMapping("/start")
    @ResponseBody
    public boolean createRoom(String name, HttpSession session){
        MemberDto mdto = (MemberDto) session.getAttribute("loginuser");
        if(mdto==null){
            return false;
        }else{
            crr.createChatRoom(mdto.getNum());
            session.setAttribute("useChat",true);
            return true;
        }

    }

    @MessageMapping("/chat/message")
    public void message(CM msg, SimpMessageHeaderAccessor accessor){
        MemberDto mdto = (MemberDto) accessor.getSessionAttributes().get("loginuser");
        if(mdto != null){
            ChatDto cdto = new ChatDto();
            cdto.setMembernum(msg.getRoom());
            cdto.setMsg(msg.getMsg());
            if(mdto.getUser_level() < 10){
                cdto.setRecv(1);
                cdto.setMemberview(1);
                cdto.setAdminview(0);
            }else{
                cdto.setRecv(0);
                cdto.setMemberview(0);
                cdto.setAdminview(1);
            }
            smso.convertAndSend("/sub/chat/" + msg.getRoom(),cdto);
            cs.saveChat(cdto);
            crr.changeLastChat(msg.getRoom());
            //관리자면
            //TODO : Code.
        }
    }

    @Data
    @ToString
    static class CM{
        private String msg;
        private int room;
    }


}
