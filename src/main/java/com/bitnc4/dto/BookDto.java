package com.bitnc4.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BookDto {

    int insert_member_num;
    String checkin;
    String checkout;
    String selectedHotel;
    int insert_roomnum;
    String peopleinfo;
    String memo;
    int total_price;
    int cardnum;



}
