package com.bitnc4.service;


import com.bitnc4.dto.QnaBoardDto;

import java.util.List;

public interface AdminQnaServeiceInter {
    public List<QnaBoardDto> getQnaList(int page, QnaBoardDto dto);
    public List<Integer> getQnaCount(int currPage, QnaBoardDto dto);
    public QnaBoardDto getQna(int num);
    public void upateQnaAnswer(QnaBoardDto dto);
    public List<QnaBoardDto> searchQnaList(QnaBoardDto dto);
    public int getUnanswerCount();
    public void delQnaAnswer(QnaBoardDto dto);

}
