package com.bitnc4.mapper;


import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BookMapper {
    public List<RoomDto> searchroom(BookDto dto);

    public  String hotelname (int selectedHotel);

    // 비회원 예약 출력
    public Map<String, String> getNomemberBookData(Map<String, String> data);
}
