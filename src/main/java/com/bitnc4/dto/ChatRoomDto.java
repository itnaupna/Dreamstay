package com.bitnc4.dto;



import com.bitnc4.service.ChatService;
import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.UUID;

@Slf4j
@Data
@ToString
public class ChatRoomDto {

    //방 ID
    private String memberName; //member.user_name
    private String memberLastchat; //member.user_name


    public static ChatRoomDto create(String memberName){
        //TODO : session에 저장된 유저정보 갖고와서 ID,이름 생성토록 해야함

        ChatRoomDto cRoom = new ChatRoomDto();
        cRoom.memberName = memberName;
        cRoom.memberLastchat = "";
        return cRoom;
    }

}
