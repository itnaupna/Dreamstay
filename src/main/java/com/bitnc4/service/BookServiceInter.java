package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;

import java.util.List;

public interface BookServiceInter {


    public List<RoomDto> searchroom(BookDto dto);

    public String hotelname(int selectedHotel);

    /* public List<RoomDto> getroomlist();*/
}
