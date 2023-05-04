package com.bitnc4.mapper;

import com.bitnc4.dto.ChatDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    public List<ChatDto> test();
}
