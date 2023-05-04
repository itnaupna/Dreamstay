package com.bitnc4.dto;

import lombok.Data;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@ToString
public class ChatDto {
    int num;
    int membernum;
    String msg;
    Timestamp date;
    int recv;
    int memberview;
    int adminview;

}
