package com.bitnc4.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.joda.time.DateTime;
@Data
@Alias("QnaBoardDto")
public class QnaBoardDto {
    private int num;
    private int category;
    private String subject;
    private String content;
    private String writer;
    private int count;
    private DateTime writeday;

}
