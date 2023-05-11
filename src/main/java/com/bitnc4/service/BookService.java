package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService implements BookServiceInter{

    @Autowired
    BookMapper bookMapper;

    @Override
    public List<RoomDto> searchroom(BookDto dto) {
        return bookMapper.searchroom(dto);
    }

    @Override
    public String hotelname(int selectedHotel){
        return bookMapper.hotelname(selectedHotel);
    }
}
