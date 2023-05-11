package com.bitnc4.service;

import com.bitnc4.dto.ChatDto;
import com.bitnc4.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ChatService implements ChatServiceInter {
    @Autowired
    ChatMapper m;

    @Override
    public ChatDto getLastChatByMemberName(String memberName) {
        return m.getLastChatByMemberName(memberName);
    }

    @Override
    public List<ChatDto> getRecentChat(String memberName, int count) {
        Map<String, Object> map = new HashMap<>();
        map.put("name",memberName);
        map.put("count",count);
        return m.getRecentChat(map);
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
