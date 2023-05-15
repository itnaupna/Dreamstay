package com.bitnc4.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class HotelDto {

   private int num;
   private String name;
   private  String addr;
   private String phone;
   private String photo;
   private String memo;
}
