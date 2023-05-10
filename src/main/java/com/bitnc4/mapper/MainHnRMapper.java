package com.bitnc4.mapper;

import com.bitnc4.dto.HotelDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainHnRMapper {
    List<HotelDto> getHotels();
}
