package com.bitnc4.service;


import com.bitnc4.dto.NoticeDto;
import com.bitnc4.dto.QnaBoardDto;

import java.util.List;

public interface AdminQnaServeiceInter {
    public List<QnaBoardDto> getQnaList(int page);
    public List<Integer> getQnaCount(int currPage);
    public QnaBoardDto getQna(int num);

}
