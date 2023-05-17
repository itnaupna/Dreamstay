package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.QnaBoardDto;
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
    public int updateHotelDetail(HotelDto dto) {
        m.updateHotelDetail(dto);
        return dto.getNum();
    }

    @Override
    public int insertHotel(HotelDto dto){
        m.insertHotel(dto);
        return dto.getNum();
    }

    @Override
    public List<String> getRoomTypesOfHotel(int hotelnum) {
        return m.getRoomTypesOfHotel(hotelnum);
    }

    @Override
    public int insertRoom(RoomDto dto) {
        m.insertRoom(dto);
        return dto.getNum();
    }

    @Override
    public int deleteRoom(int roomnum) {
        return m.deleteRoom(roomnum);
    }

    @Override
    public int getMemberCount(boolean containAdmin) {
        return m.getMemberCount(containAdmin);
    }

    @Override
    public int getHotelCount() {
        return m.getHotelCount();
    }

    @Override
    public void updateRoomDetail(RoomDto dto) {
        m.updateRoomDetail(dto);
    }
}
