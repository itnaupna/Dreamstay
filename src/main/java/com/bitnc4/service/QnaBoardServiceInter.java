package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;

public interface QnaBoardServiceInter {
    public void insertqna(QnaBoardDto dto);
    public void  selectOneBoard(int num);
    public MemberDto searchIdOfinfo(String writer);

    public QnaBoardDto qnaList(String writer);
}
