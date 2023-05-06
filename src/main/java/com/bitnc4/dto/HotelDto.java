package com.bitnc4.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class HotelDto {

    int num;
    String name;
    String addr;
    String phone;
    String photo;
    String memo;
}
