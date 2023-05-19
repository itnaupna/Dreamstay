package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.mapper.QnaBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
   public List<QnaBoardDto> qnaList(int start, int perpage, String writer) {

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("perpage", perpage);
        map.put("writer", writer);


        return qnaBoardMapper.qnaList(map);
   }

    @Override
    public QnaBoardDto getQna(int num) {
        return qnaBoardMapper.getQna(num);
    }

    @Override
    public void deleteQna(int num) {
        qnaBoardMapper.deleteQna(num);
    }

    @Override
    public int getQnaCount(String witer) {
        return qnaBoardMapper.getQnaCount(witer);
    }

    @Override
    public boolean isEqualQna(int num, String qna_pass) {
        Map<String, Object> map=new HashMap<>();
        map.put("num", num);
        map.put("qna_pass", qna_pass);
        //비번이 맞으면 1->true반환, 틀리면 0->false반환
        boolean b=qnaBoardMapper.isEqualQna(map)==0?false:true;
        return b;
    }

    @Override
    public List<QnaBoardDto> searchQna(QnaBoardDto dto) {
        return qnaBoardMapper.searchQna(dto);
    }

    @Override
    public int searchQnaCount(String writer) {
        return qnaBoardMapper.searchQnaCount(writer);
    }


}
