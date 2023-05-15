package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<String, String> getNomemberBookData(String searchnum, String bookpw) {
        Map<String, String> data = new HashMap<>();
        data.put("num", searchnum);
        data.put("pw", bookpw);
        return bookMapper.getNomemberBookData(data);
    }
}
