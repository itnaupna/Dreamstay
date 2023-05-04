package com.bitnc4.dto;



import lombok.Data;
import lombok.extern.slf4j.Slf4j;



import java.util.UUID;

@Slf4j
@Data
public class ChatRoomDto {

    //방 ID
    private String roomId; //UUID를 이용하여 랜덤UUID 셋팅.
    private String roomName; //방이름 :)

    public static ChatRoomDto create(String name){
        ChatRoomDto cRoom = new ChatRoomDto();
        cRoom.roomId = UUID.randomUUID().toString();
        cRoom.roomName = name;
        return cRoom;
    }

}
