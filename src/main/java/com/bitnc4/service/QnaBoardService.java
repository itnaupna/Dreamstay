package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.mapper.QnaBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaBoardService implements QnaBoardServiceInter {

    @Autowired
    private QnaBoardMapper qnaBoardMapper;


    @Override
    public void insertqna(QnaBoardDto dto) {
        qnaBoardMapper.insertqna(dto);
    }

    @Override
    public void selectOneBoard(int num) {

    }

    @Override
    public MemberDto searchIdOfinfo(String writer) {

        return qnaBoardMapper.searchIdOfinfo(writer);
    }


    @Override
   public QnaBoardDto qnaList(String writer) {
        return qnaBoardMapper.qnaList(writer);
   }


}
