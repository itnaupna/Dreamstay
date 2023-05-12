package com.bitnc4.mapper;

import com.bitnc4.dto.ChatDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatMapper {
    public List<ChatDto> getRecentChat(Map<String, Object> data);
    public void saveChat(ChatDto cdto);
}
