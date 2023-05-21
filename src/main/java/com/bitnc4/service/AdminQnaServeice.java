package com.bitnc4.service;

import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.mapper.AdminQnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminQnaServeice implements AdminQnaServeiceInter{

    @Autowired
    AdminQnaMapper AdminqnaMapper;

    @Override
    public List<QnaBoardDto> getQnaList(int page, QnaBoardDto dto) {
        Map<String, Object> map = new HashMap<>();
        final int PAGE_SIZE = 10;
        if(page!=-1) {
            map.put("start", (page - 1) * PAGE_SIZE);
            map.put("count", PAGE_SIZE);
        }else{
            map.put("start",-1);
        }
        map.put("searchtype", dto.getSearchtype());
        map.put("keyword", dto.getKeyword());
        map.put("qna_type", dto.getQna_type());
        map.put("category", dto.getCategory());
        map.put("answer", dto.getAnswer());
        map.put("hotelname", dto.getHotelname());

        return AdminqnaMapper.getQnaList(map);
    }

    @Override
    public QnaBoardDto getQna(int num) {
        return AdminqnaMapper.getQna(num);
    }

    @Override
    public void upateQnaAnswer(QnaBoardDto dto) {
        AdminqnaMapper.upateQnaAnswer(dto);
    }

    @Override
    public List<QnaBoardDto> searchQnaList(QnaBoardDto dto) {
        return AdminqnaMapper.searchQnaList(dto);
    }

    // 미답변 게시물 수
    @Override
    public int getUnanswerCount() {
        return AdminqnaMapper.getUnanswerCount();
    }

    @Override
    public void delQnaAnswer(QnaBoardDto dto) {
        AdminqnaMapper.delQnaAnswer(dto);
    }

    @Override
    public List<Integer> getQnaCount(int currPage, QnaBoardDto dto) {
        final int PAGE_SIZE = 10;
        List<Integer> result = new ArrayList<>();
        int startPage, lastPage;

        int totalCount = AdminqnaMapper.getQnaCount(dto);
        if (totalCount == 0) {
            result.add(1); // 시작 페이지
            result.add(1); // 현재 페이지
            result.add(1); // 마지막 페이지
            result.add(1); // 전체 페이지 수
        } else {
            if (currPage % PAGE_SIZE == 0) {
                startPage = currPage - PAGE_SIZE + 1;
                lastPage = currPage;
            } else {
                startPage = currPage / PAGE_SIZE * PAGE_SIZE + 1;
                lastPage = (int) Math.ceil(currPage / (double) PAGE_SIZE) * PAGE_SIZE;
                if (lastPage > totalCount / PAGE_SIZE + 1) {
                    lastPage = totalCount / PAGE_SIZE + 1;
                }
            }
            result.add(startPage);
            result.add(currPage);
            result.add(lastPage);
            result.add((int) Math.ceil(totalCount / (double) PAGE_SIZE));
        }
        return result;
    }


}
