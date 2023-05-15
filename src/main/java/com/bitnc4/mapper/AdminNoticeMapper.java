package com.bitnc4.mapper;

import com.bitnc4.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminNoticeMapper {
    public List<NoticeDto> getList(Map m);
    public int getCount();
}

