package com.bitnc4.service;

import com.bitnc4.dto.ChatDto;
import com.bitnc4.mapper.ChatMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ChatService implements ChatServiceInter {
    @Autowired
    ChatMapper m;


    public ChatDto getLastChat(int memberNum, String memberName) {
        try {
            return getRecentChat(memberNum, memberName, 1).get(0);
            //return m.getLastChatByMemberName(memberName);
        }catch (Exception e) {
            ChatDto cdto= new ChatDto();
            cdto.setMsg("");
            return cdto;
        }
    }
    public ChatDto getLastChat(String roomName) {
        log.info(roomName);
        try {
            int memberNum = Integer.parseInt(roomName.split("/")[0]);
            String memberName = roomName.split("/")[1];
            return getRecentChat(memberNum, memberName, 1).get(0);
        }catch (Exception e) {
            ChatDto cdto= new ChatDto();
            cdto.setMsg("");
            return cdto;
        }
    }
    @Override
    public List<ChatDto> getRecentChat(int memberNum,String memberName, int count) {
        Map<String, Object> map = new HashMap<>();
        map.put("name",memberName);
        map.put("count",count);
        map.put("num",memberNum);
        try {
            return m.getRecentChat(map);
        }catch(Exception e){
            log.error("Err : [{}]",e.getMessage());
            return Collections.emptyList();
        }
    }
    @Override
    public List<ChatDto> getRecentChat(String memberName) {
        Map<String, Object> map = new HashMap<>();
        map.put("name",memberName);
        map.put("count",100);
        return m.getRecentChat(map);
    }

    @Override
    public void saveChat(ChatDto cdto) {
        m.saveChat(cdto);
    }
}
