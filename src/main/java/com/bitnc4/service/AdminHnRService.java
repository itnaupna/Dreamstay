package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.mapper.AdminHnRMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
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
    public HotelDto getHotelByHotelNum(int hotelnum) {
        return m.getHotelByHotelNum(hotelnum);
    }

    @Override
    public boolean updateHotelDetail(HotelDto dto) {
        try{
            m.updateHotelDetail(dto);
            return true;
        }catch (Exception e) {
            log.error(e.getMessage());
            return false;
        }
    }


}
