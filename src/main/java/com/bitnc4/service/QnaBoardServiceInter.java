package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;

import java.util.List;

public interface QnaBoardServiceInter {
    public void insertqna(QnaBoardDto dto);
    public void  selectOneBoard(int num);
    public MemberDto searchIdOfinfo(String writer);
    public List<QnaBoardDto> qnaList(String writer);
    public QnaBoardDto getQna (int num);
    public void deleteQna(int num);
}
