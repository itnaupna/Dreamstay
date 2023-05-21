package com.bitnc4.service;

import com.bitnc4.dto.NoticeDto;
import com.bitnc4.mapper.AdminNoticeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class AdminNoticeService implements AdminNoticeServiceInter{

    @Autowired
    AdminNoticeMapper m;

    @Override
    public List<NoticeDto> getList(int page) {
        Map<String,Integer> map = new HashMap<>();
        final int PAGE_SIZE = 10;
        map.put("start",(page-1)*PAGE_SIZE);
        map.put("count",PAGE_SIZE);

        return m.getList(map);


    }

    @Override
    public List<Integer> getCount(int currPage) {
        final int PPP = 10;
        List<Integer> result = new ArrayList<>();
        int startPage,lastPage;
        if(currPage % PPP == 0){
            startPage = currPage-PPP+1;
            lastPage = currPage;
        }else {
            startPage = currPage / PPP * PPP + 1;
            lastPage = startPage + PPP - 1;
        }
        result.add(startPage);
        result.add(currPage);
        result.add(lastPage);
        result.add(m.getCount()/PPP + (m.getCount() % PPP > 0 ? 1 : 0));



        return result;
    }

    @Override
    public int writeNotice(NoticeDto dto) {

        m.writeNotice(dto);
        return dto.getNum();
    }

    @Override
    public int modifyNotice(NoticeDto dto) {
        m.modifyNotice(dto);
        return dto.getNum();
    }

    @Override
    public boolean deleteNotice(int num) {
        try{
            m.deleteNotice(num);
            return true;
        }catch (Exception e) {
            log.info("err : {}",e.getMessage());
            return false;
        }
    }

    @Override
    public NoticeDto readNotice(int num) {
        return m.readNotice(num);
    }

    @Override
    public Map<String, Integer> getCountData(int currentPage, String search) {
        Map<String, Integer> paging = new HashMap<>();
        int totalCount = m.getCountData(search);
        int perPage = 10; // 한페이지에 보여질 글 개수
        int perBlock = 10; // 페이징 개수
        int start = (currentPage - 1) * perPage;
        int totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
        int startPage = (currentPage - 1) / perBlock * perBlock + 1;
        int endPage= startPage + perBlock - 1;
        if(endPage > totalPage) {
            endPage = totalPage;
        }
        paging.put("perPage", perPage);
        paging.put("perBlock", perBlock);
        paging.put("start", start);
        paging.put("totalPage", totalPage);
        paging.put("startPage", startPage);
        paging.put("endPage", endPage);
        paging.put("currentPage", currentPage);
        return paging;
    }

    @Override
    public List<NoticeDto> getAllNotice(int start, int perpage, String search) {
        Map<String, Object> paging = new HashMap<>();
        paging.put("start", start);
        paging.put("perpage", perpage);
        paging.put("search", search);
        return m.getAllNotice(paging);
    }

    @Override
    public void viewCount(int num) {
        m.viewCount(num);
    }

    @Override
    public int getViewCount(int num) {
        return m.getViewCount(num);
    }
}
