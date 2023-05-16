package com.bitnc4.dto;



import com.bitnc4.service.ChatService;
import com.bitnc4.service.MemberService;
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
    private int memberNum; //member.user_name
    private String memberLastchat; //member.user_name
    private String memberName;
    private Timestamp lastTimeStamp;

    public static ChatRoomDto create(int memberNum){

        ChatRoomDto cRoom = new ChatRoomDto();
        cRoom.memberNum = memberNum;
        cRoom.memberLastchat = "";
        return cRoom;
    }
}
