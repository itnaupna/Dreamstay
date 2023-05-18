package com.bitnc4.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminBookMapper {
    public List<Map<String,Object>> getAll();
    public void checkinBook(int num);
    public void deleteBook(int num);
}
