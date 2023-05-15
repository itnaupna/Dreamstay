package com.bitnc4.mapper;

import com.bitnc4.dto.HotelDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelMapper {
    // 호텔 db 전체 출력
    public List<HotelDto> getAllHotelData();
}
