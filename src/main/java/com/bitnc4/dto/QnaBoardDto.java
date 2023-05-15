package com.bitnc4.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Date;
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
    private String reservenum;
    private String useday;
    private String qna_type;
    private String qna_photo;
    private String answer;
    private String answer_text;

    //admin에서 search할 변수
    private String searchtype; // 검색타입
    private String keyword; // 검색 내용

}
