package com.bitnc4.mapper;


import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.RoomDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {

    BookDto searchroomdto();
    public List<RoomDto> getroomlist();
}
