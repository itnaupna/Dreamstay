package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;

import java.util.List;
import java.util.Map;

public interface HotelServiceInter {

    // 호텔 db 전체 출력
    public List<HotelDto> getAllHotelData();

    // 클릭한 호텔과 객실 출력
    public List<Map<String, String>> getHotelData(int num);

    // 객실 사진별로 배열에 담아서 리턴
    public String[][] dividePhoto(List<Map<String, String>> list);


}


