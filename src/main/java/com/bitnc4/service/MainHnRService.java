package com.bitnc4.service;


import com.bitnc4.dto.HotelDto;
import com.bitnc4.mapper.AdminHnRMapper;
import com.bitnc4.mapper.MainHnRMapper;
import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MainHnRService implements MainHnrServiceInter{
/*    @Autowired
    AdminHnRMapper m;*/
    @Override
    public List<HotelDto> getHotels() {
        return Collections.emptyList();//m.getHotels();
    }
}
