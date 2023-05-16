package com.bitnc4.service;

import com.bitnc4.dto.ChatDto;

import java.util.List;

public interface ChatServiceInter {
    public List<ChatDto> getRecentChat(int memberNum, int count);
    public void saveChat(ChatDto cdto);

}
