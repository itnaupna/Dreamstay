package com.bitnc4.mapper;

import com.bitnc4.dto.QnaBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminQnaMapper {
    public List<QnaBoardDto> getQnaList(Map map);
    public int getQnaCount(QnaBoardDto dto);
    public QnaBoardDto getQna(int num);
    public void upateQnaAnswer(QnaBoardDto dto);
    public List<QnaBoardDto> searchQnaList(QnaBoardDto dto);
    public int getUnanswerCount();
    public void delQnaAnswer(QnaBoardDto dto);

}
