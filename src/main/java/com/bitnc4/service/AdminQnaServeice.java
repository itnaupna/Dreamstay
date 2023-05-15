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

    /*@Override
    public List<QnaBoardDto> getQnaList(int page) {
        Map<String,Integer> map = new HashMap<>();
        final int PAGE_SIZE = 10;
        map.put("start",(page-1)*PAGE_SIZE);
        map.put("count",PAGE_SIZE);

        return AdminqnaMapper.getQnaList(map);
    }*/

    @Override
    public List<QnaBoardDto> getQnaList(int page, QnaBoardDto dto) {
        Map<String, Object> map = new HashMap<>();
        final int PAGE_SIZE = 10;
        map.put("start", (page - 1) * PAGE_SIZE);
        map.put("count", PAGE_SIZE);
        map.put("searchtype", dto.getSearchtype());
        map.put("keyword", dto.getKeyword());
        map.put("qna_type", dto.getQna_type());
        map.put("category", dto.getCategory());
        map.put("answer", dto.getAnswer());

        return AdminqnaMapper.getQnaList(map);
    }

   /* @Override
    public List<Integer> getQnaCount(int currPage) {
        final int PPP = 10;
        List<Integer> result = new ArrayList<>();
        int startPage,lastPage;
        if(currPage % PPP == 0){
            startPage = currPage-PPP+1;
            lastPage = currPage;
        }else {
            startPage = currPage / PPP * PPP + 1;
            int iLastPage = AdminqnaMapper.getQnaCount()/10+1;
            double dLastPage = AdminqnaMapper.getQnaCount()/10+1;
            if(iLastPage<dLastPage)
            lastPage = iLastPage+1;
            else lastPage = iLastPage;
       }
        result.add(startPage);
        result.add(currPage);
        result.add(lastPage);
        result.add(AdminqnaMapper.getQnaCount()/PPP + (AdminqnaMapper.getQnaCount() % PPP));

        return result;
    }*/



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
