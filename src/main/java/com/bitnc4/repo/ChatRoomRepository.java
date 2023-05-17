package com.bitnc4.repo;


import com.bitnc4.dto.ChatRoomDto;
import com.bitnc4.service.ChatService;
import com.bitnc4.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;


//chatService 대체함.
@Repository
@Slf4j
public class ChatRoomRepository {
    private Map<Integer, ChatRoomDto> chatRoomMap;

    @Autowired
    ChatService cs;
    @Autowired
    MemberService ms;

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

    public ChatRoomDto createChatRoom(int memberNum){
        ChatRoomDto cRoom = ChatRoomDto.create(memberNum);
        cRoom.setMemberLastchat(cs.getLastChat(memberNum).getMsg());
        cRoom.setLastTimeStamp(cs.getLastChat(memberNum).getDate());
        cRoom.setMemberName(ms.getMemberByNumber(memberNum).getUser_name());
        chatRoomMap.put(cRoom.getMemberNum(),cRoom);
        return cRoom;
    }

    public void changeLastChat(int memberNum){
        ChatRoomDto cRoom = chatRoomMap.get(memberNum);
        cRoom.setMemberLastchat(cs.getLastChat(memberNum).getMsg());
        cRoom.setLastTimeStamp(cs.getLastChat(memberNum).getDate());
    }
}
