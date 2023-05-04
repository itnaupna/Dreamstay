package com.bitnc4.dto;

import lombok.Data;


@Data
public class ChatMessage {
    //채팅용 패킷 헤더 : 입장, 대화
    public enum PacketHeader{
        ENTER, SAY, EXIT
    }


    private PacketHeader type; //패킷 타입
    private String roomId; //채팅방 번호
    private int memberNum; //멤버 ID. member테이블의 num(인덱스)값.
    private String msg;
}
