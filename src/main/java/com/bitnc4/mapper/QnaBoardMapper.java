package com.bitnc4.mapper;


import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QnaBoardMapper {

    public void insertqna(QnaBoardDto dto);
    public void selectOneBoard(int idx);

    public MemberDto searchIdOfinfo(String writer);
    //public List<QnaBoardDto> qnaList(String writer);
    public List<QnaBoardDto> qnaList(Map<String, Object> map);
    public QnaBoardDto getQna (int num);
    public void deleteQna(int num);
    //관리자가 답변
   /* public void upateQnaAnswer(QnaBoardDto dto);*/
    public int getQnaCount(String witer);
    public void insertQnaPhoto(QnaBoardDto dto);
    public int isEqualQna(Map <String, Object> map);
    public List<QnaBoardDto> searchQna(Map <String, Object> map);
    public int searchQnaCount(Map <String, Object> map);

}
