package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;

import java.util.List;

public interface AdminHnRServiceInter {
    public List<HotelDto> getHotels();
    public List<RoomDto> getRoomsByHotelNum(int hotelnum);
    public HotelDto getHotelByHotelNum(int hotelnum);
    public boolean updateHotelDetail(HotelDto dto);

}
