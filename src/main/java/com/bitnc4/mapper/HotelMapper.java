package com.bitnc4.mapper;

import com.bitnc4.dto.HotelDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HotelMapper {
    // 호텔 db 전체 출력
    public List<HotelDto> getAllHotelData();

    // 클릭한 호텔 출력
    public List<Map<String, String>> getHotelData(int num);
}
