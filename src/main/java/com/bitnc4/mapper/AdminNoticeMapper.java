package com.bitnc4.mapper;

import com.bitnc4.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminNoticeMapper {
    public List<NoticeDto> getList(Map m);
    public int getCount();
    public int writeNotice(NoticeDto dto);
    public int modifyNotice(NoticeDto dto);
    public void deleteNotice(int num);
    public NoticeDto readNotice(int num);

    public List<NoticeDto> getAllNotice(Map<String, Object> page);

    public int getCountData(String search);

    public void viewCount(int num);

    public int getViewCount(int num);
}

