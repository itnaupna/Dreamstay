package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;

import java.util.List;

public interface AdminHnRServiceInter {
    public List<HotelDto> getHotels();
    public List<RoomDto> getRoomsByHotelNum(int hotelnum);
    public HotelDto getHotelByHotelNum(int hotelnum);
    public int updateHotelDetail(HotelDto dto);
    public int insertHotel(HotelDto dto);
    public List<String> getRoomTypesOfHotel(int hotelnum);
    public int insertRoom(RoomDto dto);
    public int deleteRoom(int roomnum);
    public int getMemberCount(boolean containAdmin);
    public int getHotelCount();

    public void updateRoomDetail(RoomDto dto);
}
