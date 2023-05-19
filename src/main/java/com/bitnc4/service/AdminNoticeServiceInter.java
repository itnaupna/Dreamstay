package com.bitnc4.service;

import com.bitnc4.dto.NoticeDto;

import java.util.List;
import java.util.Map;

public interface AdminNoticeServiceInter {
    public List<NoticeDto> getList(int page);
    public List<Integer> getCount(int currPage);
    public int writeNotice(NoticeDto dto);
    public int modifyNotice(NoticeDto dto);
    public boolean deleteNotice(int num);
    public NoticeDto readNotice(int num);

    public Map<String, Integer> getCountData(int currentPage, String search);

    public List<NoticeDto> getAllNotice(int start, int perpage, String search);


    public void viewCount(int num);

    public int getViewCount(int num);
}
