package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;

import java.util.List;

public interface HotelServiceInter {

    // 호텔 db 전체 출력
    public List<HotelDto> getAllHotelData();
}
