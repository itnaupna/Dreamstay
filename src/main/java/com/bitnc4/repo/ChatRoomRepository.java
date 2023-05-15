package com.bitnc4.repo;


import com.bitnc4.dto.ChatRoomDto;
import com.bitnc4.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;


//chatService 대체함.
@Repository
@Slf4j
public class ChatRoomRepository {
    private Map<String, ChatRoomDto> chatRoomMap;

    @Autowired
    ChatService cs;
    

    @PostConstruct
    private void init(){
        chatRoomMap = new LinkedHashMap<>();
    }

    public List<ChatRoomDto> getAll(){
        List lst = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(lst);
        return lst;
    }

    public ChatRoomDto getRoomById(String memberName)
    {

        return chatRoomMap.get(memberName);

    }

    public ChatRoomDto createChatRoom(int memberNum,String memberName){
        ChatRoomDto cRoom = ChatRoomDto.create(memberNum+memberName);
        cRoom.setMemberLastchat(cs.getLastChat(memberNum, memberName).getMsg());
        cRoom.setLastTimeStamp(cs.getLastChat(memberNum,memberName).getDate());
        chatRoomMap.put(cRoom.getMemberName(),cRoom);
        return cRoom;
    }

    public void changeLastChat(int memberNum,String memberName){
        ChatRoomDto cRoom = chatRoomMap.get(memberNum+memberName);
        cRoom.setMemberLastchat(cs.getLastChat(memberNum, memberName).getMsg());
        cRoom.setLastTimeStamp(cs.getLastChat(memberNum,memberName).getDate());
    }
    public void changeLastChat(String roomName){

        ChatRoomDto cRoom = chatRoomMap.get(roomName);
        log.info(cRoom.toString());
        cRoom.setMemberLastchat(cs.getLastChat(roomName).getMsg());
        cRoom.setLastTimeStamp(cs.getLastChat(roomName).getDate());
    }
}
