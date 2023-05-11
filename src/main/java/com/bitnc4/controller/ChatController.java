package com.bitnc4.controller;


import com.bitnc4.dto.ChatDto;
import com.bitnc4.dto.ChatMessage;
import com.bitnc4.dto.MemberDto;
import com.bitnc4.repo.ChatRoomRepository;
import com.bitnc4.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
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
    @Autowired
    HttpServletRequest request;
    private HttpSession getHttpSession(){
        String requestedSessionId = request.getRequestedSessionId();

        HttpSession session = request.getSession(false);
        if(session == null || !session.getId().equals(requestedSessionId))
            throw new IllegalStateException("No Session");
        return session;
    }
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
        if(mdto==null)
            return null;
        else{
            return cs.getRecentChat(mdto.getUser_name(),10);
        }
    }

    @PostMapping("/start")
    @ResponseBody
    public boolean createRoom(String name, HttpSession session){
        MemberDto mdto = (MemberDto) session.getAttribute("loginuser");
        if(mdto==null){
            return false;
        }else{
            crr.createChatRoom(mdto.getUser_name());
            session.setAttribute("useChat",true);
            return true;
        }

    }

    @MessageMapping("/chat/message")
    public void message(String msg){
        HttpSession session = getHttpSession();
        MemberDto mdto = (MemberDto) session.getAttribute("loginuser");
        if(mdto != null){
            log.info(mdto.toString());
            //채팅 전송
            //TODO : 채팅저장부분 추가해야함
            ChatDto cdto = new ChatDto();
            cdto.setMembernum(mdto.getNum());
            cdto.setMsg(msg);
            if(mdto.getUser_level() < 10){
                cdto.setRecv(1);
                cdto.setMemberview(1);
                cdto.setAdminview(0);
            }else{
                cdto.setRecv(0);
                cdto.setMemberview(1);
                cdto.setAdminview(1);
            }

            cs.saveChat(cdto);
            smso.convertAndSend("/sub/chat/" + mdto.getUser_name(),cdto);
        }

        //log.info(msg.toString());
//        switch (msg.getType()){
//            case ENTER:
//                //msg.setMsg(msg.getMemberNum() + "님이 입장!");
//                break;
//            case SAY:
//                //채팅입력시 DB에 채팅내용을 저장토록 한다.
//                //저장시 관리자가 말한건지, 유저가 말한건지 구분해야함.
//                break;
//            case EXIT:
//                //소켓연결이 끊겼는지, 또는 방나감을 하는지 확인해야한다.
//                break;
//        }
//        smso.convertAndSend("/sub/chat/room/"+ msg.getRoomId(),msg);
    }


}
