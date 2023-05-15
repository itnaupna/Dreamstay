package com.bitnc4.mapper;


import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QnaBoardMapper {

    public void insertqna(QnaBoardDto dto);
    public void selectOneBoard(int idx);

    public MemberDto searchIdOfinfo(String writer);
   public List<QnaBoardDto> qnaList(String writer);
   public QnaBoardDto getQna (int num);
    public void deleteQna(int num);

    public void upateQnaAnswer(QnaBoardDto dto);


}
