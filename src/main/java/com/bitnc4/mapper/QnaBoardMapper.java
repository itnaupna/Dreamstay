package com.bitnc4.mapper;


import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaBoardMapper {

    public void insertqna(QnaBoardDto dto);
    public void selectOneBoard(int idx);

    public MemberDto searchIdOfinfo(String writer);
   public QnaBoardDto qnaList(String writer);

}
