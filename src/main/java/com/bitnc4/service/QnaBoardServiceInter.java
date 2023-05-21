package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;

import java.util.List;
import java.util.Map;

public interface QnaBoardServiceInter {
    public void insertqna(QnaBoardDto dto);
    public void  selectOneBoard(int num);
    public MemberDto searchIdOfinfo(String writer);
    public List<QnaBoardDto> qnaList(int start,int perpage,String writer);
    public QnaBoardDto getQna (int num);
    public void deleteQna(int num);
    public int getQnaCount(String witer);
    public boolean isEqualQna(int num, String qna_pass);
    public List<QnaBoardDto> searchQna(int start, int perpage,String writer,String keyword,String searchtype);
    public int searchQnaCount(String writer,String keyword,String searchtype);

}
