package com.bitnc4.mapper;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.dto.RoomDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminHnRMapper {

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
    public RoomDto getRoomSimpleInfo(int num);
    public void updateRoomSimpleInfo(RoomDto dto);
}
