package com.bitnc4.dto;



import com.bitnc4.service.ChatService;
import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;


import java.sql.Timestamp;
import java.util.UUID;

@Slf4j
@Data
@ToString
public class ChatRoomDto {

    //방 ID
    private String memberName; //member.user_name
    private String memberLastchat; //member.user_name

    private Timestamp lastTimeStamp;

    public static ChatRoomDto create(String memberName){

        ChatRoomDto cRoom = new ChatRoomDto();
        cRoom.memberName = memberName;
        cRoom.memberLastchat = "";
        return cRoom;
    }

}
