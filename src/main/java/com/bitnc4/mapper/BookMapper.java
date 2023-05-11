package com.bitnc4.mapper;


import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.RoomDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {

/*    public List<RoomDto> getroomlist();*/

    public List<RoomDto> searchroom(BookDto dto);
}
