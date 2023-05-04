package com.bitnc4.dto;



import lombok.Data;
import lombok.extern.slf4j.Slf4j;



import java.util.UUID;

@Slf4j
@Data
public class ChatRoomDto {

    //방 ID
    private String roomId; //member.id
    private String roomName; //member.user_name

    public static ChatRoomDto create(String name){
        //TODO : session에 저장된 유저정보 갖고와서 ID,이름 생성토록 해야함

        ChatRoomDto cRoom = new ChatRoomDto();
        cRoom.roomId = UUID.randomUUID().toString();
        cRoom.roomName = name;
        return cRoom;
    }

}
