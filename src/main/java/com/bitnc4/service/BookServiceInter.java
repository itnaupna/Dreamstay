package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;

import java.util.List;
import java.util.Map;

public interface BookServiceInter {


    public List<RoomDto> searchroom(BookDto dto);

    public String hotelname(int selectedHotel);

    /* public List<RoomDto> getroomlist();*/

    // 비회원 예약 출력
    public Map<String, String> getNomemberBookData(String searchnum, String bookpw);
}
