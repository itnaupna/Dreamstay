package com.bitnc4.service;

import com.bitnc4.mapper.AdminBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminBookService implements AdminBookServiceInter{

    @Autowired
    AdminBookMapper m;

    @Override
    public List<Map<String, Object>> getAll() {
        return m.getAll();
    }
}
