package com.bitnc4.service;

import com.bitnc4.dto.*;

import java.util.List;
import java.util.Map;

public interface BookServiceInter {


    public List<RoomDto> searchroom(BookDto dto);

    public String hotelname(int selectedHotel);

    /* public List<RoomDto> getroomlist();*/

    // 비회원 예약 출력
    public Map<String, String> getNomemberBookData(String searchnum, String bookpw);

    public int  maxMemberNum();

    public void  insert_nomember(MemberDto dto);
    

    int insert_card(CardDto dto);

    public String select_card (CardDto dto);

    void insert_book(BookDto dto);

    public void noMemberDeleteData(int num);
}
