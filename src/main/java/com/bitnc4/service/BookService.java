package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.CardDto;
import com.bitnc4.dto.MemberDto;
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

    @Override
    public int maxMemberNum() {
        return bookMapper.maxMemberNum();
    }

    @Override
    public void insert_nomember(MemberDto dto){
        bookMapper.insert_nomember(dto);
    }

    @Override
    public int insert_card(CardDto dto){
        return bookMapper.insert_card(dto);
    }

    @Override
    public String select_card(CardDto dto){
        return bookMapper.select_card(dto);
    }

    @Override
    public void insert_book(BookDto dto){
        bookMapper.insert_book(dto);
    }

    @Override
    public void noMemberDeleteData(int num) {
        bookMapper.noMemberDeleteData(num);
    }

}
