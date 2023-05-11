package com.bitnc4.service;

import com.bitnc4.dto.ChatDto;

import java.util.List;

public interface ChatServiceInter {
    public ChatDto getLastChatByMemberName(String memberName);
    public List<ChatDto> getRecentChat(String memberName, int count);
    public List<ChatDto> getRecentChat(String memberName);
    public void saveChat(ChatDto cdto);

}
