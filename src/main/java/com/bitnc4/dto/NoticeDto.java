package com.bitnc4.dto;

import lombok.Data;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@ToString
public class NoticeDto {
    int num;
    String subject;
    String content;
    String writer;
    int count;
    Timestamp writeday;


}
