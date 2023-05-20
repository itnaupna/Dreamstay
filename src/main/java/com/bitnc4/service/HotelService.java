package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.mapper.HotelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class HotelService implements HotelServiceInter{

    @Autowired
    HotelMapper hotelMapper;
    @Override
    public List<HotelDto> getAllHotelData() {
        List<HotelDto> hotelList = hotelMapper.getAllHotelData();
        return hotelList;
    }


    @Override
    public List<Map<String, String>> getHotelData(int num) {
        return hotelMapper.getHotelData(num);
    }

    @Override
    public String[][] dividePhoto(List<Map<String, String>> list) {
        int cnt = 0;

        for(int i = 0; i < list.size(); i++) {
            if(list.get(i).get("roomphoto") != null && !list.get(i).get("roomphoto").equals("")) {
                cnt++;
            }
        }
        String[][] roomphoto = new String[cnt][];
        for(int i = 0; i < list.size(); i++) {
            if(list.get(i).get("roomphoto") != null && !list.get(i).get("roomphoto").equals("")) {
                roomphoto[i] = list.get(i).get("roomphoto").split(",");
            }
        }
        return roomphoto;
    }


}
