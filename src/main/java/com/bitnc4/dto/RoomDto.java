package com.bitnc4.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RoomDto {
    int num;
    int hotelnum;
    String roomtype;
    int roomprice;
    String roommemo;
    String roomdetail;
    int islock;
    String roomphoto;
}
