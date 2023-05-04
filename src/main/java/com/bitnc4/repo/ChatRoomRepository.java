package com.bitnc4.repo;


import com.bitnc4.dto.ChatRoomDto;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;


//chatService 대체함.
@Repository
public class ChatRoomRepository {
    private Map<String, ChatRoomDto> chatRoomMap;

    @PostConstruct
    private void init(){
        chatRoomMap = new LinkedHashMap<>();
    }

    public List<ChatRoomDto> getAll(){
        List lst = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(lst);
        return lst;
    }

    public ChatRoomDto getRoomById(String id){
        return chatRoomMap.get(id);
    }

    public ChatRoomDto createChatRoom(String name){
        ChatRoomDto cRoom = ChatRoomDto.create(name);
        chatRoomMap.put(cRoom.getRoomId(),cRoom);
        return cRoom;
    }
}
