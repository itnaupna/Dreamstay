package com.bitnc4.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BookDto {

    Date checkin;
    Date checkout;
    String selectedHotel;
}
