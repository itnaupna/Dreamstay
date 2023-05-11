package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.mapper.HotelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HotelService implements HotelServiceInter{

    @Autowired
    HotelMapper hotelMapper;
    @Override
    public List<HotelDto> getAllHotelData() {
        List<HotelDto> hotelList = hotelMapper.getAllHotelData();
        return hotelList;
    }
}
