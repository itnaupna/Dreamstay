package com.bitnc4.repo;


import com.bitnc4.dto.ChatRoomDto;
import com.bitnc4.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;


//chatService 대체함.
@Repository
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

    public ChatRoomDto createChatRoom(String memberName){
        ChatRoomDto cRoom = ChatRoomDto.create(memberName);
        cRoom.setMemberLastchat(cs.getLastChatByMemberName(memberName).getMsg());
        chatRoomMap.put(cRoom.getMemberName(),cRoom);
        return cRoom;
    }
}
