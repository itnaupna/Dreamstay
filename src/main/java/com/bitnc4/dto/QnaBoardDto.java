package com.bitnc4.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("QnaBoardDto")
public class QnaBoardDto {
    private int num;
    private int category;
    private String subject;
    private String content;
    private String writer;
    private int count;
    private Timestamp writeday;
    private String hotelname;
    private String qna_name;
    private String qna_email;
    private String qna_phone;
    private String category_txt;

}