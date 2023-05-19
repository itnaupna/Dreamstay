package com.bitnc4.mapper;



import com.bitnc4.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BookMapper {
    public List<RoomDto> searchroom(BookDto dto);

    public  String hotelname (int selectedHotel);

    // 비회원 예약 출력
    public Map<String, String> getNomemberBookData(Map<String, String> data);

    //생성된 아이디중 제일 높은값 가져오기
    public int maxMemberNum();

    public void insert_nomember (MemberDto dto);

    public int  insert_card(CardDto dto);

    public String select_card (CardDto dto);

    public void insert_book (BookDto dto);

    public void noMemberDeleteData(int num);
}
