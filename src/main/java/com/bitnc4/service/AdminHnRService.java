package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.mapper.AdminHnRMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminHnRService implements AdminHnRServiceInter{

    @Autowired
    AdminHnRMapper m;

    @Override
    public List<HotelDto> getHotels() {
        return m.getHotels();
    }

    @Override
    public List<RoomDto> getRoomsByHotelNum(int hotelnum) {
        return m.getRoomsByHotelNum(hotelnum);
    }

    @Override
    public HotelDto getHotelByRoomHotelNum(int hotelnum) {
        return m.getHotelByRoomHotelNum(hotelnum);
    }

}
