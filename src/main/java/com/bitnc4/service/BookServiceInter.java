package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.RoomDto;

import java.util.List;

public interface BookServiceInter {

    BookDto searchroomdto();
    public List<RoomDto> getroomlist();
}
