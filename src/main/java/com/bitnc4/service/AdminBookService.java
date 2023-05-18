package com.bitnc4.service;

import com.bitnc4.mapper.AdminBookMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class AdminBookService implements AdminBookServiceInter{

    @Autowired
    AdminBookMapper m;

    @Override
    public List<Map<String, Object>> getAll() {
        return m.getAll();
    }

    @Override
    public boolean deleteBook(int num) {
        try{
            m.deleteBook(num);
            return true;
        }catch (Exception e) {
            log.info("err : {}", e.getMessage());
            return false;
        }
    }

    @Override
    public boolean checkinBook(int num) {
        try{
            m.checkinBook(num);
            return true;
        }catch (Exception e) {
            log.info("err : {}", e.getMessage());
            return false;
        }
    }
}
